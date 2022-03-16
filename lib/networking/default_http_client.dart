import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:nhg_layout/networking/networking.dart';
import 'package:path/path.dart';

class DefaultHttpClient {
  DefaultHttpClient._privateConstructor();

  static final DefaultHttpClient _instance =
      DefaultHttpClient._privateConstructor();
  static const String host = 'host';
  static const String basicUrl = '$host/api/v1';
  static final HttpClient client = HttpClient();

  factory DefaultHttpClient() {
    return _instance;
  }

  Future<dynamic> getRequest(
    BuildContext context,
    String endPoint, {
    String? token,
  }) async {
    try {
      HttpClientRequest request =
          await client.getUrl(Uri.parse(basicUrl + endPoint));
      formatHeader(request, token);
      HttpClientResponse response = await request.close();
      clientHandlingHelper(response: response);
    } on SocketException {
      throw ConnectionException();
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> postRequest(
    BuildContext context,
    String endPoint,
    Map<String, String> requestBody, {
    String? token,
  }) async {
    try {
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(basicUrl + endPoint),
      )
        ..headers.addAll({
          "Content-type": "multipart/form-data",
          "Authorization": token == null ? "" : "Bearer $token",
        })
        ..fields.addAll(requestBody);

      var response = await request.send();
      clientHandlingHelper(streamedResponse: response, isStreamed: true);
    } on SocketException {
      throw ConnectionException();
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> postRequestWithImage(
    BuildContext context,
    String endPoint,
    Map<String, dynamic> requestBody,
    File image, {
    String? token,
  }) async {
    try {
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(basicUrl + endPoint),
      );

      request.headers.addAll({
        "Content-type": "multipart/form-data",
        "Authorization": token == null ? "" : "Bearer $token",
      });

      Uint8List imageData = await image.readAsBytes();

      Uint8List compressedImageData =
          await FlutterImageCompress.compressWithList(
        imageData,
        minHeight: 640,
        minWidth: 640,
        quality: 100,
      );

      String filename = basename(image.path);

      http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
        'file', //field name
        compressedImageData,
        filename: filename,
        contentType: MediaType("image", filename),
      );

      request.files.add(multipartFile);

      http.StreamedResponse res = await request.send();

      return clientHandlingHelper(
        streamedResponse: res,
        isStreamed: true,
      );
    } on SocketException {
      throw ConnectionException();
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  void formatHeader(HttpClientRequest request, String? token) {
    request.headers.set('content-type', 'application/json');
    request.headers.set('Accept', 'application/json');
    request.headers.set('Authorization', token == null ? "" : "Bearer $token");
  }

  Future<dynamic> clientHandlingHelper({
    HttpClientResponse? response,
    http.StreamedResponse? streamedResponse,
    // Response dioResponse,
    bool isStreamed = false,
    bool shouldDecode = true,
  }) async {
    final statusCode =
        isStreamed ? streamedResponse!.statusCode : response!.statusCode;

    final resBodyJson = isStreamed
        ? await streamedResponse!.stream.transform(utf8.decoder).join()
        : await response!.transform(utf8.decoder).join();

    final responseBody = jsonDecode(resBodyJson);

    if (statusCode >= 200 && statusCode < 299) {
      // if (response.body.isEmpty) {
      //   return [];
      // } else {
      //   if (shouldDecode) {
      //     return jsonDecode(response.body);
      //   } else {
      //     return response.body;
      //   }
      // }
      return responseBody;
    } else if (statusCode >= 400 && statusCode < 500) {
      if (statusCode == 400) return responseBody;
      if (statusCode == 401) throw UnauthenticatedException();
      throw ClientErrorException();
    } else if (statusCode >= 500 && statusCode < 600) {
      throw ServerErrorException();
    } else {
      throw UnknownException();
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/utils/build_toast.dart';

class NetworkProvider {
  late StreamSubscription<ConnectivityResult> _subscription;
  late StreamController<ConnectivityResult> _networkStatusController;

  StreamSubscription<ConnectivityResult> get subscription => _subscription;
  StreamController<ConnectivityResult> get networkStatusController =>
      _networkStatusController;

  NetworkProvider() {
    _networkStatusController = StreamController<ConnectivityResult>();
    _invokeNetworkStatusListen();
  }

  void _invokeNetworkStatusListen() async {
    _networkStatusController.sink
        .add((await Connectivity().checkConnectivity()));
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        defaultToast(AppStrings.internetUnavailableMessage);
        _networkStatusController.sink.add(result);
      } else {
        bool connected = await _checkRealConnectionStatus();
        if (!connected) {
          _networkStatusController.sink.add(ConnectivityResult.none);
        } else {
          if (result == ConnectivityResult.mobile) {
            defaultToast(AppStrings.connectedToDataMessage);
          } else {
            defaultToast(AppStrings.connectedToWifiMessage);
          }
          _networkStatusController.sink.add(result);
        }
      }
    });
  }

  Future<bool> _checkRealConnectionStatus() async {
    try {
      List<InternetAddress> addressList =
          await InternetAddress.lookup('google.com');

      if (addressList.isNotEmpty || addressList[0].rawAddress.isNotEmpty) {
        // connected and has internet
        return true;
      } else {
        defaultToast(AppStrings.internetUnavailableMessage);
        return false;
      }
    } on SocketException catch (_) {
      defaultToast(AppStrings.internetUnavailableMessage);
      return false;
    }
  }

  void disposeStreams() {
    _subscription.cancel();
    _networkStatusController.close();
  }
}

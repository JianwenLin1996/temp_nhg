import 'package:nhg_layout/models/item/item_delivery_location.dart';
import 'package:nhg_layout/models/item/item_delivery_order.dart';
import 'package:nhg_layout/models/models.dart';

class ItemDetail {
  // main info
  String id;
  ItemStatus status;
  DateTime createdAt;
  ItemDeliveryLocation location;
  List<String> imageList;
  List<ItemType> typeList;

  // detail info
  String personInCharge;
  String contact;

  // collected info
  ItemDeliveryOrder? deliveryOrder;
  DateTime? closedAt;
  List<ItemType>? collectedList;
  String? remark;
  String? sentBy;
  String? checkedBy;

  ItemDetail({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.location,
    required this.imageList,
    required this.typeList,
    required this.personInCharge,
    required this.contact,
    this.sentBy,
    this.deliveryOrder,
    this.closedAt,
    this.collectedList,
    this.remark,
    this.checkedBy,
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        id: json['id'],
        status: ItemStatus.fromJson(json['name']),
        createdAt: json['created_at'],
        closedAt: json['closedAt'],
        location: json['location'],
        personInCharge: json['person_in_charge'],
        contact: json['contact'],
        sentBy: json['sent_by'],
        deliveryOrder: json['delivery_order'],
        checkedBy: json['checked_by'],
        remark: json['remark'],
        imageList: List<String>.from(
            List<Map<String, dynamic>>.from(json['images'])
                .map((e) => e['url'])
                .toList()),
        typeList: List<ItemType>.from(
            List<Map<String, dynamic>>.from(json['list'])
                .map((e) => e['url'])
                .toList()),
        collectedList: List<ItemType>.from(
            List<Map<String, dynamic>>.from(json['list'])
                .map((e) => e['url'])
                .toList()),
      );
}

import 'package:nhg_layout/models/models.dart';

class Item {
  String id;
  ItemStatus status;
  DateTime createdAt;
  String location;
  List<ItemType> typeList;

  Item({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.location,
    required this.typeList,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        status: ItemStatus.fromJson(json['name']),
        createdAt: json['created_at'],
        location: json['location'],
        typeList: List<ItemType>.from(
            List<Map<String, dynamic>>.from(json['list'])
                .map((e) => e['url'])
                .toList()),
      );
}

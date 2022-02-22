import 'package:nhg_layout/models/models.dart';

class Item {
  String id;
  ItemStatus status;
  DateTime createdAt;
  DateTime? closedAt;
  String location;
  String image;
  List<ItemType> typeList;

  Item({
    required this.id,
    required this.status,
    required this.createdAt,
    this.closedAt,
    required this.location,
    required this.image,
    required this.typeList,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        status: ItemStatus.fromJson(json['name']),
        createdAt: json['created_at'],
        closedAt: json['closedAt'],
        location: json['location'],
        image: json['image'],
        typeList: List<ItemType>.from(
            List<Map<String, dynamic>>.from(json['list'])
                .map((e) => e['url'])
                .toList()),
      );
}

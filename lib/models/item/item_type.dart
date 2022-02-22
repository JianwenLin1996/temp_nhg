class ItemType {
  int id;
  String name;
  int amount;

  ItemType({
    required this.id,
    required this.name,
    required this.amount,
  });

  factory ItemType.fromJson(Map<String, dynamic> json) =>
      ItemType(id: json['id'], name: json['name'], amount: json['amount']);
}

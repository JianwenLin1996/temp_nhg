class ItemDeliveryLocation {
  String name;
  String address;

  ItemDeliveryLocation({
    required this.name,
    required this.address,
  });

  factory ItemDeliveryLocation.fromJson(Map<String, dynamic> json) =>
      ItemDeliveryLocation(name: json['name'], address: json['address']);
}

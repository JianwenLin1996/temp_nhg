class ItemDeliveryOrder {
  String image;
  String number;

  ItemDeliveryOrder({
    required this.image,
    required this.number,
  });

  factory ItemDeliveryOrder.fromJson(Map<String, dynamic> json) =>
      ItemDeliveryOrder(image: json['image'], number: json['number']);
}

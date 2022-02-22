class ItemStatus {
  int id;
  String label;

  ItemStatus({
    required this.id,
    required this.label,
  });

  factory ItemStatus.fromJson(Map<String, dynamic> json) => ItemStatus(
        id: json['id'],
        label: json['label'],
      );
}

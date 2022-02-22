class NotificationItem {
  int id;
  String? notificationIcon;
  String notificationMessage;
  DateTime notificationCreatedAt;
  String? notificationBy;
  NotificationItem({
    this.id = 0,
    this.notificationIcon,
    required this.notificationMessage,
    required this.notificationCreatedAt,
    this.notificationBy,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      NotificationItem(
          id: json['id'],
          notificationIcon: json['icon'],
          notificationMessage: json['message'],
          notificationCreatedAt: json['created_at'],
          notificationBy: json['created_by']);
}

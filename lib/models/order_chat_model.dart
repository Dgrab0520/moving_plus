class OrderChat {
  String order_id;
  String address;
  String service_type;
  String order_status;
  String order_date;

  OrderChat({
    required this.order_id,
    required this.address,
    required this.service_type,
    required this.order_status,
    required this.order_date,
  });

  factory OrderChat.fromJson(Map<String, dynamic> json) {
    return OrderChat(
      order_id: json['order_id'] == null ? "" : json['order_id'] as String,
      address: json['address'] == null ? "" : json['address'] as String,
      service_type:
          json['service_type'] == null ? "" : json['service_type'] as String,
      order_status:
          json['order_status'] == null ? "" : json['order_status'] as String,
      order_date:
          json['order_date'] == null ? "" : json['order_date'] as String,
    );
  }
}

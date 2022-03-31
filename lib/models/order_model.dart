class Order {
  String order_id;
  String user_id;
  String user_name;
  String user_phone;
  String address;
  String address_detail;
  String space_type;
  String space_size;
  String service_type;
  String date_start;
  String date_end;
  String time;
  String item1;
  String item2;
  String item3;
  String item4;
  String item5;
  String request_detail;
  String request_img1;
  String request_img2;
  String request_img3;
  String order_date;
  String order_status;
  String index;
  String isOrder;

  Order({
    required this.order_id,
    required this.user_id,
    required this.user_name,
    required this.user_phone,
    required this.address,
    required this.address_detail,
    required this.space_type,
    required this.space_size,
    required this.service_type,
    required this.date_start,
    required this.date_end,
    required this.time,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.request_detail,
    required this.request_img1,
    required this.request_img2,
    required this.request_img3,
    required this.order_date,
    required this.order_status,
    required this.index,
    required this.isOrder,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      order_id: json['order_id'] == null ? "" : json['order_id'] as String,
      user_id: json['user_id'] == null ? "" : json['user_id'] as String,
      user_name: json['user_name'] == null ? "" : json['user_name'] as String,
      user_phone:
          json['user_phone'] == null ? "" : json['user_phone'] as String,
      address: json['address'] == null ? "" : json['address'] as String,
      address_detail: json['address_detail'] == null
          ? ""
          : json['address_detail'] as String,
      space_type:
          json['space_type'] == null ? "" : json['space_type'] as String,
      space_size:
          json['space_size'] == null ? "" : json['space_size'] as String,
      service_type:
          json['service_type'] == null ? "" : json['service_type'] as String,
      date_start:
          json['date_start'] == null ? "" : json['date_start'] as String,
      date_end: json['date_end'] == null ? "" : json['date_end'] as String,
      time: json['time'] == null ? "" : json['time'] as String,
      item1: json['item1'] == null ? "" : json['item1'] as String,
      item2: json['item2'] == null ? "" : json['item2'] as String,
      item3: json['item3'] == null ? "" : json['item3'] as String,
      item4: json['item4'] == null ? "" : json['item4'] as String,
      item5: json['item5'] == null ? "" : json['item5'] as String,
      request_detail: json['request_detail'] == null
          ? ""
          : json['request_detail'] as String,
      request_img1:
          json['request_img1'] == null ? "" : json['request_img1'] as String,
      request_img2:
          json['request_img2'] == null ? "" : json['request_img2'] as String,
      request_img3:
          json['request_img3'] == null ? "" : json['request_img3'] as String,
      order_date:
          json['order_date'] == null ? "" : json['order_date'] as String,
      order_status:
          json['order_status'] == null ? "" : json['order_status'] as String,
      index: json['index'] == null ? "" : json['index'] as String,
      isOrder: json['isOrder'] == null ? "None" : json['isOrder'] as String,
    );
  }
}

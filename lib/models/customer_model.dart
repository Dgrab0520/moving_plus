class Customer{
  String cus_id;
  String cus_recom;
  String point;
  String cus_token;
  String register_Date;
  String index;

  Customer({
    required this.cus_id,
    required this.cus_recom,
    required this.point,
    required this.cus_token,
    required this.register_Date,
    required this.index,
  });

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      cus_id: json['cus_id'] == null ? "" : json['cus_id'] as String,
      cus_recom: json['cus_recom'] == null ? "" : json['cus_recom'] as String,
      point: json['point'] == null ? "" : json['point'] as String,
      cus_token: json['cus_token'] == null ? "" : json['cus_token'] as String,
      register_Date: json['register_Date'] == null ? "" : json['register_Date'] as String,
      index: json['index'] == null ? "" : json['index'] as String,
    );
  }
}
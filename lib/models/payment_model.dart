class Payment{
  String estimate_id;
  String final_price;
  String final_fee;
  String final_date;
  String status;
  String index;
  String register_date;
  String estimate_detail;
  String user_id;
  String address;
  String address_detail;
  String service_type;


  Payment({
    required this.estimate_id,
    required this.final_price,
    required this.final_fee,
    required this.final_date,
    required this.status,
    required this.index,
    required this.register_date,
    required this.estimate_detail,
    required this.user_id,
    required this.address,
    required this.address_detail,
    required this.service_type,
  });


  factory Payment.fromJson(Map<String, dynamic> json){
    return Payment(
      estimate_id : json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      final_price : json['final_price'] == null ? "" : json['final_price'] as String,
      final_fee : json['final_fee'] == null ? "" : json['final_fee'] as String,
      final_date : json['final_date'] == null ? "" : json['final_date'] as String,
      status : json['status'] == null ? "" : json['status'] as String,
      index : json['index'] == null ? "" : json['index'] as String,
      register_date : json['register_date'] == null ? "" : json['register_date'] as String,
      estimate_detail : json['estimate_detail'] == null ? "" : json['estimate_detail'] as String,
      user_id : json['user_id'] == null ? "" : json['user_id'] as String,
      address : json['address'] == null ? "" : json['address'] as String,
      address_detail : json['address_detail'] == null ? "" : json['address_detail'] as String,
      service_type : json['service_type'] == null ? "" : json['service_type'] as String,
    );
  }
}
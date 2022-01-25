class Estimate{
  String pro_id;
  String estimate_id;
  String order_id;
  String estimate_price;
  String estimate_detail;
  String estimate_date;
  String estimate_status;
  String index;

  Estimate({
    required this.pro_id,
    required this.estimate_id,
    required this.order_id,
    required this.estimate_price,
    required this.estimate_detail,
    required this.estimate_date,
    required this.estimate_status,
    required this.index,
  });

  factory Estimate.fromJson(Map<String, dynamic> json){
    return Estimate(
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      estimate_id: json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      order_id: json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      estimate_price: json['estimate_price'] == null ? "" : json['estimate_price'] as String,
      estimate_detail: json['estimate_detail'] == null ? "" : json['estimate_detail'] as String,
      estimate_date: json['estimate_date'] == null ? "" : json['estimate_date'] as String,
      estimate_status: json['estimate_status'] == null ? "" : json['estimate_status'] as String,
      index: json['index'] == null ? "" : json['index'] as String,
    );
  }
}
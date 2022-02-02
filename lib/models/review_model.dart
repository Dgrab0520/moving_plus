class Review{
  String review_id;
  String pro_id;
  String cus_id;
  String review_point;
  String review_content;
  String review_reply;
  String register_date;

  Review({
    required this.review_id,
    required this.pro_id,
    required this.cus_id,
    required this.review_point,
    required this.review_content,
    required this.review_reply,
    required this.register_date,
  });

  factory Review.fromJson(Map<String, dynamic> json){
    return Review(
      review_id: json['review_id'] == null ? "" : json['review_id'] as String,
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      cus_id: json['cus_id'] == null ? "" : json['cus_id'] as String,
      review_point: json['review_point'] == null ? "" : json['review_point'] as String,
      review_content: json['review_content'] == null ? "" : json['review_content'] as String,
      review_reply: json['review_reply'] == null ? "" : json['review_reply'] as String,
      register_date: json['register_date'] == null ? "" : json['register_date'] as String,
    );
  }
}



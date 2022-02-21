class TransAction {
  int id;
  String estimateId;
  String proId;
  String profileImg;
  String finalFee;
  String finalDate;
  String status;
  String proName;
  String proServiceType;
  double reviewRating;

  TransAction({
    required this.id,
    required this.estimateId,
    required this.proId,
    required this.profileImg,
    required this.finalFee,
    required this.finalDate,
    required this.status,
    required this.proName,
    required this.proServiceType,
    required this.reviewRating,
  });

  factory TransAction.fromJson(Map<String, dynamic> json) {
    return TransAction(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      estimateId:
          json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      proId: json['pro_id'] == null ? "" : json['pro_id'] as String,
      profileImg:
          json['profile_img'] == null ? "" : json['profile_img'] as String,
      finalFee: json['final_fee'] == null ? "" : json['final_fee'] as String,
      finalDate: json['final_date'] == null ? "" : json['final_date'] as String,
      status: json['status'] == null ? "" : json['status'] as String,
      proName: json['com_name'] == null ? "" : json['com_name'] as String,
      proServiceType:
          json['service_type'] == null ? "" : json['service_type'] as String,
      reviewRating: json['review_point'] == null
          ? 0.0
          : double.parse(json['review_point']),
    );
  }
}

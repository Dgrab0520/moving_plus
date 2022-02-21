class CusTransAction {
  int id;
  String estimateId;
  String proId;
  String profileImg;
  double reviewPoint;
  String reviewContent;
  DateTime registerDate;
  String comName;
  String proServiceType;

  CusTransAction({
    required this.id,
    required this.estimateId,
    required this.proId,
    required this.profileImg,
    required this.reviewPoint,
    required this.reviewContent,
    required this.registerDate,
    required this.comName,
    required this.proServiceType,
  });

  factory CusTransAction.fromJson(Map<String, dynamic> json) {
    return CusTransAction(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      estimateId:
          json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      proId: json['pro_id'] == null ? "" : json['pro_id'] as String,
      profileImg:
          json['profile_img'] == null ? "" : json['profile_img'] as String,
      reviewPoint: json['review_point'] == null
          ? 0.0
          : double.parse(json['review_point']),
      reviewContent: json['review_content'] == null
          ? ""
          : json['review_content'] as String,
      registerDate: DateTime.parse(json['register_date']),
      comName: json['com_name'] == null ? "" : json['com_name'] as String,
      proServiceType:
          json['service_type'] == null ? "" : json['service_type'] as String,
    );
  }
}

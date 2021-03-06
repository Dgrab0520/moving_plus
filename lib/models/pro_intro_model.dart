class Pro_Intro {
  String pro_id;
  String pro_recom;
  String pro_name;
  String pro_phone;
  String pro_email;
  String profile_img;
  String com_no;
  String com_name;
  String pro_service1;
  String pro_service2;
  String pro_service3;
  String pro_service4;
  String pro_service5;
  String pro_area1;
  String pro_area2;
  String pro_area3;
  String pro_area4;
  String pro_area5;
  String pro_token;
  String index;
  String pro_intro;
  String pro_basic;
  String pro_career;
  String pro_pay;
  String pro_portfolio;
  int estimateCount;

  Pro_Intro({
    required this.pro_id,
    required this.pro_recom,
    required this.pro_name,
    required this.pro_phone,
    required this.pro_email,
    required this.profile_img,
    required this.com_no,
    required this.com_name,
    required this.pro_service1,
    required this.pro_service2,
    required this.pro_service3,
    required this.pro_service4,
    required this.pro_service5,
    required this.pro_area1,
    required this.pro_area2,
    required this.pro_area3,
    required this.pro_area4,
    required this.pro_area5,
    required this.pro_token,
    required this.index,
    required this.pro_intro,
    required this.pro_basic,
    required this.pro_career,
    required this.pro_pay,
    required this.pro_portfolio,
    required this.estimateCount,
  });

  factory Pro_Intro.fromJson(Map<String, dynamic> json) {
    return Pro_Intro(
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      pro_recom: json['pro_recom'] == null ? "" : json['pro_recom'] as String,
      pro_name: json['pro_name'] == null ? "" : json['pro_name'] as String,
      pro_phone: json['pro_phone'] == null ? "" : json['pro_phone'] as String,
      pro_email: json['pro_email'] == null ? "" : json['pro_email'] as String,
      profile_img:
          json['profile_img'] == null ? "" : json['profile_img'] as String,
      com_no: json['com_no'] == null ? "" : json['com_no'] as String,
      com_name: json['com_name'] == null ? "" : json['com_name'] as String,
      pro_service1:
          json['pro_service1'] == null ? "" : json['pro_service1'] as String,
      pro_service2:
          json['pro_service2'] == null ? "" : json['pro_service2'] as String,
      pro_service3:
          json['pro_service3'] == null ? "" : json['pro_service3'] as String,
      pro_service4:
          json['pro_service4'] == null ? "" : json['pro_service4'] as String,
      pro_service5:
          json['pro_service5'] == null ? "" : json['pro_service5'] as String,
      pro_area1: json['pro_area1'] == null ? "" : json['pro_area1'] as String,
      pro_area2: json['pro_area2'] == null ? "" : json['pro_area2'] as String,
      pro_area3: json['pro_area3'] == null ? "" : json['pro_area3'] as String,
      pro_area4: json['pro_area4'] == null ? "" : json['pro_area4'] as String,
      pro_area5: json['pro_area5'] == null ? "" : json['pro_area5'] as String,
      pro_token: json['pro_token'] == null ? "" : json['pro_token'] as String,
      index: json['index'] == null ? "" : json['index'] as String,
      pro_intro: json['pro_intro'] == null ? "" : json['pro_intro'] as String,
      pro_basic: json['pro_basic'] == null ? "" : json['pro_basic'] as String,
      pro_career:
          json['pro_career'] == null ? "" : json['pro_career'] as String,
      pro_pay: json['pro_pay'] == null ? "" : json['pro_pay'] as String,
      pro_portfolio:
          json['pro_portfolio'] == null ? "" : json['pro_portfolio'] as String,
      estimateCount: json['count'] == null ? 0 : int.parse(json['count']),
    );
  }
}

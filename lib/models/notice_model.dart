class Notice {
  int id;
  String noticeId;
  String noticeType;
  String noticeTitle;
  String noticeContent;
  String noticeContentImg;
  String noticeStatus;
  String registerDate;
  String index;

  Notice({
    required this.id,
    required this.noticeId,
    required this.noticeType,
    required this.noticeTitle,
    required this.noticeContent,
    required this.noticeContentImg,
    required this.noticeStatus,
    required this.registerDate,
    required this.index,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: int.parse(json['id']),
      noticeId: json['notice_id'] == null ? '' : json['notice_id'] as String,
      noticeType:
          json['notice_type'] == null ? '' : json['notice_type'] as String,
      noticeTitle:
          json['notice_title'] == null ? '' : json['notice_title'] as String,
      noticeContent: json['notice_content'] == null
          ? ''
          : json['notice_content'] as String,
      noticeContentImg: json['notice_content_img'] == null
          ? ''
          : json['notice_content_img'] as String,
      noticeStatus:
          json['notice_status'] == null ? '' : json['notice_status'] as String,
      registerDate:
          json['register_date'] == null ? '' : json['register_date'] as String,
      index: json['index'] == null ? '' : json['index'] as String,
    );
  }
}

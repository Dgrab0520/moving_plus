class Alarm {
  int id;
  String callerName;
  String receiverName;
  String alarmType;
  String receptionTime;
  String order_id;
  String mainType;

  Alarm({
    required this.id,
    required this.callerName,
    required this.receiverName,
    required this.alarmType,
    required this.receptionTime,
    required this.order_id,
    required this.mainType,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      id: int.parse(json['id']),
      callerName: json['callerName'] as String,
      receiverName: json['receiverName'] as String,
      alarmType: json['alarmType'] as String,
      receptionTime: json['receptionTime'] as String,
      order_id: json['order_id'] == null ? '' : json['order_id'] as String,
      mainType: json['mainType'] == null ? '' : json['mainType'] as String,
    );
  }
}

class ChatRoom {
  String estimateId;
  String userName;
  String serviceType;
  String area;
  String createAt;
  String lastChat;
  String chatType;
  String token;
  String proId;

  ChatRoom({
    required this.estimateId,
    required this.userName,
    required this.serviceType,
    required this.area,
    required this.createAt,
    required this.lastChat,
    required this.chatType,
    required this.token,
    required this.proId,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      estimateId:
          json['estimate_id'] == null ? "" : json['estimate_id'] as String,
      userName: json['user_id'] == null ? "" : json['user_id'] as String,
      serviceType:
          json['service_type'] == null ? "" : json['service_type'] as String,
      area: json['address'] == null ? "" : json['address'] as String,
      createAt: json['createAt'] == null ? "" : json['createAt'] as String,
      lastChat: json['lastChat'] == null ? "" : json['lastChat'] as String,
      chatType: json['chatType'] == null ? "" : json['chatType'] as String,
      token: json['token'] == null ? "" : json['token'] as String,
      proId: json['pro_id'] == null ? "" : json['pro_id'] as String,
    );
  }
}

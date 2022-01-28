class ChatRoom {
  String estimateId;
  String userName;
  String serviceType;
  String area;
  String createAt;
  String lastChat;

  ChatRoom({
    required this.estimateId,
    required this.userName,
    required this.serviceType,
    required this.area,
    required this.createAt,
    required this.lastChat,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      estimateId: json['estimate_id'] as String,
      userName: json['user_name'] as String,
      serviceType: json['service_type'] as String,
      area: json['address'] as String,
      createAt: json['createAt'] == null ? "" : json['createAt'] as String,
      lastChat: json['lastChat'] == null ? "" : json['lastChat'] as String,
    );
  }
}

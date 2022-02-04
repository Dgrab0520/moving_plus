class UserChatRoom {
  String estimateId;
  String proName;
  String profileImage;
  String createAt;
  String lastChat;
  String chatType;
  double estimatePrice;
  String token;
  String proId;

  UserChatRoom(
      {required this.estimateId,
      required this.proName,
      required this.profileImage,
      required this.createAt,
      required this.lastChat,
      required this.chatType,
      required this.estimatePrice,
      required this.token,
      required this.proId});

  factory UserChatRoom.fromJson(Map<String, dynamic> json) {
    return UserChatRoom(
      estimateId: json['estimate_id'] as String,
      proName: json['pro_name'] as String,
      profileImage: json['profile_img'] as String,
      createAt: json['createAt'] == null ? "" : json['createAt'] as String,
      lastChat: json['lastChat'] == null ? "" : json['lastChat'] as String,
      chatType: json['chatType'] == null ? "" : json['chatType'] as String,
      estimatePrice: double.parse(json['estimate_price']),
      token: json['token'] == null ? "" : json['token'] as String,
      proId: json['pro_id'] == null ? "" : json['pro_id'] as String,
    );
  }
}

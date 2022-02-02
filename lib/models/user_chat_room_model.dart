class UserChatRoom {
  String estimateId;
  String proName;
  String profileImage;
  String createAt;
  String lastChat;
  double estimatePrice;

  UserChatRoom({
    required this.estimateId,
    required this.proName,
    required this.profileImage,
    required this.createAt,
    required this.lastChat,
    required this.estimatePrice,
  });

  factory UserChatRoom.fromJson(Map<String, dynamic> json) {
    return UserChatRoom(
      estimateId: json['estimate_id'] as String,
      proName: json['pro_name'] as String,
      profileImage: json['profile_img'] as String,
      createAt: json['createAt'] == null ? "" : json['createAt'] as String,
      lastChat: json['lastChat'] == null ? "" : json['lastChat'] as String,
      estimatePrice: double.parse(json['estimate_price']),
    );
  }
}

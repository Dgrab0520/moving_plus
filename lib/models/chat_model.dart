class Chat {
  int id;
  String estimateId;
  String text;
  String image;
  int estimatePrice;
  int finalPrice;
  int isPro;
  String createAt;

  Chat({
    required this.id,
    required this.estimateId,
    required this.text,
    required this.image,
    required this.estimatePrice,
    required this.finalPrice,
    required this.isPro,
    required this.createAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: int.parse(json['id']),
      estimateId: json['estimateId'] as String,
      text: json['text'] as String,
      image: json['image'] as String,
      estimatePrice: int.parse(json['estimatePrice']),
      finalPrice: int.parse(json['finalPrice']),
      isPro: int.parse(json['isPro']),
      createAt: json['createAt'] as String,
    );
  }
}

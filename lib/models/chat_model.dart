class Chat {
  int id;
  int estimateId;
  int customerId;
  int proId;
  String text;
  String image;
  int estimatePrice;
  int finalPrice;
  int isPro;
  String createAt;

  Chat({
    required this.id,
    required this.estimateId,
    required this.customerId,
    required this.proId,
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
      estimateId: int.parse(json['estimateId']),
      customerId: int.parse(json['customerId']),
      proId: int.parse(json['proId']),
      text: json['text'] as String,
      image: json['image'] as String,
      estimatePrice: int.parse(json['estimatePrice']),
      finalPrice: int.parse(json['finalPrice']),
      isPro: int.parse(json['isPro']),
      createAt: json['createAt'] as String,
    );
  }
}

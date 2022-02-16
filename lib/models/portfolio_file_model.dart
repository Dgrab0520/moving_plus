class PortfolioFile {
  int id;
  String fileName;
  String fileType;
  String proId;

  PortfolioFile({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.proId,
  });

  factory PortfolioFile.fromJson(Map<String, dynamic> json) {
    return PortfolioFile(
      id: int.parse(json['id']),
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      proId: json['proId'] as String,
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/portfolio_file_model.dart';
import 'chat_data.dart';

class ProDataPortfolioFile {
  static const ROOT = "http://211.110.44.91/plus/plus_pro_portfolio_file.php";

  //포트폴리오 이미지 변경
  static Future<String> changePortfolioImage(
      List<File> files, List<String> type) async {
    print(controller.pro.value.pro_id);

    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "CHANGE_PORTFOLIO_IMAGE";
      request.fields['pro_id'] = controller.pro.value.pro_id;
      request.fields['fileCount'] = files.length.toString();
      for (int i = 0; i < files.length; i++) {
        String fileName = getRandomString();
        String fileType = "." + type[i];
        print(fileName);

        request.fields['file$i'] = fileName;
        request.fields['fileType$i'] = fileType;
        request.files.add(
            await http.MultipartFile.fromPath("portfolio$i", files[i].path));
      }
      print(request.files);
      print(request.fields);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Profile File Response : ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  //포트폴리오 파일 불러오기
  static Future<List<PortfolioFile>> getPortfolioFiles(String pro_id) async {
    print(pro_id);
    try {
      var map = <String, dynamic>{};
      map['action'] = "FILE_SELECT";
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Pro Portfolio Files Response : ${response.body}');
      if (response.statusCode == 200) {
        List<PortfolioFile> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static List<PortfolioFile> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PortfolioFile>((json) => PortfolioFile.fromJson(json))
        .toList();
  }
}

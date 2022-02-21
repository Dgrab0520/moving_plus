import 'package:http/http.dart' as http;

class DeleteAccount {
  static const ROOT = "http://211.110.44.91/plus/plus_delete_account.php";

  //전문가 계정탈퇴
  static Future<String> deletePro(String proId) async {
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "PRO";
      request.fields['pro_id'] = proId;
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Pro Delete Response : ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }

  //고객 계정탈퇴
  static Future<String> deleteCus(String cusId) async {
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "CUS";
      request.fields['cus_id'] = cusId;
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Cus Delete Response : ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}

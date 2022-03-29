import 'package:http/http.dart' as http;


class SignUp_Data{
  static const ROOT = "http://211.110.44.91/plus/plus_sign_up.php";
  static const PRO_SIGNUP_ACTION = "PRO_SIGNUP";

  static Future<String> insertSignUp(String pro_id, String pro_pw, String pro_recom, String com_name, String com_no, String name, String phone, String service1, String service2, String service3, String service4, String service5, String area1, String area2, String area3) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = PRO_SIGNUP_ACTION;
      map['pro_id'] = pro_id;
      map['pro_pw'] = pro_pw;
      map['pro_recom'] = pro_recom;
      map['com_name'] = com_name;
      map['com_no'] = com_no;
      map['name'] = name;
      map['phone'] = phone;
      map['service1'] = service1;
      map['service2'] = service2;
      map['service3'] = service3;
      map['service4'] = service4;
      map['service5'] = service5;
      map['area1'] = area1;
      map['area2'] = area2;
      map['area3'] = area3;
      print(map);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Insert Sign Up Response : ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }
}

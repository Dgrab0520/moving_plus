import 'package:get/get.dart';

class Pro_Getx {
  String type;
  String id;
  String pro_id;
  String pro_pw;
  String pro_name;
  String pro_phone;
  String pro_email;
  String com_name;
  String profile_img;
  String pro_token;

  Pro_Getx({
    required String type,
    required String id,
    required String pro_id,
    required String pro_pw,
    required String pro_name,
    required String pro_phone,
    required String pro_email,
    required String com_name,
    required String profile_img,
    required String pro_token,
  })  : this.type = type,
        this.id = id,
        this.pro_id = pro_id,
        this.pro_pw = pro_pw,
        this.pro_name = pro_name,
        this.pro_phone = pro_phone,
        this.pro_email = pro_email,
        this.com_name = com_name,
        this.profile_img = profile_img,
        this.pro_token = pro_token;
}

class ReactiveController extends GetxController {
  var pro = Pro_Getx(
    type: 'None',
    id: 'None',
    pro_id: 'None',
    pro_pw: 'None',
    pro_name: 'None',
    pro_phone: 'None',
    pro_email: 'None',
    com_name: 'None',
    profile_img: 'None',
    pro_token: 'None',
  ).obs;

  setProfile(String profile) {
    pro.value.profile_img = profile;
    pro.refresh();
  }

  setPWD(String pwd) {
    pro.value.pro_pw = pwd;
    pro.refresh();
  }

  change({
    required String type,
    required String id,
    required String pro_id,
    required String pro_pw,
    required String pro_name,
    required String pro_phone,
    required String pro_email,
    required String com_name,
    required String profile_img,
    required String pro_token,
  }) {
    pro.update((val) {
      val!.type = type;
      val.id = id;
      val.pro_id = pro_id;
      val.pro_pw = pro_pw;
      val.pro_name = pro_name;
      val.pro_phone = pro_phone;
      val.pro_email = pro_email;
      val.com_name = com_name;
      val.profile_img = profile_img;
      val.pro_token = pro_token;
    });
  }
}

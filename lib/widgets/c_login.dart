import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/widgets/p_login.dart';
import 'package:moving_plus/pages/p_signup.dart';
import 'package:kakao_flutter_sdk/all.dart';

import '../pages/arlim_checkbox.dart';
import '../pages/main_page.dart';



final controller = Get.put(ReactiveController());

class C_Login extends StatefulWidget {
  const C_Login({Key? key}) : super(key: key);

  @override
  _C_LoginState createState() => _C_LoginState();
}

class _C_LoginState extends State<C_Login> {


  bool _isKakaoTalkInstalled = true;
  String user_id = 'None';
  String user_name = 'None';
  String profile_image = 'None';
  bool _default_Image = true;



  @override
  void initState(){
    _initTexts();
    _initKakaoTalkInstalled();
    print('_default_Image: $_default_Image');
    super.initState();
  }

  _initTexts() async{
    final User user = await UserApi.instance.me();
    setState(() {
      user_id = user.kakaoAccount!.email!;
      user_name = user.kakaoAccount!.profile!.nickname;
      _default_Image = user.kakaoAccount!.profile!.isDefaultImage!;
      profile_image = user.kakaoAccount!.profile!.profileImageUrl!;
    });
    print('user_name: $user_name');
  }

  //고객 카카오 로그인
  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
      // await _issueAccessToken(code);
    } catch (e) {
      print(e);
    }
  }

  _loginWithTalk() async{
    try{
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
      // await _issueAccessToken(code);
    }catch(e){
      print(e.toString());
    }
  }

  _issueAccessToken(String authCode) async {
    try{
      var token = await AuthApi.instance.issueAccessToken(authCode);
      // AccesstokenStore.instance.toStore(token);
      TokenManager.instance.setToken(token);
      print('token success');
      print('user_name: $user_name');
      controller.change(
          type: 'cus',
          pro_id: user_id,
          pro_name: user_name,
          pro_phone: 'None',
          pro_email: 'None',
          com_name: 'None',
          profile_img: _default_Image ? "default_image" : profile_image,
          pro_token: 'None',
      );
      Get.offAll(Main_Page(index: 1));
    }catch(e){
      print("Error on issuing access token: $e");
    }
  }




  @override
  Widget build(BuildContext context) {

    // KaKao native app key
    KakaoContext.clientId = "5ea560970fe7158c7724fd4140be4fab";  //Native Key  //오류 발생 시 initState() 밑에 넣어보기
    // KaKao javascript key
    KakaoContext.javascriptClientId = "31d2a1f88363431e27c4d4fdec296a5e";  //JavaScript Key

    isKakaoTalkInstalled();

    return  AlertDialog(
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          )
      ),
      backgroundColor: Colors.white,
      content:Container(
        width:MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child: Container(child: Icon(Icons.close))),
              ],
            ),
            SizedBox(height:10),
            Text('로그인',
              style:TextStyle(
                color:Color(0xFF444444),
                fontSize:23,
                fontFamily: 'NanumSquareB',
              ),
            ),
            SizedBox(height:7),
            Text('로그인 후 입주 플러스를 이용해 주세요.',
              style:TextStyle(
                color:Color(0xFF444444),
                fontSize:12,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height:28),
            Container(
              padding: EdgeInsets.only(left:8,right:8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      print('고객 로그인');
                      _loginWithKakao();
                    },
                    child: Container(
                      width:MediaQuery.of(context).size.width,
                      height:40,
                      decoration:BoxDecoration(
                        color:Color(0xFFFFD800),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:15),
                          Container(
                              child: Image.asset("assets/kakao_b.png", width:17, height:17)
                          ),
                          SizedBox(width:10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width:30),
                              Text('카카오로 시작하기',
                                style:TextStyle(
                                  color:Color(0xFF3E2723),
                                  fontSize: 14,
                                  fontFamily: 'NanumSquareR',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 5.0,),
                  TextButton(
                    onPressed: (){
                      print('파트너 로그인');
                      Get.back();
                      Get.dialog(P_Login());
                    },
                    child: Center(
                      child: Text('파트너 로그인', style:
                        TextStyle(
                          color: Color(0xFF025595),
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),

            SizedBox(height:40),

            Container(
              child:
                  InkWell(
                    onTap:(){
                      Get.back();
                      Get.dialog(P_Signup());
                    },
                    child: Container(
                      child: Center(
                        child: Text('파트너로 회원가입하기',
                          style: TextStyle(
                            fontSize:11,
                            fontFamily:'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}
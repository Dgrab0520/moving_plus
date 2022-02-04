import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/datas/pro_login_data.dart';
import 'package:moving_plus/models/pro_login_model.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/p_signup.dart';
import 'package:moving_plus/widgets/c_login.dart';

final controller = Get.put(ReactiveController());

class P_Login extends StatefulWidget {
  const P_Login({Key? key}) : super(key: key);

  @override
  _P_LoginState createState() => _P_LoginState();
}

class _P_LoginState extends State<P_Login> {
  List<Pro_Info> pro_info = [];
  bool _isLoading = false;
  bool shouldCheck = false;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String proInfo = ""; //자동 로그인시 로그인 정보 저장

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  @override
  void initState() {
    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    proInfo = (await storage.read(key: "login"))!;
    print('proInfo?? $proInfo');

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (proInfo != null) {
      print('Success & return ${proInfo.split(" ")[1]}');
    } else {
      print('false & Again');
    }
  }

  Pro_Login() {
    Pro_Login_Data.getPro_Login(
            idController.text.trim(), pwController.text.trim())
        .then((value) {
      setState(() {
        pro_info = value;
      });
      if (value.length == 1) {
        setState(() {
          _isLoading = true;
          FirebaseMessaging.instance.getToken().then((value) =>
              Pro_Data.updateToken_Pro('${pro_info[0].pro_id}', value!)
                  .then((value) {
                if (value == 'success') {
                  print('update token success');
                } else {
                  print('update token fail');
                }
              }));
          storage.write(
              key: "login",
              value: "id " +
                  idController.text.toString() +
                  " " +
                  "password " +
                  pwController.text.toString());
        });
        controller.change(
            type: 'pro',
            id: pro_info[0].id,
            pro_id: pro_info[0].pro_id,
            pro_name: pro_info[0].pro_name,
            pro_phone: pro_info[0].pro_phone,
            pro_email: pro_info[0].pro_email,
            com_name: pro_info[0].com_name,
            profile_img: pro_info[0].profile_img,
            pro_token: pro_info[0].pro_token);
        Get.offAll(Main_Page(index: 1));
      } else {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar("로그인 실패", "아이디 또는 비밀번호가 틀렸습니다",
            backgroundColor: Colors.white, colorText: Colors.black);
      }
    });
  }

  @override
  void dispose() {
    idController;
    pwController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(32),
      )),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(child: Icon(Icons.close))),
              ),
              SizedBox(height: 10),
              const Text(
                '파트너 로그인',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              SizedBox(height: 7),
              const Text(
                '로그인 후 입주 플러스를 이용해 주세요.',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '아이디',
                      style: TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                        width: Get.width,
                        height: 45,
                        child: TextField(
                          controller: idController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 10.0, bottom: 10, left: 15),
                            counterStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintText: '아이디를 입력해주세요.',
                            labelStyle: TextStyle(color: Color(0xFFACACAC)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFFACACAC)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFFACACAC)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        )),
                    SizedBox(height: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                            width: Get.width,
                            height: 45,
                            child: TextField(
                              controller: pwController,
                              obscureText: true,
                              obscuringCharacter: "*",
                              keyboardType: TextInputType.visiblePassword,
                              onSubmitted: (String value) async {
                                await Pro_Login();
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 15),
                                counterStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintText: '비밀번호를 입력해주세요.',
                                labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFACACAC)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFACACAC)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: CustomCheckBox(
                          value: shouldCheck,
                          shouldShowBorder: true,
                          borderColor: Color(0xFF025595),
                          checkedFillColor: Color(0xFF025595),
                          borderRadius: 4,
                          borderWidth: 2,
                          checkBoxSize: 10,
                          onChanged: (val) {
                            //do your stuff here
                            setState(() {
                              shouldCheck = val;
                            });
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            '자동 로그인',
                            style: TextStyle(
                              color: Color(0xFF444444),
                              fontSize: 10,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            '아이디 찾기',
                            style: TextStyle(
                              fontFamily: 'NanumSquareB',
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            '비밀번호 찾기',
                            style: TextStyle(
                              fontFamily: 'NanumSquareB',
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (idController.text != "" && pwController.text != "") {
                    Pro_Login();
                  } else {
                    Get.snackbar("로그인 실패", "아이디 또는 비밀번호를 입력해주세요",
                        colorText: Colors.black, backgroundColor: Colors.white);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    print('고객 로그인');
                    Get.back();
                    Get.dialog(C_Login(
                      index: 0,
                    ));
                  },
                  child: Text(
                    '고객 로그인하기',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'NanumSquareB',
                        color: Colors.black87),
                  )),
              SizedBox(height: 25),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '아직 임주 플러스 회원이 아니신가요?',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.dialog(P_Signup());
                      },
                      child: Container(
                        child: Text(
                          '회원가입 하기',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

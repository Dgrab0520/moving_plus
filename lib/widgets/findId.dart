import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/signup_pro_page.dart';
import 'package:moving_plus/widgets/findResult.dart';

import 'p_login.dart';

class FindId extends StatelessWidget {
  FindId({Key? key}) : super(key: key);

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                        Get.dialog(P_Login());
                      },
                      child: const Icon(Icons.arrow_back)),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '아이디 찾기',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                '정보를 입력해주세요.',
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
                      '전문가 이름',
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
                            hintText: '전문가 이름을 입력해주세요.',
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
                          '핸드폰 번호',
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
                              keyboardType: TextInputType.number,
                              onSubmitted: (String value) async {},
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 15),
                                counterStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintText: '"-"를 제외한 핸드폰 번호를 입력해주세요.',
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
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.dialog(const FindResult(
                    result: "id",
                    type: "아이디",
                  ));
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
                      '찾기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
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
                        Get.to(SignUpPage());
                        //Get.dialog(P_Signup());
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

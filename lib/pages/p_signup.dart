import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/main_page.dart';

import '../widgets/p_login.dart';

class P_Signup extends StatefulWidget {
  const P_Signup({Key? key}) : super(key: key);

  @override
  _P_SignupState createState() => _P_SignupState();
}

class _P_SignupState extends State<P_Signup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(32),
      )),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      Get.back();
                      Get.dialog(const P_Login());
                    },
                    child: const Icon(Icons.close)),
              ),
              const SizedBox(height: 10),
              const Text(
                '파트너 회원가입',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                '로그인 후 입주 플러스를 이용해 주세요.',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
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
                    const SizedBox(height: 7),
                    const SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 10.0, bottom: 10, left: 15),
                            counterStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintText: '아이디 이메일을 입력해주세요.',
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
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: TextField(
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
                              keyboardType: TextInputType.visiblePassword,
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '비밀번호 확인',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 15),
                                counterStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintText: '비밀번호를 한번 더 입력해주세요.',
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
                              keyboardType: TextInputType.visiblePassword,
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '업체명',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 15),
                                counterStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                hintText: '업체명을 입력해주세요.',
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
                              keyboardType: TextInputType.name,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Main_Page(
                              index: 1,
                            )),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      '가입하기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/find_account_data.dart';
import 'package:moving_plus/pages/signup_pro_page.dart';
import 'package:moving_plus/widgets/findResult.dart';

import 'p_login.dart';

class FindId extends StatelessWidget {
  FindId({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                        Get.dialog(const P_Login());
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
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.only(
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
                    const SizedBox(height: 7),
                    SizedBox(
                        width: Get.width,
                        height: 45,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
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
                    const SizedBox(height: 15),
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
                        const SizedBox(height: 7),
                        SizedBox(
                            width: Get.width,
                            height: 45,
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              onSubmitted: (String value) async {},
                              decoration: const InputDecoration(
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  FindAccount.getId(nameController.text, phoneController.text)
                      .then((value) {
                    if (value != "") {
                      Get.back();
                      Get.dialog(FindResult(
                        result: value,
                        type: "아이디",
                      ));
                    } else {
                      Get.snackbar("실패", "일치하는 정보가 없습니다");
                    }
                  });
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
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '아직 임주 플러스 회원이 아니신가요?',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.to(SignUpPage());
                      //Get.dialog(P_Signup());
                    },
                    child: const Text(
                      '회원가입 하기',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

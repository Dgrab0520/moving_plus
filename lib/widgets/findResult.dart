import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/signup_pro_page.dart';

class FindResult extends StatelessWidget {
  const FindResult({Key? key, required this.result, required this.type})
      : super(key: key);
  final String result;
  final String type;
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
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close)),
              ),
              const SizedBox(height: 10),
              Text(
                '$type 찾기',
                style: const TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              const SizedBox(height: 7),
              Text(
                '$type 찾기 결과입니다.',
                style: const TextStyle(
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
                child: Text(
                  "$type : $result",
                  style: const TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 15,
                    fontFamily: 'NanumSquareB',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      '닫기',
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

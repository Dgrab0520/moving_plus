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
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Text(
                  "$type : $result",
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 15,
                    fontFamily: 'NanumSquareB',
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
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

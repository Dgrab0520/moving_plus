import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/delete_account_data.dart';
import 'package:moving_plus/datas/recom_data.dart';

import 'main_page.dart';

class Account_Set extends StatefulWidget {
  const Account_Set({Key? key}) : super(key: key);

  @override
  _Account_SetState createState() => _Account_SetState();
}

class _Account_SetState extends State<Account_Set> {
  @override
  void initState() {
    print(controller.pro.value.pro_name);
    print(controller.pro.value.pro_id);
    print(controller.pro.value.pro_phone);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '계정',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF025595),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                  child: controller.pro.value.type == 'cus'
                      ? controller.pro.value.profile_img == 'default_image'
                          ? Image.asset('assets/defaultImage.png',
                              width: 80, height: 80)
                          : Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.pro.value.profile_img,
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                            )
                      // Image.network(controller.pro.value.profile_img, width:70,height:70)
                      : Image.network(
                          "http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}",
                          width: 80,
                          height: 80)),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이름',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      controller.pro.value.pro_name,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이메일',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          controller.pro.value.pro_id,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset('assets/kakao_b.png',
                            width: 16, height: 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: controller.pro.value.recom));
                        Get.snackbar("복사", "추천인 코드가 복사되었습니다");
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '추천인 코드',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  controller.pro.value.recom,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15, left: 2, right: 20),
                    child: InkWell(
                      onTap: () {
                        TextEditingController code = TextEditingController();
                        Get.defaultDialog(
                          title: "추천인 코드 등록",
                          titleStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'NanumSquareB',
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: code,
                                style: const TextStyle(fontSize: 10),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 10.0, bottom: 10, left: 15),
                                  counterStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                  hintText: '추천인 코드',
                                  labelStyle:
                                      TextStyle(color: Color(0xFFACACAC)),
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
                              ),
                            ],
                          ),
                          confirm: InkWell(
                            onTap: () {
                              if (code.text != controller.pro.value.recom) {
                                RecomData.getRecomCount().then((value) {
                                  if (value) {
                                    RecomData.isRecom(code.text).then((value) {
                                      if (value) {
                                        RecomData.existsRecom(code.text)
                                            .then((value) {
                                          if (value) {
                                            RecomData.insertRecom(code.text)
                                                .then((value) {
                                              if (value) {
                                                Get.back();
                                                Get.snackbar(
                                                    "성공", "추천인 코드를 등록했습니다");
                                              } else {
                                                if (!Get.isSnackbarOpen) {
                                                  Get.snackbar(
                                                      "오류", "추천인 등록을 실패했습니다");
                                                }
                                              }
                                            });
                                          } else {
                                            if (!Get.isSnackbarOpen) {
                                              Get.snackbar(
                                                  "오류", "이미 등록한 코드입니다");
                                            }
                                          }
                                        });
                                      } else {
                                        if (!Get.isSnackbarOpen) {
                                          Get.snackbar("오류", "잘못된 추천인 코드입니다");
                                        }
                                      }
                                    });
                                  } else {
                                    if (!Get.isSnackbarOpen) {
                                      Get.snackbar("오류", "추천인 코드를 최대로 사용하셨습니다");
                                    }
                                  }
                                });
                              } else {
                                if (!Get.isSnackbarOpen) {
                                  Get.snackbar("오류", "본인의 코드는 사용할 수 없습니다");
                                }
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF025595),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  '등록',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          cancel: InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF025595),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0xFF025595),
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF025595),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '코드 등록',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding:
              //         EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           '비밀번호',
              //           style: TextStyle(
              //             fontSize: 12,
              //             fontFamily: 'NanumSquareR',
              //           ),
              //         ),
              //         SizedBox(height: 7),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '●●●●●●●●●',
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 fontFamily: 'NanumSquareB',
              //               ),
              //             ),
              //             Icon(Icons.arrow_forward_ios, size: 18)
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding:
              //         EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           '전화번호',
              //           style: TextStyle(
              //             fontSize: 12,
              //             fontFamily: 'NanumSquareR',
              //           ),
              //         ),
              //         SizedBox(height: 7),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '010-5555-4444',
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 fontFamily: 'NanumSquareB',
              //               ),
              //             ),
              //             Icon(Icons.arrow_forward_ios, size: 18)
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: "계정 탈퇴",
                      titleStyle: TextStyle(
                        fontFamily: 'NanumSquareR',
                      ),
                      content: const Text(
                        "탈퇴하시겠습니까?",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      confirm: ElevatedButton(
                        onPressed: () {
                          DeleteAccount.deleteCus(controller.pro.value.pro_id)
                              .then((value) {
                            if (value == "success") {
                              controller.change(
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
                                recom: "None",
                              );
                              Get.offAll(const Main_Page(index: 1));

                              Get.snackbar("성공", "계정이 탈퇴되었습니다");
                            } else {
                              Get.snackbar("실패", "실패했습니다");
                            }
                          });
                        },
                        child: const Text(
                          "예",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF025595),
                        ),
                      ),
                      cancel: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "아니오",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Color(0xFF025595),
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '계정 탈퇴',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

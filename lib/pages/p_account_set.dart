import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/delete_account_data.dart';
import 'package:moving_plus/pages/main_page.dart';

import '../datas/pro_data_update.dart';

final controller = Get.put(ReactiveController());

class P_Account_Set extends StatefulWidget {
  const P_Account_Set({Key? key}) : super(key: key);

  @override
  _P_Account_SetState createState() => _P_Account_SetState();
}

class _P_Account_SetState extends State<P_Account_Set> {
  ImageProvider accountImage = NetworkImage(
      "http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '계정 설정',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 25.0, bottom: 25, left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                ),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                                type: FileType.image,
                                allowMultiple: false,
                                onFileLoading: (value) {
                                  debugPrint(value.toString());
                                });
                        if (result != null) {
                          File file = File(result.files.single.path!);
                          setState(() {
                            accountImage = FileImage(file);
                          });
                          ProDataUpdate.changeProfileImage(file).then((value) {
                            if (value == "success") {
                              Get.snackbar("성공", "프로필 이미지 변경 성공");
                            } else {
                              Get.snackbar("실패", "프로필 이미지 변경 실패");
                            }
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        foregroundImage: accountImage,
                      )),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset("assets/photo-camera2.png",
                          width: 30, height: 30)),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '회사명',
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
                          controller.pro.value.com_name,
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
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '아이디',
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
                          controller.pro.value.pro_id,
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
            InkWell(
              onTap: () {
                TextEditingController currentPwd = TextEditingController();
                TextEditingController changePwd = TextEditingController();
                TextEditingController changePwdCheck = TextEditingController();
                Get.defaultDialog(
                    title: "비밀번호 변경",
                    content: Column(
                      children: [
                        Text(
                          '현재 비밀번호',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        TextField(
                          controller: currentPwd,
                          obscuringCharacter: "●",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '새로운 비밀번호',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        TextField(
                          controller: changePwd,
                          obscuringCharacter: "●",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '새로운 비밀번호 확인',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        TextField(
                          controller: changePwdCheck,
                          obscuringCharacter: "●",
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ],
                    ),
                    textConfirm: "변경",
                    onConfirm: () {
                      if (currentPwd.text == controller.pro.value.pro_pw) {
                        if (changePwd.text == changePwdCheck.text) {
                          ProDataUpdate.changePWD(changePwd.text).then((value) {
                            if (value == "success") {
                              controller.setPWD(changePwd.text);
                              Get.back();
                              Get.snackbar("성공", "비밀번호 변경을 성공했습니다");
                            }
                          });
                        } else {
                          Get.snackbar("실패", "비밀번호가 서로 다릅니다");
                        }
                      } else {
                        Get.snackbar("실패", "현재 비밀번호가 틀립니다");
                      }
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '비밀번호',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '●●●●●●●●●',
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
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '전화번호',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.pro.value.pro_phone,
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
            SizedBox(height: 70),
            Divider(
              thickness: 0.6,
              height: 1.0,
              color: Color(0xFFcccccc),
            ),
            SizedBox(height: 10),
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
                        DeleteAccount.deletePro(controller.pro.value.pro_id)
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
    );
  }
}

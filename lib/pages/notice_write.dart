import 'dart:io';

import 'package:custom_check_box/custom_check_box.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/notice_data.dart';

class NoticeWrite extends StatelessWidget {
  NoticeWrite({Key? key}) : super(key: key);

  final noticeController = Get.put(NoticeData());
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final fileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    File file = File("");
    noticeController.isImportant = false;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            '공지사항 작성',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'NanumSquareB',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF025595),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      '공지사항 제목',
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
                          controller: titleController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 10.0, bottom: 10, left: 15),
                            counterStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10,
                            ),
                            hintText: '공지사항 제목을 입력해주세요.',
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
                          '공지사항 내용',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        const SizedBox(height: 7),
                        SizedBox(
                            width: Get.width,
                            child: TextField(
                              controller: contentController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
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
                                hintText: '공지사항 내용을 입력해주세요',
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
                    const SizedBox(height: 15),
                    const Text(
                      '공지사항 이미지',
                      style: TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: fileController,
                            enabled: false,
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
                              hintText: '파일명',
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
                          ),
                        ),
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
                              file = File(result.files.single.path!);
                              fileController.text = result.files.single.name;
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFF025595),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                '파일 찾기',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Obx(
                          () => SizedBox(
                            width: 30,
                            height: 30,
                            child: CustomCheckBox(
                              value: noticeController.isImportant,
                              shouldShowBorder: true,
                              borderColor: const Color(0xFF025595),
                              checkedFillColor: const Color(0xFF025595),
                              borderRadius: 4,
                              borderWidth: 2,
                              checkBoxSize: 10,
                              onChanged: (val) {
                                noticeController.isImportant = val;
                              },
                            ),
                          ),
                        ),
                        const Text(
                          '필독',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  noticeController
                      .putNotice(titleController.text, contentController.text,
                          file: file.existsSync() ? file : null)
                      .then((value) {
                    if (value == "success") {
                      Get.back();
                      Get.snackbar("성공", "공지사항을 작성했습니다");
                    } else {
                      Get.snackbar("실패", "작성을 실패했습니다");
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
                      '작성',
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
            ],
          ),
        ),
      ),
    );
  }
}

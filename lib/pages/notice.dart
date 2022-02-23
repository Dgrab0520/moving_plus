import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/notice_data.dart';
import 'package:moving_plus/pages/notice_detail.dart';

class Notice extends StatelessWidget {
  Notice({Key? key}) : super(key: key);

  final noticeController = Get.put(NoticeData());

  @override
  Widget build(BuildContext context) {
    noticeController.getNotice();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            '공지사항',
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
        body: Obx(() => noticeController.isNoticeLoading
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: noticeController.notice.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                          NoticeDetail(notice: noticeController.notice[index]));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: Color(0xFFcccccc)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      noticeController
                                                  .notice[index].noticeType ==
                                              "필독"
                                          ? const Text(
                                              '[필독] ',
                                              style: TextStyle(
                                                color: Color(0xFF025595),
                                                fontFamily: 'NanumSquareB',
                                                fontSize: 15,
                                              ),
                                            )
                                          : Container(),
                                      Text(
                                        noticeController
                                            .notice[index].noticeTitle,
                                        style: const TextStyle(
                                          fontFamily: 'NanumSquareB',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    noticeController.notice[index].registerDate,
                                    style: const TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/detailscreen.dart';

import '../models/notice_model.dart';

class NoticeDetail extends StatelessWidget {
  const NoticeDetail({Key? key, required this.notice}) : super(key: key);

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          notice.noticeTitle,
          style: const TextStyle(
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
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                notice.noticeContent,
                style: const TextStyle(
                  fontFamily: 'NanumSquareB',
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Get.to(DetailScreen(
                      path:
                          "http://211.110.44.91/plus/notice_img/${notice.noticeContentImg}"));
                },
                child: Image.network(
                  "http://211.110.44.91/plus/notice_img/${notice.noticeContentImg}",
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container();
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

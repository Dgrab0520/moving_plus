import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/pages/p_account_set.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/pages/p_transcation_breakdown.dart';

import 'mypage_arlim.dart';
import 'notice.dart';
import 'p_portfolio_edit_page.dart';

class P_Mypage extends StatelessWidget {
  P_Mypage({Key? key}) : super(key: key);
  final controller = Get.put(ReactiveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '마이페이지',
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
          children: [
            InkWell(
              onTap: () {
                Get.to(const P_Account_Set());
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 25, top: 25),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Obx(() => CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              foregroundImage: NetworkImage(
                                  "http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}"),
                            ))),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.pro.value.com_name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareEB',
                            ),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(controller.pro.value.pro_id,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareR',
                                  )),
                              const SizedBox(width: 7),
                              Image.asset("assets/i_partner2.png",
                                  width: 15, height: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '활동',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'NanumSquareEB',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(P_Transaction_Breakdown());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/shield-(1).png",
                                  width: 17, height: 17),
                              const SizedBox(width: 10),
                              const Text('거래내역'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const P_Chat());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/chat-(2)_gg.png",
                                  width: 17, height: 17),
                              const SizedBox(width: 10),
                              const Text('채팅'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const PortfolioEdit_Page(),
                          arguments: controller.pro.value.pro_id);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/notes-(1).png",
                                  width: 17, height: 17),
                              const SizedBox(width: 10),
                              const Text('포트폴리오'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Text(
                      '설정',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const MyPage_Arlim());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/notification-(2).png",
                                  width: 17, height: 17),
                              const SizedBox(width: 10),
                              const Text('알림'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const Notice());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/sound.png",
                                  width: 17, height: 17),
                              const SizedBox(width: 10),
                              const Text('공지사항'),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

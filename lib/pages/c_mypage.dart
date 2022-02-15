import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/account_set.dart';
import 'package:moving_plus/pages/c_review.dart';
import 'package:moving_plus/pages/mypage_arlim.dart';
import 'package:moving_plus/pages/notice.dart';
import 'package:moving_plus/pages/receive_estimate.dart';
import 'package:moving_plus/pages/transaction_breakdown.dart';

import 'main_page.dart';

class C_Mypage extends StatelessWidget {
  const C_Mypage({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(const Account_Set());
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
                      SizedBox(width: 10.0,),
                      Container(
                          child: controller.pro.value.type == 'cus'
                              ? controller.pro.value.profile_img == 'default_image'
                              ? Image.asset(
                              'assets/defaultImage.png',
                              width: 70,
                              height: 70)
                              : Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    controller.pro.value
                                        .profile_img,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          )
                          // Image.network(controller.pro.value.profile_img, width:70,height:70)
                              : Image.network("http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}", width: 70, height: 70)
                      ),

                      const SizedBox(width: 10),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.pro.value.pro_name,
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
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 18,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
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
                        Get.to(const Transaction_Breakdown());
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
                        Get.to(const Receive_Estimate(isMain: false));
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
                        Get.to(const C_Review());
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
                                const Text('작성한 후기'),
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
      ),
    );
  }
}

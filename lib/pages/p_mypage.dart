import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/pages/p_account_set.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/pages/p_transcation_breakdown.dart';

import 'mypage_arlim.dart';
import 'notice.dart';
import 'p_portfolio_edit_page.dart';

final controller = Get.put(ReactiveController());

class P_Mypage extends StatefulWidget {
  const P_Mypage({Key? key}) : super(key: key);

  @override
  _P_MypageState createState() => _P_MypageState();
}

class _P_MypageState extends State<P_Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '마이페이지',
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
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(P_Account_Set());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 25, top: 25),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.network(
                                "http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}",
                                width: 60,
                                height: 60)),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.pro.value.com_name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NanumSquareEB',
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(controller.pro.value.pro_id,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'NanumSquareR',
                                      )),
                                  SizedBox(width: 7),
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
                              children: [
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
                  padding: EdgeInsets.only(left: 17, right: 17, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
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
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/shield-(1).png",
                                      width: 17, height: 17),
                                  SizedBox(width: 10),
                                  Text('거래내역'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(P_Chat());
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/chat-(2)_gg.png",
                                      width: 17, height: 17),
                                  SizedBox(width: 10),
                                  Text('채팅'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(PortfolioEdit_Page());
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/notes-(1).png",
                                      width: 17, height: 17),
                                  SizedBox(width: 10),
                                  Text('포트폴리오'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Text(
                              '설정',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(MyPage_Arlim());
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/notification-(2).png",
                                      width: 17, height: 17),
                                  SizedBox(width: 10),
                                  Text('알림'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Notice());
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/sound.png",
                                      width: 17, height: 17),
                                  SizedBox(width: 10),
                                  Text('공지사항'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}

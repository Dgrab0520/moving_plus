import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/models/order_chat_model.dart';
import 'package:moving_plus/pages/account_set.dart';
import 'package:moving_plus/pages/c_chatlist.dart';
import 'package:moving_plus/pages/c_review.dart';
import 'package:moving_plus/pages/mypage_arlim.dart';
import 'package:moving_plus/pages/notice.dart';
import 'package:moving_plus/pages/transaction_breakdown.dart';

import 'main_arlim.dart';

class C_Mypage extends StatefulWidget {
  const C_Mypage({Key? key}) : super(key: key);

  @override
  _C_MypageState createState() => _C_MypageState();
}

class _C_MypageState extends State<C_Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Color(0xFF025595),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '마이페이지',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              Get.to(Main_Arlim());
                            },
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 22,
                            )),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Account_Set());
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 25, top: 25),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0, color: Color(0xFFcccccc)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Image.asset("assets/avatar_c.png",
                                    width: 60, height: 60)),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '김이박',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'NanumSquareEB',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text('kep123@naver.com',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'NanumSquareR',
                                          )),
                                      SizedBox(width: 7),
                                      Image.asset("assets/kakao_b.png",
                                          width: 13, height: 13),
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
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '활동',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'NanumSquareEB',
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(Transaction_Breakdown());
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 15, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              Get.to(C_ChatList(
                                mainType: '',
                                orderChat: OrderChat(
                                    order_id: "order_id",
                                    address: "address",
                                    service_type: "service_type",
                                    order_status: "order_status",
                                    order_date: "order_date"),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              Get.to(C_Review());
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/notes-(1).png",
                                          width: 17, height: 17),
                                      SizedBox(width: 10),
                                      Text('작성한 후기'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}

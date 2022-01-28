import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main_Arlim extends StatefulWidget {
  const Main_Arlim({Key? key}) : super(key: key);

  @override
  _Main_ArlimState createState() => _Main_ArlimState();
}

class _Main_ArlimState extends State<Main_Arlim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '알림',
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
        child: Container(
          width: Get.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/partner_1.png',
                                width: 50, height: 50),
                            Positioned(
                                child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Color(0xFF025595),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(''),
                            ))
                          ],
                        ),
                        SizedBox(width: 12),
                        Row(
                          children: [
                            Text(
                              '김이박',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                            Text(
                              '님이 견적서를 요청했습니다.',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('지금',
                        style: TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/partner_2.png',
                                width: 50, height: 50),
                          ],
                        ),
                        SizedBox(width: 12),
                        Row(
                          children: [
                            Text(
                              '유운성',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                            Text(
                              '님이 견적서를 요청했습니다.',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('2일전',
                        style: TextStyle(
                          fontSize: 13,
                        )),
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

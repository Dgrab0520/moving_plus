import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/chat_estimate.dart';
import 'package:moving_plus/pages/p_chatting.dart';

import 'main_arlim.dart';

class P_Chat extends StatefulWidget {
  const P_Chat({Key? key}) : super(key: key);

  @override
  _P_ChatState createState() => _P_ChatState();
}

class _P_ChatState extends State<P_Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('채팅',
          style: TextStyle(
            color:Colors.white,
            fontSize:17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF025595),
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left:15,right:15),
              width:MediaQuery.of(context).size.width,
              height:95,
              decoration:BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/chat_banner.png"),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:45),
                  Text('인테리어',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:16,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('파트너 | 서울/경기',
                        style:TextStyle(
                          color:Colors.white,
                          fontSize:12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      Text('2021.12.05',
                        style:TextStyle(
                          color:Colors.white,
                          fontFamily: 'NanumSquareB',
                          fontSize:12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:20),
            Container(
              margin: EdgeInsets.only(left:15,right:15),
              width:MediaQuery.of(context).size.width,
              height:45,
              decoration:BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(
                  width: 1.0,
                  color: Color(0xFFcccccc),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text){
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Icon(Icons.search))),
              ),
            ),
            SizedBox(height:20),
            InkWell(
              onTap:(){
                Get.to(Chat_Estimate());
              },
              child: Container(
                margin: EdgeInsets.only(left:15,right:15),
                padding: EdgeInsets.all(10),
                width:MediaQuery.of(context).size.width,
                height:120,
                decoration:BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFcccccc),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/arlim4.png',width:50,height:50),
                        SizedBox(width:10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('유운성',
                                    style:TextStyle(
                                      fontSize:15,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  ),
                                  Text('어제',
                                    style:TextStyle(
                                      fontSize:12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Text('필름 시공 | 서울 송파구',
                                style:TextStyle(
                                  fontSize:14,
                                  fontFamily: 'NanumSquareR',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: EdgeInsets.only(bottom:10),
                      width:MediaQuery.of(context).size.width,
                      decoration:BoxDecoration(
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('안녕하세요! 인테리어 작업대 입니다. 요청해주신 ...',
                            style:TextStyle(
                              fontSize:12,
                            ),
                          ),
                          // Container(
                          //   width:22,
                          //   height:15,
                          //   decoration:BoxDecoration(
                          //     color:Color(0xFF025595),
                          //     borderRadius: BorderRadius.circular(3),
                          //   ),
                          //   child: Center(
                          //     child: Text('5',
                          //       style:TextStyle(
                          //         color:Colors.white,
                          //         fontSize:11,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
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
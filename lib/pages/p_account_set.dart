import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class P_Account_Set extends StatefulWidget {
  const P_Account_Set({Key? key}) : super(key: key);

  @override
  _P_Account_SetState createState() => _P_Account_SetState();
}

class _P_Account_SetState extends State<P_Account_Set> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('계정 설정',
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
              width:MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top:25.0,bottom:25,left:15,right:15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/arlim2.png",width:90,height:90),
                      Positioned(
                          right:0,
                          bottom:0,
                          child:Image.asset("assets/photo-camera2.png",width:30,height:30)),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:25,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('이름',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('인테리어 작업대',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('이메일',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('i_desk123@naver.com',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('비밀번호',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('●●●●●●●●●',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('전화번호',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('010-5555-4444',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:40),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:20,bottom:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('계정 탈퇴',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/main_arlim.dart';

class Account_Set extends StatefulWidget {
  const Account_Set({Key? key}) : super(key: key);

  @override
  _Account_SetState createState() => _Account_SetState();
}

class _Account_SetState extends State<Account_Set> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left:5,right:5),
                  width:MediaQuery.of(context).size.width,
                  height:58,
                  decoration: BoxDecoration(
                    color:Color(0xFF025595),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Expanded(
                        flex:8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('계정 설정',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize:17,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),),
                      ),
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.dialog(Main_Arlim());
                            },
                            child: Icon(Icons.notifications,color: Colors.white,size: 22,)),
                      ),
                    ],
                  ),
                ),
                Column(
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
                              Image.asset("assets/avatar_cs.png",width:90,height:90),
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
                                Text('김이박',
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
                                Row(
                                  children: [
                                    Text('kep123@naver.com',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    SizedBox(width:5),
                                    Image.asset('assets/kakao_b.png',width:16,height:16),
                                  ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

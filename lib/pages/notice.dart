import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
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
                          child: Text('공지사항',
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
                InkWell(
                  onTap:(){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
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
                                    Text('[필독] ',
                                      style:TextStyle(
                                        color:Color(0xFF025595),
                                        fontFamily: 'NanumSquareB',
                                        fontSize:15,
                                      ),
                                    ),
                                    Text('입주플러스 견적 신청 방법',
                                      style:TextStyle(
                                        fontFamily: 'NanumSquareB',
                                        fontSize:15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:10),
                                Text('2021.07.10',
                                  style:TextStyle(
                                    color:Color(0xFF888888),
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,size:20,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap:(){
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
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
                                    Text('신규 회원가입 이벤트',
                                      style:TextStyle(
                                        fontFamily: 'NanumSquareB',
                                        fontSize:15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:10),
                                Text('2021.07.10',
                                  style:TextStyle(
                                    color:Color(0xFF888888),
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,size:20,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p_login.dart';

class Main_Arlim extends StatefulWidget {
  const Main_Arlim({Key? key}) : super(key: key);

  @override
  _Main_ArlimState createState() => _Main_ArlimState();
}

class _Main_ArlimState extends State<Main_Arlim> {
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
                        child: Container(),
                      ),
                      Expanded(
                        flex:8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('알림',
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
                              Get.back();
                            },
                            child: Icon(Icons.close,color: Colors.white,)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15.0,right:15),
                  width:MediaQuery.of(context).size.width,
                  height:80,
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
                              Image.asset('assets/partner_1.png',width:50,height:50),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:12),
                          Row(
                            children: [
                              Text('김이박',
                                style: TextStyle(
                                  fontSize:14,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              Text('님이 견적서를 요청했습니다.',
                                style: TextStyle(
                                  fontSize:13,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      Text('지금',
                          style:TextStyle(
                            fontSize:13,
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15.0,right:15),
                  width:MediaQuery.of(context).size.width,
                  height:80,
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
                              Image.asset('assets/partner_2.png',width:50,height:50),
                            ],
                          ),
                          SizedBox(width:12),
                          Row(
                            children: [
                              Text('유운성',
                                style: TextStyle(
                                  fontSize:14,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              Text('님이 견적서를 요청했습니다.',
                                style: TextStyle(
                                  fontSize:13,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      Text('2일전',
                          style:TextStyle(
                            fontSize:13,
                          )
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

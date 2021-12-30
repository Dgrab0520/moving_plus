import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class C_Review extends StatefulWidget {
  const C_Review({Key? key}) : super(key: key);

  @override
  _C_ReviewState createState() => _C_ReviewState();
}

class _C_ReviewState extends State<C_Review> {
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
                          child: Text('후기 내역',
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
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('후기 내역',
                            style:TextStyle(
                                fontFamily: 'NanumSquareB',
                                fontSize:15
                            ),
                          ),
                          InkWell(
                            onTap:(){
                              print('xx');
                            },
                            child: Container(
                              width:60,
                              height:20,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Colors.white,
                                border:Border.all(
                                  width: 1,
                                  color: Color(0xFF025595),
                                ),
                              ),
                              child: Center(
                                child: Text('필터',
                                  style:TextStyle(
                                    fontSize:11,
                                    color: Color(0xFF025595),
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:3),
                      Row(
                        children: [
                          Text('총 10건',
                              style:TextStyle(
                                fontSize:13,
                              )
                          ),
                          SizedBox(width:8),
                          Text('12.1-12.31',
                              style:TextStyle(
                                fontSize:13,
                                color:Color(0xFF777777),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                      Container(
                        padding: EdgeInsets.all(10),
                        width:MediaQuery.of(context).size.width,
                        height:167,
                        decoration:BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/img4.png", width:70,height:70),
                                SizedBox(width:10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:250,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('인테리어 작업대',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontFamily: 'NanumSquareEB',
                                              fontSize:14,
                                            ),
                                          ),
                                          Text('2021.06.06',
                                            style:TextStyle(
                                              fontSize:12,
                                              color:Color(0xFf777777),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height:8),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('인테리어 서비스 | 올 인테리어',
                                              style:TextStyle(
                                                fontSize:12,
                                                color:Color(0xfF777777),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width:10),
                              ],
                            ),
                            SizedBox(height:20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/star1.png',width:12,height:12),
                                    SizedBox(width:3),
                                    Image.asset('assets/star1.png',width:12,height:12),
                                    SizedBox(width:3),
                                    Image.asset('assets/star1.png',width:12,height:12),
                                    SizedBox(width:3),
                                    Image.asset('assets/star1.png',width:12,height:12),
                                    SizedBox(width:3),
                                    Image.asset('assets/star1.png',width:12,height:12),
                                    SizedBox(width:7),
                                    Text('5.00 ',
                                      style:TextStyle(
                                        color:Color(0xFF025595),
                                        fontSize:13,
                                      ),
                                    ),
                                    Text('/ 5.00',
                                      style:TextStyle(
                                        fontSize:13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:10),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('궁금했던부분들은 자세히 설명해 주시고 말하지 않은 부분들도',
                                        style:TextStyle(
                                          fontSize:10,
                                        ),
                                      ),
                                      SizedBox(height:3),
                                      Text('될수록 맘에 드는 정도가 더 커졌네요. 수고 많으셨습니다! 감사합니다~ ',
                                        style:TextStyle(
                                          fontSize:10,
                                        ),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward_ios, size:20,color:Color(0xFF7A7A7A)),
                                ],
                              ),
                            ),
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

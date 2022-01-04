import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class P_Transaction_Breakdown extends StatefulWidget {
  const P_Transaction_Breakdown({Key? key}) : super(key: key);

  @override
  _P_Transaction_BreakdownState createState() => _P_Transaction_BreakdownState();
}

class _P_Transaction_BreakdownState extends State<P_Transaction_Breakdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('거래 내역',
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
              padding: EdgeInsets.only(left:15,right:15,top:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('거래 내역',
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
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        width:MediaQuery.of(context).size.width,
                        height:115,
                        decoration:BoxDecoration(
                          color:Color(0xFFF1F5F8),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('김이박',
                                      style:TextStyle(
                                        color:Color(0xFF444444),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize:15,
                                      ),
                                    ),
                                    Text('완료',
                                      style:TextStyle(
                                        fontSize:12,
                                        color:Color(0xFf777777),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:7),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('인테리어 서비스 | 올 인테리어',
                                          style:TextStyle(
                                            fontSize:12,
                                            color:Color(0xfF777777),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text('5,247,000',
                                              style:TextStyle(
                                                fontSize:20,
                                                color:Color(0xfF025595),
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                            SizedBox(width:5),
                                            Container(
                                              width:15,
                                              height:15,
                                              decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color:Color(0xFF025595),
                                              ),
                                              child: Center(
                                                child: Text('C',
                                                  style:TextStyle(
                                                    fontSize:10,
                                                    color:Colors.white,
                                                    fontFamily: 'Jalnan',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:20),
                            Row(
                              children: [
                                Text('2021/12/10 16:44:05',
                                  style:TextStyle(
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
                        padding: EdgeInsets.all(15),
                        width:MediaQuery.of(context).size.width,
                        height:115,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('유운성',
                                      style:TextStyle(
                                        color:Color(0xFF444444),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize:15,
                                      ),
                                    ),
                                    Text('대기중',
                                      style:TextStyle(
                                        fontSize:12,
                                        color:Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:7),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('인테리어 서비스 | 필름 시공',
                                          style:TextStyle(
                                            fontSize:12,
                                            color:Color(0xfF777777),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text('524,000',
                                              style:TextStyle(
                                                fontSize:20,
                                                color:Colors.black,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                            SizedBox(width:5),
                                            Container(
                                              width:15,
                                              height:15,
                                              decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color:Colors.black,
                                              ),
                                              child: Center(
                                                child: Text('C',
                                                  style:TextStyle(
                                                    fontSize:10,
                                                    color:Colors.white,
                                                    fontFamily: 'Jalnan',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:20),
                            Row(
                              children: [
                                Text('2021/12/10 16:44:05',
                                  style:TextStyle(
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

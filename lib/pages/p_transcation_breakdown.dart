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
                  Container(
                    padding: EdgeInsets.all(15),
                    width:MediaQuery.of(context).size.width,
                    height:140,
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
                                            fontSize:12,
                                            color:Color(0xfF777777),
                                          ),
                                        ),
                                        Container(
                                          width:15,
                                          height:15,
                                          decoration:BoxDecoration(
                                            color:Color(0xFF025595),
                                          ),
                                          child: Text('',
                                            style:TextStyle(
                                              fontSize:12,
                                              color:Color(0xfF777777),
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
                        SizedBox(width:10),
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
                            Container(
                              width:100,
                              height:25,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color:Color(0xFF929292),
                              ),
                              child: Center(
                                child: Text('후기 작성 완료',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:12,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                    padding: EdgeInsets.all(10),
                    width:MediaQuery.of(context).size.width,
                    height:140,
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
                            Image.asset("assets/img5.png", width:70,height:70),
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
                                      Text('클린 작업대',
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
                                SizedBox(height:2),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('클린 서비스 | 이사 청소',
                                          style:TextStyle(
                                            fontSize:12,
                                            color:Color(0xfF777777),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:10),
                                    Row(
                                      children: [
                                        Text('계약금',
                                          style:TextStyle(
                                            fontSize:12,
                                            fontFamily: 'NanumSquareR',
                                          ),
                                        ),
                                        SizedBox(width:5),
                                        Text('30,000원',
                                          style:TextStyle(
                                            fontSize:12,
                                            fontFamily: 'NanumSquareB',
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
                                Text('후기를 작성해주세요.',
                                  style:TextStyle(
                                    fontSize:13,
                                    color:Color(0xFF777777),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap:(){
                                print('xx');
                              },
                              child: Container(
                                width:100,
                                height:25,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color:Color(0xFF025595),
                                ),
                                child: Center(
                                  child: Text('후기 작성 하기',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize:12,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}

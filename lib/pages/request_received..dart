import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/request_form.dart';

import 'main_arlim.dart';

class Request_Received extends StatefulWidget {
  const Request_Received({Key? key}) : super(key: key);

  @override
  _Request_ReceivedState createState() => _Request_ReceivedState();
}

class _Request_ReceivedState extends State<Request_Received> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('받은 요청서',
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
            SizedBox(height:20),
            Container(
              margin: EdgeInsets.only(left:15,right:15),
              padding: EdgeInsets.all(10),
              width:MediaQuery.of(context).size.width,
              height:165,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width:5,
                            height:5,
                            decoration:BoxDecoration(
                              color:Color(0xFF025595),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(width:5),
                          Text('인테리어 서비스 | 올 인테리어',
                            style:TextStyle(
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ],
                      ),
                      Text('5시간 전',
                        style:TextStyle(
                          fontFamily: 'NanumSquareR',
                          fontSize:11,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('서울 양천구',
                            style:TextStyle(
                              fontSize: 11,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:3),
                          Row(
                            children: [
                              Text('김이박 | 받은 견적서',
                                style:TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'NanumSquareR',
                                ),
                              ),
                              Text('4개',
                                style:TextStyle(
                                  fontSize: 11,
                                  color:Color(0xFF025595),
                                  fontFamily: 'NanumSquareR',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height:15),
                  Row(
                    children: [
                      Container(
                        width:65,
                        height:20,
                        decoration: BoxDecoration(
                          color:Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('올 인테리어',
                            style:TextStyle(
                              fontSize:11,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:5),
                      Container(
                        width:30,
                        height:20,
                        decoration: BoxDecoration(
                          color:Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('거주',
                            style:TextStyle(
                              fontSize:11,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:5),
                      Container(
                        width:35,
                        height:20,
                        decoration: BoxDecoration(
                          color:Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('24평',
                            style:TextStyle(
                              fontSize:11,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:5),
                      Container(
                        width:30,
                        height:20,
                        decoration: BoxDecoration(
                          color:Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('전체',
                            style:TextStyle(
                              fontSize:11,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:5),
                      Container(
                        width:30,
                        height:20,
                        decoration: BoxDecoration(
                          color:Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('서울',
                            style:TextStyle(
                              fontSize:11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:(){
                          },
                          child: Container(
                            width:165,
                            height:30,
                            decoration:BoxDecoration(
                                color:Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(5),
                                border:Border.all(
                                  width:0.5,
                                  color:Color(0xFFCCCCCC),
                                )
                            ),
                            child: Center(
                              child: Text('삭제',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                          flex: 1,
                          child:InkWell(
                            onTap:(){
                              Get.to(RequestForm());
                            },
                            child: Container(
                              width:165,
                              height:30,
                              decoration:BoxDecoration(
                                color:Color(0xFF025595),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('자세히 보기',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:13,
                                  ),
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
    );
  }
}

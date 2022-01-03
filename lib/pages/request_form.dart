import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('요청서',
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
                  child: Row(
                    children: [
                      Image.asset("assets/p_request.png",width:90,height:90),
                      SizedBox(width:10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('김이박',
                            style:TextStyle(
                              fontFamily: 'NanumSquareEB',
                              fontSize:15,
                            ),
                          ),
                          SizedBox(height:10),
                          Text('서울 양천구',
                            style:TextStyle(
                              fontSize:12,
                            ),
                          ),
                          SizedBox(height:5),
                          Row(
                            children: [
                              Text('받은 견적서',
                                style:TextStyle(
                                  fontSize:12,
                                ),
                              ),
                              Text('4개',
                                style:TextStyle(
                                  fontSize:12,
                                  color:Color(0xFF025595)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap:(){},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                      ),
                    ),
                    width:MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left:15,right:15,top:25,bottom:25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('요청글',
                              style:TextStyle(
                                fontSize:13,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            SizedBox(height:7),
                            Text('안녕하세요! \n전체 인테리어 요청 합니다. 깔끔하고 모던한 느낌으로 비용은 5000~6000만원 정도 예상중이고 ~~입니다. 감사합니다 ',
                              style:TextStyle(
                                fontSize:12,
                                height:1.6,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('원하는 서비스',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:7),
                      Text('인체리어 서비스 | 올 인테리어',
                        style:TextStyle(
                          fontSize:12,
                          height:1.6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('날짜',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:7),
                      Text('3개월 이내로 부탁드립니다.',
                        style:TextStyle(
                          fontSize:12,
                          height:1.6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공간 유형',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:7),
                      Text('거주',
                        style:TextStyle(
                          fontSize:12,
                          height:1.6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공간 선택',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:7),
                      Text('전체 공간',
                        style:TextStyle(
                          fontSize:12,
                          height:1.6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('지역',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:7),
                      Text('서울 양천구',
                        style:TextStyle(
                          fontSize:12,
                          height:1.6,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height:30),
                InkWell(
                  onTap:(){
                    
                  },
                  child: Container(
                    width:200,
                    height:40,
                    decoration: BoxDecoration(
                      color:Color(0xFF025595),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('견적서 보내기',
                        style:TextStyle(
                          color:Colors.white,
                          fontFamily: 'NanumSquareB',
                          fontSize:15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

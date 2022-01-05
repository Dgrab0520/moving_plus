import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'homepage.dart';
import 'p_chat.dart';

class Request_Estimate2 extends StatefulWidget {
  const Request_Estimate2({Key? key}) : super(key: key);

  @override
  _Request_Estimate2State createState() => _Request_Estimate2State();
}

class _Request_Estimate2State extends State<Request_Estimate2> {
  int _selectedIndex = 1;
  DateTime currentBackPressTime = DateTime.now();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('견척 신청',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left:15,right:15,top:20,bottom:20),
              width:Get.width,
              decoration:BoxDecoration(
                border:Border(
                  bottom:BorderSide(width:1, color:Color(0xFFcccccc)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('100% 완료 시 최소 4명 이상의 파트너를 추천 해드립니다.',
                    style:TextStyle(
                      fontFamily: 'NanumSquareR',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height:5),
                  Row(
                    children: [
                      Expanded(
                        flex:9,
                        child: Container(
                          height: 20,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: BarProgress(
                            percentage: 90.0,
                            backColor: Color(0xFFCCCCCC),
                            gradient: LinearGradient(colors: [ Color(0xFF5D91B9), Color(0xFF025595)]),
                            showPercentage: false,
                            stroke: 10,
                            round: true,
                          ),
                        ),
                      ),
                      Expanded(
                        flex:1,
                        child: Container(
                          child: Text('90%',
                            style: TextStyle(
                              color:Color(0xFF025595),
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

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('예산',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '0 원',
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: Container(
                          height:35,
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('희망 시공 일정',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '',
                              icon: InkWell(
                                  onTap:(){
                                    Future<DateTime?> d = showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2021),
                                        lastDate: DateTime(2023));
                                    d.then((value) {
                                      setState(() {
                                        var selectDate = value!;
                                      });
                                    });
                                  },
                                  child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,))
                          ),
                        ),
                      ),

                      Expanded(
                        flex:1,
                        child:Center(child: Text('~')),
                      ),

                      Expanded(
                        flex:3,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '',
                              icon: InkWell(
                                  onTap:(){
                                    Future<DateTime?> d = showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2021),
                                        lastDate: DateTime(2023));
                                    d.then((value) {
                                      setState(() {
                                        var selectDate = value!;
                                      });
                                    });
                                  },
                                  child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,))
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('공간 선택',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFF025595),
                              ),
                            ),
                            child: Center(
                              child: Text('아파트',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFFCCCCCC),
                              ),
                            ),
                            child: Center(
                              child: Text('오피스텔',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFFCCCCCC),
                              ),
                            ),
                            child: Center(
                              child: Text('빌라',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFFCCCCCC),
                              ),
                            ),
                            child: Center(
                              child: Text('주택',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
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

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('주소',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
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
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('상세 주소',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
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
                          ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('요청 사항',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                    padding: EdgeInsets.only(right:10),
                    width:MediaQuery.of(context).size.width,
                    height:80,
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
                      maxLength: 150,
                      onChanged: (text){
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height:30),
            InkWell(
              onTap: (){
                Get.off(Main_Page(index: 1,));
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  width: 260,
                  height:50,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:Color(0xFF025595),
                  ),
                  child: Center(
                    child: Text('신청 하기',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:100),
          ],
        ),


      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF025595),
          unselectedFontSize: 11,
          currentIndex: _selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            Get.off(Main_Page(index: index,));
          },

          items: [
            BottomNavigationBarItem(
              title: Text('견적신청',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 11,
                ),
              ),
              icon: new Image.asset(
                "assets/notice.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/notice.png",
                width: 22,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('홈',
                  style:TextStyle(
                    color:Colors.white,
                    fontSize:11,
                  )
              ),
              icon: new Image.asset(
                "assets/home.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/home.png",
                width: 22,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('채팅',
                  style:TextStyle(
                    color:Colors.white,
                    fontSize:11,
                  )
              ),
              icon: new Image.asset(
                "assets/chat.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/chat.png",
                width: 22,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

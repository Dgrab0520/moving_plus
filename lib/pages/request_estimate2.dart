import 'package:flutter/cupertino.dart';
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
  bool _gongan1 = false;
  bool _gongan2 = false;
  bool _gongan3 = false;
  bool _gongan4 = false;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  int _selectedIndex = 1;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                    SizedBox(height:5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width*0.7,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NanumSquareB',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF025595)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF025595)),
                              ),
                              suffixText: '원  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '예산을 입력 해주세요',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height:40),
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
                    SizedBox(height:15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 20.0,),

                          Text('~'),

                          SizedBox(width: 20.0,),

                          InkWell(
                            onTap: () => _selectDate2(context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "${selectedDate2.toLocal()}".split(' ')[0],
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),

              SizedBox(height:40),
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
                    SizedBox(height:15),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan1 = !_gongan1;
                              })
                            },
                            child: Text('아파트'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan1 ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan2 = !_gongan2;
                              })
                            },
                            child: Text('오피스텔'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan2 ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan3 = !_gongan3;
                              })
                            },
                            child: Text('빌라'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan3 ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan4 = !_gongan4;
                              })
                            },
                            child: Text('주택'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan4 ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height:40),
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
                      padding: EdgeInsets.only(left:15,right:15,bottom:8),
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
                            icon: Container(
                                padding: EdgeInsets.only(top:8),
                                child: Icon(Icons.search))),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height:40),
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
                      padding: EdgeInsets.only(left:15,right:15,bottom:8),
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

              SizedBox(height:40),
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
                      padding: EdgeInsets.only(left:15, right:15),
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
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        maxLength: 150,
                        maxLines: null,
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

              SizedBox(height:40),
              InkWell(
                onTap: (){
                  Get.dialog(
                      AlertDialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          title: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text("신청완료", style:
                              TextStyle(
                                fontFamily:
                                'NanumSquareB',
                                color:
                                Colors.black,
                                fontSize: 16,
                              ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(CupertinoIcons.xmark, size: 16,),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('견적 신청이 완료되었습니다', style:
                              TextStyle(
                                fontFamily: 'NanumSquareB',
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              ),
                              SizedBox(height: 10.0,),
                              Text('추가 견적 의뢰가 있을 경우 \n계속하기 버튼을 클릭하여 진행해주세요', style:
                              TextStyle(
                                fontFamily: 'NanumSquareL',
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(width: 1.0, color: Color(0xffd0d0d0))
                                          ),
                                          child: Center(
                                            child: Text('계속하기', style:
                                            TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){
                                        Get.off(Main_Page(index: 1,));
                                      },
                                      child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(width: 1.0, color: Color(0xffd0d0d0))
                                          ),
                                          child: Center(
                                            child: Text('완료하기', style:
                                            TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      )
                  );
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
              SizedBox(height:120),
            ],
          ),


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

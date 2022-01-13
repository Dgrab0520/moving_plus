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

  bool _time = false;
  bool _time2 = false;
  bool _time3 = false;

  bool _yes = false;
  bool _no = false;

  bool _Businesstype1 = false;
  bool _Businesstype2 = false;
  bool _Businesstype3 = false;
  bool _Businesstype4 = false;

  bool _buttonPressed = false;

  bool _wall1 = false;
  bool _wall2 = false;
  bool _wall3 = false;
  bool _wall4 = false;
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
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text('예산',
                //       style:TextStyle(
                //         fontSize:14,
                //         fontFamily: 'NanumSquareB',
                //       ),
                //     ),
                //     SizedBox(height:5),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           width: Get.width*0.7,
                //           child: TextField(
                //             style: TextStyle(
                //               fontSize: 17,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: 'NanumSquareB',
                //             ),
                //             textAlign: TextAlign.center,
                //             keyboardType: TextInputType.number,
                //             decoration: InputDecoration(
                //               enabledBorder: UnderlineInputBorder(
                //                 borderSide: BorderSide(color: Color(0xFF025595)),
                //               ),
                //               focusedBorder: UnderlineInputBorder(
                //                 borderSide: BorderSide(color: Color(0xFF025595)),
                //               ),
                //               suffixText: '원  ',
                //               suffixStyle: TextStyle(
                //                   fontSize: 17.0,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black54
                //               ),
                //               hintText: '예산을 입력 해주세요',
                //               hintStyle: TextStyle(
                //                 color:Color(0xFF777777),
                //                 fontSize: 12,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ),
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
                    Text('방문시간',
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
                                _time = !_time;
                              })
                            },
                            child: Text('무관'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width:5),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _time2 = !_time2;
                              })
                            },
                            child: Text('오전'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time2 ? RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF025595), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ) : RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width:5),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _time3 = !_time3;
                              })
                            },
                            child: Text('오후'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time3 ? RoundedRectangleBorder(
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
                  ],
                ),
              ),

              SizedBox(height:40),



              //입주청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //이사청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //인테리어 청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //거주청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //준공청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('총 층수',
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
                              suffixText: '층  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '총 층수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                    Text('폐기물 여부',
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
                                 _yes = !_yes;
                              })
                            },
                            child: Text('있다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _yes ? RoundedRectangleBorder(
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
                                _no = !_no;
                              })
                            },
                            child: Text('없다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _no ? RoundedRectangleBorder(
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



              //정기청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                    Text('업종',
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
                                _Businesstype1 = !_Businesstype1;
                              })
                            },
                            child: Text('사무실'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype1 ? RoundedRectangleBorder(
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
                                _Businesstype2 = !_Businesstype2;
                              })
                            },
                            child: Text('병원'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype2 ? RoundedRectangleBorder(
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
                                _Businesstype3 = !_Businesstype3;
                              })
                            },
                            child: Text('일반가정'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype3 ? RoundedRectangleBorder(
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
                                _Businesstype4 = !_Businesstype4;
                              })
                            },
                            child: Text('미용실'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype4 ? RoundedRectangleBorder(
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방문 횟수',
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
                              suffixText: '회  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방문 횟수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //화재청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                    Text('폐기물 여부',
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
                                _yes = !_yes;
                              })
                            },
                            child: Text('있다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _yes ? RoundedRectangleBorder(
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
                                _no = !_no;
                              })
                            },
                            child: Text('없다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _no ? RoundedRectangleBorder(
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //쓰레기집청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                    Text('폐기물 여부',
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
                                _yes = !_yes;
                              })
                            },
                            child: Text('있다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _yes ? RoundedRectangleBorder(
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
                                _no = !_no;
                              })
                            },
                            child: Text('없다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _no ? RoundedRectangleBorder(
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //간판청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('층수',
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
                              suffixText: '층  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '층수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                    Text('사이즈',
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
                          child: Container(
                            width: Get.width*0.4,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
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
                                hintText: '사이즈를 입력 해주세요',
                                hintStyle: TextStyle(
                                  color:Color(0xFF777777),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                            child: RaisedButton(
                              child: new Text('㎡',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              textColor: Colors.white,
                              // 2
                              color: _buttonPressed ? Color(0xFF025595) : Color(0xFF777777),
                              // 3
                              onPressed: () => {
                                setState(() {
                                  _buttonPressed = !_buttonPressed;
                                })
                              },
                            )
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //외벽청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('총 층수',
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
                              suffixText: '층  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '층수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                    Text('벽면 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('유리'),
                           color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('오피스텔'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('타일'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('벽돌'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //학교/관공서청소
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사무실 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '사무실 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('총 층수',
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
                              suffixText: '층  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '층수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //상가청소
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('업종',
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
                                _Businesstype1 = !_Businesstype1;
                              })
                            },
                            child: Text('음식점'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype1 ? RoundedRectangleBorder(
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
                                _Businesstype2 = !_Businesstype2;
                              })
                            },
                            child: Text('꽃집'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype2 ? RoundedRectangleBorder(
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
                                _Businesstype3 = !_Businesstype3;
                              })
                            },
                            child: Text('커피숍'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype3 ? RoundedRectangleBorder(
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
                                _Businesstype4 = !_Businesstype4;
                              })
                            },
                            child: Text('미용실'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype4 ? RoundedRectangleBorder(
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
                    Text('복층 여부',
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
                                _yes = !_yes;
                              })
                            },
                            child: Text('있다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _yes ? RoundedRectangleBorder(
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
                                _no = !_no;
                              })
                            },
                            child: Text('없다'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _no ? RoundedRectangleBorder(
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //주방후드드청소
             Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('업종',
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
                                _Businesstype1 = !_Businesstype1;
                              })
                            },
                            child: Text('음식점'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype1 ? RoundedRectangleBorder(
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
                                _Businesstype2 = !_Businesstype2;
                              })
                            },
                            child: Text('꽃집'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype2 ? RoundedRectangleBorder(
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
                                _Businesstype3 = !_Businesstype3;
                              })
                            },
                            child: Text('커피숍'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype3 ? RoundedRectangleBorder(
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
                                _Businesstype4 = !_Businesstype4;
                              })
                            },
                            child: Text('미용실'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _Businesstype4 ? RoundedRectangleBorder(
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
                    Text('사이즈',
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
                          child: Container(
                            width: Get.width*0.4,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
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
                                hintText: '사이즈를 입력 해주세요',
                                hintStyle: TextStyle(
                                  color:Color(0xFF777777),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                            child: RaisedButton(
                              child: new Text('㎡',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              textColor: Colors.white,
                              // 2
                              color: _buttonPressed ? Color(0xFF025595) : Color(0xFF777777),
                              // 3
                              onPressed: () => {
                                setState(() {
                                  _buttonPressed = !_buttonPressed;
                                })
                              },
                            )
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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




              //기타청소
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 첨부',
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
                          child: Container(
                            padding: EdgeInsets.only(left:15, right:15),
                            width:MediaQuery.of(context).size.width,
                            height:50,
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
                              maxLines: null,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Expanded(
                          child: InkWell(
                            onTap: (){
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
                                  child: Text('사진',
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
                        ),
                      ],
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



              //인테리어
              //올인테리어
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('준공 년도',
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
                              suffixText: '년  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '준공 년도를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //팔름인테리어
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //탄성코트
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //도배
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //장판/마루
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //패인트
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
              



              //방충망 교체
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방충망 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방충망 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //욕실인테리어
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //타일교체
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




              //중문
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



              //커튼,블라인드
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




                 //바닥매트
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('건물 형태',
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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




              //기타인테리어
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




              //홈스타일링서비스
              //줄눈
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('베란다 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '베란다 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //실리콘오염방지
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //욕실나노코팅
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('화장실 수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '화장실 수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //상판연마코팅
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('싱크대 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('ㅡ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('ㄱ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('ㄷ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('ㄹ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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



              //엔지니어스톤코팅
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('싱크대 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('ㅡ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('ㄱ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('ㄷ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('ㄹ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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

              SizedBox(height:40),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('벽면 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('유리'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('오피스텔'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('타일'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('벽돌'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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



              //엔지니어스톤코팅
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('싱크대 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('ㅡ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('ㄱ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('ㄷ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('ㄹ자'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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

              SizedBox(height:40),



              //바닥왁싱
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('바닥 형태',
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
                                _wall1 = !_wall1;
                              })
                            },
                            child: Text('유리'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall1 ? RoundedRectangleBorder(
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
                                _wall2 = !_wall2;
                              })
                            },
                            child: Text('오피스텔'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall2 ? RoundedRectangleBorder(
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
                                _wall3 = !_wall3;
                              })
                            },
                            child: Text('타일'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall3 ? RoundedRectangleBorder(
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
                                _wall4 = !_wall4;
                              })
                            },
                            child: Text('벽돌'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _wall4 ? RoundedRectangleBorder(
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



              //단열차단필름
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
              


              //정리정돈
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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
              


              //새집증후군
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('방 개수',
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
                              suffixText: '개  ',
                              suffixStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              hintText: '방 개수를 입력 해주세요.',
                              hintStyle: TextStyle(
                                color:Color(0xFF777777),
                                fontSize: 13,
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



              //곰팡이제거
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




              //기타홈스타일링
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

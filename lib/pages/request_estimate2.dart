import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:timelines/timelines.dart';

import 'homepage.dart';
import 'p_chat.dart';


final _processes = [
  '필수정보',
  '선택정보',
  '완료',
];


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

  int stage = 1;
  String? _serviceType = Get.parameters['serviceType'];
  String? _serviceForm;
  String? orderId = Get.parameters['orderId'];


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

  Color getColor(int index) {
    if (index == 2) {
      return inProgressColor;
    } else{
      return completeColor;
    }
  }

  int _selectedIndex = 1;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  DateTime currentBackPressTime = DateTime.now();
  @override
  void initState() {
    print('pop$_serviceType');
    if(_serviceType == "입주 청소" || _serviceType == "이사 청소" || _serviceType == "인테리어 청소" || _serviceType == "거주 청소"){
      setState(() {
        _serviceForm = '1';
      });
    }else if(_serviceType == "준공 청소"){
      setState(() {
        _serviceForm = '2';
      });
    }else if(_serviceType == "정기 청소"){
      setState(() {
        _serviceForm = '3';
      });
    }else if(_serviceType == "화재 청소" || _serviceType == "쓰레기집 청소"){
      setState(() {
        _serviceForm = '4';
      });
    }else if(_serviceType == "간판 청소"){
      setState(() {
        _serviceForm = '5';
      });
    }else if(_serviceType == "외벽 청소"){
      setState(() {
        _serviceForm = '6';
      });
    }else if(_serviceType == "학교/관공서 청소"){
      setState(() {
        _serviceForm = '7';
      });
    }else if(_serviceType == "상가 청소"){
      setState(() {
        _serviceForm = '8';
      });
    }else if(_serviceType == "주방후드 청소"){
      setState(() {
        _serviceForm = '9';
      });
    }else if(_serviceType == "기타 청소" || _serviceType == "기타 인테리어" || _serviceType == "곰팡이 제거" || _serviceType == "기타 인테리어" || _serviceType == "페인트" || _serviceType == "중문" || _serviceType == "타일 교체"){
      setState(() {
        _serviceForm = '10';
      });
    }else if(_serviceType == "올 인테리어"){
      setState(() {
        _serviceForm = '11';
      });
    }else if(_serviceType == "필름 인테리어"){
      setState(() {
        _serviceForm = '12';
      });
    }else if(_serviceType == "탄성 코트"){
      setState(() {
        _serviceForm = '13';
      });
    // }else if(_serviceType == "탄성 코트"){
    //   setState(() {
    //     _serviceForm = '14';
    //   });
    }else if(_serviceType == "도배" || _serviceType == "장판 "){
      setState(() {
        _serviceForm = '15';
      });
    // }
    // else if(){
    //   setState(() {
    //     _serviceForm = '16';
    //   });
    }else if(_serviceType == "방충망 교체"){
      setState(() {
        _serviceForm = '17';
      });
    }else if(_serviceType == "욕실 인테리어" || _serviceType == "실리콘 오염 방지" || _serviceType == "욕실 나노 코팅"){
      setState(() {
        _serviceForm = '18';
      });
    }else if(_serviceType == "커튼 " || _serviceType == "바닥 매트"){
      setState(() {
        _serviceForm = '19';
      });
    }else if(_serviceType == "줄눈"){
      setState(() {
        _serviceForm = '20';
      });
    }else if(_serviceType == "상판 연마 코팅" || _serviceType == "엔지니어스톤 코팅"){
      setState(() {
        _serviceForm = '21';
      });
    }else if(_serviceType == "바닥 왁싱"){
      setState(() {
        _serviceForm = '22';
      });
    }else if(_serviceType == "단열 차단 필름" || _serviceType == "정리정돈" || _serviceType == "새집 증후군"){
      setState(() {
        _serviceForm = '23';
      });
    }

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
          print(_serviceForm);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TimeLine
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
                    SizedBox(
                      height: 100.0,
                      width: Get.width,
                      child: Timeline.tileBuilder(
                        theme: TimelineThemeData(
                            direction: Axis.horizontal,
                            connectorTheme: ConnectorThemeData(
                                space: 15.0,
                                thickness: 3.0
                            )
                        ),
                        builder: TimelineTileBuilder.connected(
                          connectionDirection: ConnectionDirection.before,
                          itemExtentBuilder: (_, __) =>
                          MediaQuery.of(context).size.width / _processes.length,

                          contentsBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                _processes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.0,
                                  color: index == stage ? inProgressColor : completeColor,
                                ),
                              ),
                            );
                          },
                          indicatorBuilder: (_, index) {
                            var color;
                            var child;
                            if (index == stage) {
                              color = Color(0xff5ec792);
                              child = Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 2.5, color: Colors.white),
                                      color: Color(0xff5ec792),
                                    ),
                                  )
                              );
                            } else {
                              color = completeColor;
                            }

                            if (index <= 2) {
                              return Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(30.0, 30.0),
                                  ),
                                  DotIndicator(
                                    size: 30.0,
                                    color: color,
                                    child: child,
                                  ),
                                ],
                              );
                            } else {
                              return Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(15.0, 15.0),
                                  ),
                                  OutlinedDotIndicator(
                                    borderWidth: 4.0,
                                    color: Colors.pink,
                                  ),
                                ],
                              );
                            }
                          },
                          connectorBuilder: (_, index, type) {
                            if (index > 0) {
                              if (index == 2) {
                                final prevColor = getColor(index - 1);
                                final color = getColor(index);

                                return DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                      color: Color(0xff071039)
                                  ),
                                );
                              } else {
                                return SolidLineConnector(
                                  color: Color(0xff071039),
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          itemCount: _processes.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:30),

              //희망일정
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
              //방문시간
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



              ////////////////////////////////////////////////////////////////////////

              _serviceForm == '1'
                  ?

              //입주청소
              Column(
                  children: <Widget>[
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

                    SizedBox(height:40.0),

                    Container(
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('방 개수',
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('화장실\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('베란다\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '2'
                  ?

              //준공청소
              Column(
                  children: <Widget>[
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('총 층수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                                width: Get.width*0.5,
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

                  ]
              )

                  :
              _serviceForm == '3'
                  ?

              //정기청소
              Column(
                  children: <Widget>[
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('방문 횟수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),

                    ),

                  ]
              )

                  :
              _serviceForm == '4'
                  ?

              //화재청소 && 쓰레기집 청소
              Column(
                  children: <Widget>[
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
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('방 개수',
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('화장실\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('베란다\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              )
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
                  ]
              )

                  :
              _serviceForm == '5'
                  ?

              //간판청소
              Column(
                  children: <Widget>[
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('층 수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '층 수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:40),
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('사이즈',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  suffixText: '㎡  ',
                                  suffixStyle: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54
                                  ),
                                  hintText: '사이즈를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )

                  :
              _serviceForm == '6'
                  ?

              //외벽청소
              Column(
                  children: <Widget>[
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('총 층 수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '층 수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
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
                  ]
              )

                  :
              _serviceForm == '7'
                  ?

              //학교/관공서청소
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('사무실\n개수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:40),
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('총 층 수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '층 수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '8'
                  ?

              //상가청소
              Column(
                  children: <Widget>[
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
                  ]
              )
                  :
              _serviceForm == '9'
                  ?

              //주방후드드청소
              Column(
                  children: <Widget>[
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
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('사이즈',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  suffixText: '㎡  ',
                                  suffixStyle: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54
                                  ),
                                  hintText: '사이즈를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '10'
                  ?
              Container()
                  :
              _serviceForm == '11'
                  ?

              //올인테리어
              Column(
                  children: <Widget>[
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
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('  준공 \n  년도 ',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '년',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('방 개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('화장실\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('베란다\n개수',
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            fontSize:14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(width: 15.0,),
                                        Container(
                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color(0xFFcccccc),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          child: const TextField(
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixText: '개',
                                              suffixStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '12'
                  ?

              //필름인테리어
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('방 개수',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    SizedBox(width: 15.0,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            color: Color(0xFFcccccc),
                                          ),
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: const TextField(
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixText: '개',
                                          suffixStyle: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('화장실\n개수',
                                      textAlign: TextAlign.center,
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    SizedBox(width: 15.0,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            color: Color(0xFFcccccc),
                                          ),
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: const TextField(
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixText: '개',
                                          suffixStyle: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '13'
                  ?

              //탄성코트
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('베란다 수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),

                          SizedBox(height:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                                width: Get.width*0.5,
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
                          )
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '15'
                  ?

              //도배/장판
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('방 개수',
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '17'
                  ?

              //방충망 교체
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('방충망\n개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '18'
                  ?


              //욕실인테리어/실리콘 오염 방지/욕실 나노 코팅
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('화장실\n개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '화장실 개수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              _serviceForm == '19'
                  ?

              //커튼/바닥매트
              Column(
                  children: <Widget>[
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('방 개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:40),
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('베란다\n개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '베란다 개수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ]
              )
                  :
              _serviceForm == '20'
                  ?

              //줄눈
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('화장실\n개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '화장실 개수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:40),
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('베란다\n개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                                  hintText: '베란다 개수를 입력 해주세요.',
                                  hintStyle: TextStyle(
                                    color:Color(0xFF777777),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ]
              )
                  :
              _serviceForm == '21'
                  ?

              //상판연마코팅/엔지니어스톤 코팅
              Column(
                  children: <Widget>[
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
                  ]
              )
                  :
              _serviceForm == '22'
                  ?

              //바닥왁싱
              Column(
                  children: <Widget>[
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
                  ]
              )
                  :
              _serviceForm == '23'
                  ?

              //단열차단필름/정리정돈/새집 증후군
              Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('방 개수',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize:14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: Get.width*0.5,
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
                          ),
                        ],
                      ),
                    ),
                  ]
              )
                  :
              Container(),


              ////////////////////////////////////////////////////////////////////////

              //요청사항
              SizedBox(height:40.0),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15,),
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
                      padding: EdgeInsets.only(left:15, right:15, bottom: 10.0),
                      width:MediaQuery.of(context).size.width,
                      height:100,
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
                        style: TextStyle(fontSize: 14.0),
                        keyboardType: TextInputType.multiline,
                        maxLength: 500,
                        maxLines: 5,
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

              //사진첨부
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
              SizedBox(height:60.0),

              //확인 BTN
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


              ////////////////////////////////////////////////////////////////////////

            ],
          ),
        ),
      ),
    );
  }
}
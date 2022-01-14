import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/request_estimate2.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:timelines/timelines.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:flutter/cupertino.dart';


final _processes = [
  '필수정보',
  '선택정보',
  '완료',
];

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);

class Request_Estimate extends StatefulWidget {

  const Request_Estimate({Key? key,}) : super(key: key);

  @override
  _Request_EstimateState createState() => _Request_EstimateState();
}

class _Request_EstimateState extends State<Request_Estimate> {
  bool _gongan5 = false;
  bool _gongan6 = false;

  bool _gongan10 = false;
  bool _gongan11 = false;
  bool _gongan12 = false;
  bool _gongan13 = false;
  bool _gongan14 = false;
  bool _gongan15 = false;

  bool _buttonPressed = false;
  bool _buttonPressed2 = false;

  String addressJSON = '';
  String? _serviceType = '';

  Color getColor(int index) {
    if (index == 2) {
      return inProgressColor;
    } else{
      return completeColor;
    }
  }

  @override
  void initState(){
    _serviceType = Get.parameters['serviceType'];
    print('ppap$_serviceType');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('견적 신청',
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
                                  color: index == 0 ? inProgressColor : completeColor,
                                ),
                              ),
                            );
                          },
                          indicatorBuilder: (_, index) {
                            var color;
                            var child;
                            if (index == 0) {
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
                            } else if (index < 2) {
                              color = completeColor;
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
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
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
                          GestureDetector(
                            onTap: () async {
                              KopoModel model = await Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RemediKopo(),
                                ),
                              );
                              print(model.toJson());
                              setState(() {
                                addressJSON =
                                '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''} ${model.zonecode} ';
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
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
                                child: Center(
                                  child: Text(addressJSON == '' ? '주소를 입력해주세요' : '$addressJSON', style:
                                    TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black54
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                )
                              ),
                            )
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            padding: EdgeInsets.only(left:10,right:10,),
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
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13.0, color: Colors.black87),
                              onChanged: (text){
                              },
                              decoration: InputDecoration(
                                hintText: '상세 주소를 입력해주세요',
                                hintStyle: TextStyle(fontSize: 13.0, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:30),
                    Text('공간 유형',
                      style:TextStyle(
                        fontSize:14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan5 = !_gongan5;
                              })
                            },
                            child: Text('거주'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan5 ? RoundedRectangleBorder(
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
                                _gongan6 = !_gongan6;
                              })
                            },
                            child: Text('상업'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan6 ? RoundedRectangleBorder(
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

              SizedBox(height:30),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left:15,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('평수 ( 공급면적 )',
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
                                hintText: '공급 면적을 입력 해주세요',
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
                              child: new Text('평',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              textColor: Colors.white,
                              // 2
                              color: _buttonPressed2 ? Color(0xFF025595) : Color(0xFF777777),
                              // 3
                              onPressed: () => {
                                setState(() {
                                  _buttonPressed2 = !_buttonPressed2;
                                })
                              },
                            )
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

              SizedBox(height:30),
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('성함',
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

              SizedBox(height:30),
              Container(
                padding: EdgeInsets.only(left:15,right:15),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('연락처',
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
              InkWell(
                onTap: (){
                  Get.toNamed('/request_estimate2/true?serviceType=$_serviceType');
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
                      child: Text('다음 단계',
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
      ),
    );
  }
}
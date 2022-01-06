import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/request_estimate2.dart';
import 'package:progress_indicator/progress_indicator.dart';


class Request_Estimate extends StatefulWidget {
  const Request_Estimate({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            percentage: 50.0,
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
                          child: Text('50%',
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
                        child: RaisedButton(
                          onPressed: () => {
                            setState(() {
                              _gongan10 = !_gongan10;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_1.png", width:45 ,height:35),
                              const SizedBox(height:10),
                              const Text('주방',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan10 ? RoundedRectangleBorder(
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
                              _gongan11 = !_gongan11;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_2.png", width:45 ,height:35),
                              const SizedBox(height:10),
                              const Text('욕실',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan11 ? RoundedRectangleBorder(
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
                              _gongan12 = !_gongan12;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_3.png", width:45 ,height:35),
                              const SizedBox(height:10),
                              const Text('거실',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan12 ? RoundedRectangleBorder(
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
                              _gongan13 = !_gongan13;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_4.png", width:45 ,height:35),
                              const SizedBox(height:10),
                              const Text('현관',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan13 ? RoundedRectangleBorder(
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
                              _gongan14 = !_gongan14;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_5.png", width:60 ,height:35),
                              const SizedBox(height:10),
                              const Text('도배',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan14 ? RoundedRectangleBorder(
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
                              _gongan15 = !_gongan15;
                            })
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/gong_6.png", width:45 ,height:35),
                              const SizedBox(height:10),
                              const Text('바닥',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:12,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: _gongan15 ? RoundedRectangleBorder(
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
            InkWell(
              onTap: (){
                Get.to(Request_Estimate2());
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
    );
  }
}

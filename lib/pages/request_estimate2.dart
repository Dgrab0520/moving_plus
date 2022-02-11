import 'dart:io';

import 'package:async/async.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/alarm_data.dart';
import 'package:moving_plus/datas/order_data.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/pages/interior_page.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:path/path.dart';

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
  final String? _serviceType = Get.parameters['serviceType'];
  String? address = Get.parameters['address'];
  String? _serviceForm;
  String? orderId = Get.parameters['orderId'];

  String? final_Selected1 = '';
  String? final_Selected2 = '';

  String? time = '';

  String? value1 = '';
  String? value2 = '';
  String? value3 = '';
  String? value4 = '';
  String? value5 = '';

  String img_no = '0';
  PickedFile? _image1;
  PickedFile? _image2;
  PickedFile? _image3;

  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendFCM',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 5)));

  sendAlarm() async {
    List<dynamic> tokenList = [];
    List<dynamic> nameList = [];

    await Pro_Data.selectProToken(_serviceType!, address!).then((value) {
      tokenList = value['token'];
      nameList = value['name'];
    });

    print("tokenList : $tokenList");
    final tempController = Get.put(ReactiveController());

    AlarmData.putChat(tempController.pro.value.pro_id, nameList, "estimate");

    final HttpsCallableResult result = await callable.call(
      <String, dynamic>{
        "token": tokenList,
        "title": "Alarm",
        "body": tempController.pro.value.pro_name,
      },
    );
    print(result);
  }

  TextEditingController? a_Controller = TextEditingController();
  TextEditingController? b_Controller = TextEditingController();
  TextEditingController? c_Controller = TextEditingController();
  TextEditingController? d_Controller = TextEditingController();
  TextEditingController? detail_Controller = TextEditingController();

  updateOrder() {
    OrderData.updateDetail(
            orderId.toString(),
            selectedDate.toString(),
            selectedDate2.toString(),
            time!,
            value1! == '' ? '' : value1!,
            value2! == '' ? '' : value2!,
            value3! == '' ? '' : value3!,
            value4! == '' ? '' : value4!,
            value5! == '' ? '' : value5!,
            detail_Controller!.text)
        .then((value) {
      if (value == "success") {
        sendAlarm();
        Get.dialog(AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "신청완료",
                  style: TextStyle(
                    fontFamily: 'NanumSquareB',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    CupertinoIcons.xmark,
                    size: 16,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '견적 신청이 완료되었습니다',
                  style: TextStyle(
                    fontFamily: 'NanumSquareB',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '추가 견적 의뢰가 있을 경우 \n계속하기 버튼을 클릭하여 진행해주세요',
                  style: TextStyle(
                    fontFamily: 'NanumSquareL',
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.off(Interior_Page(
                            categoryTitle: 0,
                          ));
                        },
                        child: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    width: 1.0, color: Color(0xffd0d0d0))),
                            child: Center(
                              child: Text(
                                '계속하기',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.off(Main_Page(
                            index: 1,
                          ));
                        },
                        child: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    width: 1.0, color: Color(0xffd0d0d0))),
                            child: Center(
                              child: Text(
                                '완료하기',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            )));
        print('Update Success');
      } else {
        print('$value : Update Fails');
      }
    });
  }

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
    } else {
      return completeColor;
    }
  }

  Future getImageGallery() async {
    var imageFile = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (img_no == '1') {
        _image1 = imageFile;
      } else if (img_no == '2') {
        _image2 = imageFile;
      } else if (img_no == '3') {
        _image3 = imageFile;
      }
    });

    if (img_no == '1') {
      upload(File(_image1!.path));
    } else if (img_no == '2') {
      upload(File(_image2!.path));
    } else if (img_no == '3') {
      upload(File(_image3!.path));
    }

    print('getImageGallery Success');
  }

  Future upload(File imageFile) async {
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://211.110.44.91/plus/plus_order_img.php");

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
    request.fields['order_id'] = orderId!;
    request.fields['img_no'] = img_no;

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Upload Failed');
    }
  }

  int _selectedIndex = 1;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    print('pop$orderId');
    if (_serviceType == "입주 청소" ||
        _serviceType == "이사 청소" ||
        _serviceType == "인테리어 청소" ||
        _serviceType == "거주 청소") {
      setState(() {
        _serviceForm = '1';
      });
    } else if (_serviceType == "준공 청소") {
      setState(() {
        _serviceForm = '2';
      });
    } else if (_serviceType == "정기 청소") {
      setState(() {
        _serviceForm = '3';
      });
    } else if (_serviceType == "화재 청소" || _serviceType == "쓰레기집 청소") {
      setState(() {
        _serviceForm = '4';
      });
    } else if (_serviceType == "간판 청소") {
      setState(() {
        _serviceForm = '5';
      });
    } else if (_serviceType == "외벽 청소") {
      setState(() {
        _serviceForm = '6';
      });
    } else if (_serviceType == "학교/관공서 청소") {
      setState(() {
        _serviceForm = '7';
      });
    } else if (_serviceType == "상가 청소") {
      setState(() {
        _serviceForm = '8';
      });
    } else if (_serviceType == "주방후드 청소") {
      setState(() {
        _serviceForm = '9';
      });
    } else if (_serviceType == "기타 청소" ||
        _serviceType == "기타 인테리어" ||
        _serviceType == "곰팡이 제거" ||
        _serviceType == "기타 인테리어" ||
        _serviceType == "페인트" ||
        _serviceType == "중문" ||
        _serviceType == "타일 교체") {
      setState(() {
        _serviceForm = '10';
      });
    } else if (_serviceType == "올 인테리어") {
      setState(() {
        _serviceForm = '11';
      });
    } else if (_serviceType == "필름 인테리어") {
      setState(() {
        _serviceForm = '12';
      });
    } else if (_serviceType == "탄성 코트") {
      setState(() {
        _serviceForm = '13';
      });
      // }else if(_serviceType == "탄성 코트"){
      //   setState(() {
      //     _serviceForm = '14';
      //   });
    } else if (_serviceType == "도배" || _serviceType == "장판 ") {
      setState(() {
        _serviceForm = '15';
      });
      // }
      // else if(){
      //   setState(() {
      //     _serviceForm = '16';
      //   });
    } else if (_serviceType == "방충망 교체") {
      setState(() {
        _serviceForm = '17';
      });
    } else if (_serviceType == "욕실 인테리어" ||
        _serviceType == "실리콘 오염 방지" ||
        _serviceType == "욕실 나노 코팅") {
      setState(() {
        _serviceForm = '18';
      });
    } else if (_serviceType == "커튼 " || _serviceType == "바닥 매트") {
      setState(() {
        _serviceForm = '19';
      });
    } else if (_serviceType == "줄눈") {
      setState(() {
        _serviceForm = '20';
      });
    } else if (_serviceType == "상판 연마 코팅" || _serviceType == "엔지니어스톤 코팅") {
      setState(() {
        _serviceForm = '21';
      });
    } else if (_serviceType == "바닥 왁싱") {
      setState(() {
        _serviceForm = '22';
      });
    } else if (_serviceType == "단열 차단 필름" ||
        _serviceType == "정리정돈" ||
        _serviceType == "새집 증후군") {
      setState(() {
        _serviceForm = '23';
      });

      ////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    } else if (_serviceType == "조명 설치") {
      setState(() {
        _serviceForm = '24';
      });
    } else if (_serviceType == "에어컨 이전 설치") {
      setState(() {
        _serviceForm = '25';
      });
    } else if (_serviceType == "에어컨 분해 청소" ||
        _serviceType == "세탁기 분해 청소" ||
        _serviceType == "냉장고 청소") {
      setState(() {
        _serviceForm = '26';
      });
    } else if (_serviceType == "맞춤 가구 제작") {
      setState(() {
        _serviceForm = '29';
      });
    } else if (_serviceType == "붙박이장 설치" ||
        _serviceType == "시스템 행거" ||
        _serviceType == "펜트리 선반 설치") {
      setState(() {
        _serviceForm = '30';
      });
    } else if (_serviceType == "쇼파 천갈이") {
      setState(() {
        _serviceForm = '31';
      });
    } else if (_serviceType == "매트리스 케어") {
      setState(() {
        _serviceForm = '33';
      });
    } else if (_serviceType == "사전점검" || _serviceType == "소독 / 방역") {
      setState(() {
        _serviceForm = '34';
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '견척 신청',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF025595),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          print(_serviceForm);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TimeLine
              // Container(
              //   padding:
              //       EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              //   width: Get.width,
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(width: 1, color: Color(0xFFcccccc)),
              //     ),
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: 100.0,
              //         width: Get.width,
              //         child: Timeline.tileBuilder(
              //           theme: TimelineThemeData(
              //               direction: Axis.horizontal,
              //               connectorTheme: ConnectorThemeData(
              //                   space: 15.0, thickness: 3.0)),
              //           builder: TimelineTileBuilder.connected(
              //             connectionDirection: ConnectionDirection.before,
              //             itemExtentBuilder: (_, __) =>
              //                 MediaQuery.of(context).size.width /
              //                 _processes.length,
              //             contentsBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.only(top: 8.0),
              //                 child: Text(
              //                   _processes[index],
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 11.0,
              //                     color: index == stage
              //                         ? inProgressColor
              //                         : completeColor,
              //                   ),
              //                 ),
              //               );
              //             },
              //             indicatorBuilder: (_, index) {
              //               var color;
              //               var child;
              //               if (index == stage) {
              //                 color = Color(0xff5ec792);
              //                 child = Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Container(
              //                       decoration: BoxDecoration(
              //                         shape: BoxShape.circle,
              //                         border: Border.all(
              //                             width: 2.5, color: Colors.white),
              //                         color: Color(0xff5ec792),
              //                       ),
              //                     ));
              //               } else {
              //                 color = completeColor;
              //               }
              //
              //               if (index <= 2) {
              //                 return Stack(
              //                   children: [
              //                     CustomPaint(
              //                       size: Size(30.0, 30.0),
              //                     ),
              //                     DotIndicator(
              //                       size: 30.0,
              //                       color: color,
              //                       child: child,
              //                     ),
              //                   ],
              //                 );
              //               } else {
              //                 return Stack(
              //                   children: [
              //                     CustomPaint(
              //                       size: Size(15.0, 15.0),
              //                     ),
              //                     OutlinedDotIndicator(
              //                       borderWidth: 4.0,
              //                       color: Colors.pink,
              //                     ),
              //                   ],
              //                 );
              //               }
              //             },
              //             connectorBuilder: (_, index, type) {
              //               if (index > 0) {
              //                 if (index == 2) {
              //                   final prevColor = getColor(index - 1);
              //                   final color = getColor(index);
              //
              //                   return const DecoratedLineConnector(
              //                     decoration:
              //                         BoxDecoration(color: Color(0xff071039)),
              //                   );
              //                 } else {
              //                   return const SolidLineConnector(
              //                     color: Color(0xff071039),
              //                   );
              //                 }
              //               } else {
              //                 return null;
              //               }
              //             },
              //             itemCount: _processes.length,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 30),

              //희망일정
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '희망 시공 일정',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 15),
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
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xFF025595),
                                    size: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('~'),
                          SizedBox(
                            width: 20.0,
                          ),
                          InkWell(
                            onTap: () => _selectDate2(context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xFF025595),
                                    size: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "${selectedDate2.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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

              SizedBox(height: 40),
              //방문시간
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '방문시간',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _time = true;
                                _time2 = !_time;
                                _time3 = !_time;
                                time = '무관';
                              })
                            },
                            child: Text('무관'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time
                                ? RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFF025595), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFFcccccc), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _time2 = true;
                                _time = !_time2;
                                _time3 = !_time2;
                                time = '오전';
                              })
                            },
                            child: Text('오전'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time2
                                ? RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFF025595), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFFcccccc), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _time3 = !_time3;

                                _time3 = true;
                                _time = !_time3;
                                _time2 = !_time3;
                                time = '오후';
                              })
                            },
                            child: Text('오후'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _time3
                                ? RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFF025595), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFFcccccc), width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 40),

              ////////////////////////////////////////////////////////////////////////

              _serviceForm == '1'
                  ?
                  //입주청소
                  Column(children: <Widget>[
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '건물 형태',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: RaisedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _gongan1 = true;
                                        _gongan2 = !_gongan1;
                                        _gongan3 = !_gongan1;
                                        _gongan4 = !_gongan1;
                                        value1 = '건물 형태 |  아파트';
                                        print(value1);
                                      })
                                    },
                                    child: Text('아파트'),
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    shape: _gongan1
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFF025595),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFFcccccc),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    padding:
                                        EdgeInsets.fromLTRB(40, 17, 40, 17),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RaisedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _gongan2 = true;
                                        _gongan1 = !_gongan2;
                                        _gongan3 = !_gongan2;
                                        _gongan4 = !_gongan2;
                                        value1 = '건물 형태 |  오피스텔';
                                        print(value1);
                                      })
                                    },
                                    child: Text('오피스텔'),
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    shape: _gongan2
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFF025595),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFFcccccc),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    padding:
                                        EdgeInsets.fromLTRB(40, 17, 40, 17),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: RaisedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _gongan3 = true;
                                        _gongan1 = !_gongan3;
                                        _gongan2 = !_gongan3;
                                        _gongan4 = !_gongan3;
                                        value1 = '건물 형태 |  빌라';
                                        print(value1);
                                      })
                                    },
                                    child: Text('빌라'),
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    shape: _gongan3
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFF025595),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFFcccccc),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    padding:
                                        EdgeInsets.fromLTRB(40, 17, 40, 17),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RaisedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _gongan4 = true;
                                        _gongan1 = !_gongan4;
                                        _gongan2 = !_gongan4;
                                        _gongan3 = !_gongan4;
                                        value1 = '건물 형태 |  주택';
                                        print(value1);
                                      })
                                    },
                                    child: Text('주택'),
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    shape: _gongan4
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFF025595),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFFcccccc),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    padding:
                                        EdgeInsets.fromLTRB(40, 17, 40, 17),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
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
                                      Text(
                                        '방 개수',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 25.0),
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFFcccccc),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: TextField(
                                          controller: a_Controller!,
                                          onChanged: (text) {
                                            setState(() {
                                              value2 = '방 개수 |  $text 개';
                                            });
                                            print(value2);
                                          },
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixText: '개  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '화장실\n개수',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 25.0),
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFFcccccc),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: TextField(
                                          controller: b_Controller!,
                                          onChanged: (text) {
                                            setState(() {
                                              value3 = '화장실 개수 |  $text 개';
                                            });
                                            print(value3);
                                          },
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixText: '개  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
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
                                      Text(
                                        '베란다\n개수',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 25.0),
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFFcccccc),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: TextField(
                                          controller: c_Controller!,
                                          onChanged: (text) {
                                            setState(() {
                                              value4 = '베란다 |  $text 개';
                                            });
                                            print(value4);
                                          },
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixText: '개  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
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
                    ])
                  : _serviceForm == '2'
                      ?
                      //준공청소  //controller edit
                      Column(children: <Widget>[
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '건물 형태',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _gongan1 = true;
                                            _gongan2 = !_gongan1;
                                            _gongan3 = !_gongan1;
                                            _gongan4 = !_gongan1;
                                            value1 = '건물 형태 |  아파트';
                                            print(value1);
                                          })
                                        },
                                        child: Text('아파트'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _gongan1
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _gongan2 = true;
                                            _gongan1 = !_gongan2;
                                            _gongan3 = !_gongan2;
                                            _gongan4 = !_gongan2;
                                            value1 = '건물 형태 |  오피스텔';
                                            print(value1);
                                          })
                                        },
                                        child: Text('오피스텔'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _gongan2
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _gongan3 = true;
                                            _gongan1 = !_gongan3;
                                            _gongan2 = !_gongan3;
                                            _gongan4 = !_gongan3;
                                            value1 = '건물 형태 |  빌라';
                                            print(value1);
                                          })
                                        },
                                        child: Text('빌라'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _gongan3
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _gongan4 = true;
                                            _gongan1 = !_gongan4;
                                            _gongan2 = !_gongan4;
                                            _gongan3 = !_gongan4;
                                            value1 = '건물 형태 |  주택';
                                            print(value1);
                                          })
                                        },
                                        child: Text('주택'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _gongan4
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '총 층 수',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: Get.width * 0.5,
                                    child: TextField(
                                      controller: a_Controller!,
                                      onChanged: (text) {
                                        setState(() {
                                          value2 = '총 층 수 |  $text 층';
                                        });
                                        print(value2);
                                      },
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF025595)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF025595)),
                                        ),
                                        suffixText: '층  ',
                                        suffixStyle: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                        hintText: '총 층수를 입력 해주세요.',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF777777),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '폐기물 여부',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _yes = true;
                                            _no = !_yes;
                                            value3 = "폐기물 여부 |  있음";
                                          })
                                        },
                                        child: Text('있다'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _yes
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () => {
                                          setState(() {
                                            _yes = !_no;
                                            _no = true;
                                            value3 = "폐기물 여부 |  없음";
                                          })
                                        },
                                        child: Text('없다'),
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        shape: _no
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFF025595),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            : RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xFFcccccc),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                        padding:
                                            EdgeInsets.fromLTRB(40, 17, 40, 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ])
                      : _serviceForm == '3'
                          ?
                          //정기청소  //controller edit
                          Column(children: <Widget>[
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '건물 형태',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _gongan1 = true;
                                                _gongan2 = !_gongan1;
                                                _gongan3 = !_gongan1;
                                                _gongan4 = !_gongan1;
                                                value1 = '건물 형태 |  아파트';
                                                print(value1);
                                              })
                                            },
                                            child: Text('아파트'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _gongan1
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _gongan2 = true;
                                                _gongan1 = !_gongan2;
                                                _gongan3 = !_gongan2;
                                                _gongan4 = !_gongan2;
                                                value1 = '건물 형태 |  오피스텔';
                                                print(value1);
                                              })
                                            },
                                            child: Text('오피스텔'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _gongan2
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _gongan3 = true;
                                                _gongan1 = !_gongan3;
                                                _gongan2 = !_gongan3;
                                                _gongan4 = !_gongan3;
                                                value1 = '건물 형태 |  빌라';
                                                print(value1);
                                              })
                                            },
                                            child: Text('빌라'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _gongan3
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _gongan4 = true;
                                                _gongan1 = !_gongan4;
                                                _gongan2 = !_gongan4;
                                                _gongan3 = !_gongan4;
                                                value1 = '건물 형태 |  주택';
                                                print(value1);
                                              })
                                            },
                                            child: Text('주택'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _gongan4
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '업종',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _Businesstype1 = true;
                                                _Businesstype2 =
                                                    !_Businesstype1;
                                                _Businesstype3 =
                                                    !_Businesstype1;
                                                _Businesstype4 =
                                                    !_Businesstype1;
                                                value2 = '업종 |  사무실';
                                                print(value2);
                                              })
                                            },
                                            child: Text('사무실'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _Businesstype1
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _Businesstype2 = true;
                                                _Businesstype1 =
                                                    !_Businesstype2;
                                                _Businesstype3 =
                                                    !_Businesstype2;
                                                _Businesstype4 =
                                                    !_Businesstype2;
                                                value2 = '업종 |  병원';
                                                print(value2);
                                              })
                                            },
                                            child: Text('병원'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _Businesstype2
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _Businesstype3 = true;
                                                _Businesstype1 =
                                                    !_Businesstype3;
                                                _Businesstype2 =
                                                    !_Businesstype3;
                                                _Businesstype4 =
                                                    !_Businesstype3;
                                                value2 = '업종 |  일반가정';
                                                print(value2);
                                              })
                                            },
                                            child: Text('일반가정'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _Businesstype3
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: () => {
                                              setState(() {
                                                _Businesstype4 =
                                                    !_Businesstype4;

                                                _Businesstype4 = true;
                                                _Businesstype1 =
                                                    !_Businesstype4;
                                                _Businesstype2 =
                                                    !_Businesstype4;
                                                _Businesstype3 =
                                                    !_Businesstype4;
                                                value2 = '업종 |  미용실';
                                                print(value2);
                                              })
                                            },
                                            child: Text('미용실'),
                                            color: Colors.white,
                                            textColor: Colors.black,
                                            shape: _Businesstype4
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF025595),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )
                                                : RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFcccccc),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                            padding: EdgeInsets.fromLTRB(
                                                40, 17, 40, 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '방문 횟수',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: Get.width * 0.5,
                                        child: TextField(
                                          controller: a_Controller!,
                                          onChanged: (text) {
                                            setState(() {
                                              value3 = '방문 횟수 |  $text 회';
                                            });
                                            print(value3);
                                          },
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF025595)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF025595)),
                                            ),
                                            suffixText: '회  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                            hintText: '방문 횟수를 입력 해주세요.',
                                            hintStyle: TextStyle(
                                              color: Color(0xFF777777),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                          : _serviceForm == '4'
                              ?
                              //화재청소 && 쓰레기집 청소  //controller edit
                              Column(children: <Widget>[
                                  Container(
                                    width: Get.width,
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '건물 형태',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _gongan1 = true;
                                                    _gongan2 = !_gongan1;
                                                    _gongan3 = !_gongan1;
                                                    _gongan4 = !_gongan1;
                                                    value1 = '건물 형태 |  아파트';
                                                    print(value1);
                                                  })
                                                },
                                                child: Text('아파트'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _gongan1
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _gongan2 = true;
                                                    _gongan1 = !_gongan2;
                                                    _gongan3 = !_gongan2;
                                                    _gongan4 = !_gongan2;
                                                    value1 = '건물 형태 |  오피스텔';
                                                    print(value1);
                                                  })
                                                },
                                                child: Text('오피스텔'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _gongan2
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _gongan3 = true;
                                                    _gongan1 = !_gongan3;
                                                    _gongan2 = !_gongan3;
                                                    _gongan4 = !_gongan3;
                                                    value1 = '건물 형태 |  빌라';
                                                    print(value1);
                                                  })
                                                },
                                                child: Text('빌라'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _gongan3
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _gongan4 = true;
                                                    _gongan1 = !_gongan4;
                                                    _gongan2 = !_gongan4;
                                                    _gongan3 = !_gongan4;
                                                    value1 = '건물 형태 |  주택';
                                                    print(value1);
                                                  })
                                                },
                                                child: Text('주택'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _gongan4
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '방 개수',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 25.0),
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xFFcccccc),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: TextField(
                                                      controller: a_Controller!,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value2 =
                                                              '방 개수 |  $text 개';
                                                        });
                                                        print(value2);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        suffixText: '개',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '화장실\n개수',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 25.0),
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xFFcccccc),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: TextField(
                                                      controller: b_Controller!,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value3 =
                                                              '화장실 개수 |  $text 개';
                                                        });
                                                        print(value3);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        suffixText: '개',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '베란다\n개수',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 25.0),
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xFFcccccc),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: TextField(
                                                      controller: c_Controller!,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value4 =
                                                              '베란다 개수 |  $text 개';
                                                        });
                                                        print(value4);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        suffixText: '개',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
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
                                  SizedBox(height: 40),
                                  Container(
                                    width: Get.width,
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '폐기물 여부',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _yes = true;
                                                    _no = !_yes;
                                                    value5 = '폐기물 여부 |  있음';
                                                  }),
                                                  print(value5),
                                                },
                                                child: Text('있다'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _yes
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    _no = true;
                                                    _yes = !_no;
                                                    value5 = '폐기물 여부 |  없음';
                                                  }),
                                                  print(value5),
                                                },
                                                child: Text('없다'),
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                shape: _no
                                                    ? RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF025595),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )
                                                    : RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFFcccccc),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 17, 40, 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ])
                              : _serviceForm == '5'
                                  ?
                                  //간판청소
                                  Column(children: <Widget>[
                                      Container(
                                        width: Get.width,
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '건물 형태',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: RaisedButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        _gongan1 = true;
                                                        _gongan2 = !_gongan1;
                                                        _gongan3 = !_gongan1;
                                                        _gongan4 = !_gongan1;
                                                        value1 = '건물 형태 |  아파트';
                                                        print(value1);
                                                      })
                                                    },
                                                    child: Text('아파트'),
                                                    color: Colors.white,
                                                    textColor: Colors.black,
                                                    shape: _gongan1
                                                        ? RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFF025595),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )
                                                        : RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFFcccccc),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            40, 17, 40, 17),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: RaisedButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        _gongan2 = true;
                                                        _gongan1 = !_gongan2;
                                                        _gongan3 = !_gongan2;
                                                        _gongan4 = !_gongan2;
                                                        value1 =
                                                            '건물 형태 |  오피스텔';
                                                        print(value1);
                                                      })
                                                    },
                                                    child: Text('오피스텔'),
                                                    color: Colors.white,
                                                    textColor: Colors.black,
                                                    shape: _gongan2
                                                        ? RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFF025595),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )
                                                        : RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFFcccccc),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            40, 17, 40, 17),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: RaisedButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        _gongan3 = true;
                                                        _gongan1 = !_gongan3;
                                                        _gongan2 = !_gongan3;
                                                        _gongan4 = !_gongan3;
                                                        value1 = '건물 형태 |  빌라';
                                                        print(value1);
                                                      })
                                                    },
                                                    child: Text('빌라'),
                                                    color: Colors.white,
                                                    textColor: Colors.black,
                                                    shape: _gongan3
                                                        ? RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFF025595),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )
                                                        : RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFFcccccc),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            40, 17, 40, 17),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: RaisedButton(
                                                    onPressed: () => {
                                                      setState(() {
                                                        _gongan4 = true;
                                                        _gongan1 = !_gongan4;
                                                        _gongan2 = !_gongan4;
                                                        _gongan3 = !_gongan4;
                                                        value1 = '건물 형태 |  주택';
                                                        print(value1);
                                                      })
                                                    },
                                                    child: Text('주택'),
                                                    color: Colors.white,
                                                    textColor: Colors.black,
                                                    shape: _gongan4
                                                        ? RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFF025595),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )
                                                        : RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFFcccccc),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            40, 17, 40, 17),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '층 수',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 25.0),
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xFFcccccc),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: TextField(
                                                      controller: a_Controller!,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value2 =
                                                              '층 수 |  $text 층';
                                                        });
                                                        print(value2);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        suffixText: '층  ',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '사이즈',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 25.0),
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                              Color(0xFFcccccc),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: TextField(
                                                      controller: b_Controller!,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value3 =
                                                              '사이즈 |  $text ㎡';
                                                        });
                                                        print(value3);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        suffixText: '㎡  ',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ])
                                  : _serviceForm == '6'
                                      ?
                                      //외벽청소  //controller edit
                                      Column(children: <Widget>[
                                          Container(
                                            width: Get.width,
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '건물 형태',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _gongan1 = true;
                                                            _gongan2 =
                                                                !_gongan1;
                                                            _gongan3 =
                                                                !_gongan1;
                                                            _gongan4 =
                                                                !_gongan1;
                                                            value1 =
                                                                '건물 형태 |  아파트';
                                                            print(value1);
                                                          })
                                                        },
                                                        child: Text('아파트'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _gongan1
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _gongan2 = true;
                                                            _gongan1 =
                                                                !_gongan2;
                                                            _gongan3 =
                                                                !_gongan2;
                                                            _gongan4 =
                                                                !_gongan2;
                                                            value1 =
                                                                '건물 형태 |  오피스텔';
                                                            print(value1);
                                                          })
                                                        },
                                                        child: Text('오피스텔'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _gongan2
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _gongan3 = true;
                                                            _gongan1 =
                                                                !_gongan3;
                                                            _gongan2 =
                                                                !_gongan3;
                                                            _gongan4 =
                                                                !_gongan3;
                                                            value1 =
                                                                '건물 형태 |  빌라';
                                                            print(value1);
                                                          })
                                                        },
                                                        child: Text('빌라'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _gongan3
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _gongan4 = true;
                                                            _gongan1 =
                                                                !_gongan4;
                                                            _gongan2 =
                                                                !_gongan4;
                                                            _gongan3 =
                                                                !_gongan4;
                                                            value1 =
                                                                '건물 형태 |  주택';
                                                            print(value1);
                                                          })
                                                        },
                                                        child: Text('주택'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _gongan4
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          Container(
                                            width: Get.width,
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '벽면 형태',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _wall1 = true;
                                                            _wall2 = !_wall1;
                                                            _wall3 = !_wall1;
                                                            _wall4 = !_wall1;
                                                            value2 =
                                                                '벽면 형태 |  유리';
                                                          }),
                                                          print(value2),
                                                        },
                                                        child: Text('유리'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _wall1
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _wall2 = true;
                                                            _wall1 = !_wall2;
                                                            _wall3 = !_wall2;
                                                            _wall4 = !_wall2;
                                                            value2 =
                                                                '벽면 형태 |  합판';
                                                          }),
                                                          print(value2),
                                                        },
                                                        child: Text('합판'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _wall2
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _wall3 = true;
                                                            _wall1 = !_wall3;
                                                            _wall2 = !_wall3;
                                                            _wall4 = !_wall3;
                                                            value2 =
                                                                '벽면 형태 |  타일';
                                                          }),
                                                          print(value2),
                                                        },
                                                        child: Text('타일'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _wall3
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: RaisedButton(
                                                        onPressed: () => {
                                                          setState(() {
                                                            _wall4 = true;
                                                            _wall1 = !_wall4;
                                                            _wall2 = !_wall4;
                                                            _wall3 = !_wall4;
                                                            value2 =
                                                                '벽면 형태 |  벽돌';
                                                          })
                                                        },
                                                        child: Text('벽돌'),
                                                        color: Colors.white,
                                                        textColor: Colors.black,
                                                        shape: _wall4
                                                            ? RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFF025595),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )
                                                            : RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xFFcccccc),
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                40, 17, 40, 17),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '총 층 수',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    width: Get.width * 0.5,
                                                    child: TextField(
                                                      controller: a_Controller,
                                                      onChanged: (text) {
                                                        setState(() {
                                                          value3 =
                                                              '총 층 수 |  $text 층';
                                                        });
                                                        print(value3);
                                                      },
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF025595)),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF025595)),
                                                        ),
                                                        suffixText: '층  ',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 17.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                        hintText:
                                                            '층 수를 입력 해주세요.',
                                                        hintStyle: TextStyle(
                                                          color:
                                                              Color(0xFF777777),
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ])
                                      : _serviceForm == '7'
                                          ?
                                          //학교/관공서청소
                                          Column(children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            '사무실\n개수',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'NanumSquareB',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    right:
                                                                        25.0),
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width:
                                                                          1.0,
                                                                      color: Color(
                                                                          0xFFcccccc),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                            child: TextField(
                                                              controller:
                                                                  a_Controller!,
                                                              onChanged:
                                                                  (text) {
                                                                setState(() {
                                                                  value1 =
                                                                      '사무실 개수 |  $text 개';
                                                                });
                                                                print(value1);
                                                              },
                                                              style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                suffixText:
                                                                    '개  ',
                                                                suffixStyle: TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            '총 층 수',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'NanumSquareB',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    right:
                                                                        25.0),
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width:
                                                                          1.0,
                                                                      color: Color(
                                                                          0xFFcccccc),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                            child: TextField(
                                                              controller:
                                                                  b_Controller!,
                                                              onChanged:
                                                                  (text) {
                                                                setState(() {
                                                                  value2 =
                                                                      '총 층 수 |  $text 층';
                                                                });
                                                                print(value2);
                                                              },
                                                              style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                suffixText:
                                                                    '층  ',
                                                                suffixStyle: TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ])
                                          : _serviceForm == '8'
                                              ?
                                              //상가청소  //controller edit
                                              Column(children: <Widget>[
                                                  Container(
                                                    width: Get.width,
                                                    padding: EdgeInsets.only(
                                                        left: 15, right: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '업종',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'NanumSquareB',
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _Businesstype1 =
                                                                        true;
                                                                    _Businesstype2 =
                                                                        !_Businesstype1;
                                                                    _Businesstype3 =
                                                                        !_Businesstype1;
                                                                    _Businesstype4 =
                                                                        !_Businesstype1;
                                                                    value1 =
                                                                        '업종 |  음식점';
                                                                    print(
                                                                        value1);
                                                                  })
                                                                },
                                                                child:
                                                                    Text('음식점'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _Businesstype1
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _Businesstype2 =
                                                                        true;
                                                                    _Businesstype1 =
                                                                        !_Businesstype2;
                                                                    _Businesstype3 =
                                                                        !_Businesstype2;
                                                                    _Businesstype4 =
                                                                        !_Businesstype2;
                                                                    value1 =
                                                                        '업종 |  꽃집';
                                                                    print(
                                                                        value1);
                                                                  })
                                                                },
                                                                child:
                                                                    Text('꽃집'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _Businesstype2
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _Businesstype3 =
                                                                        true;
                                                                    _Businesstype1 =
                                                                        !_Businesstype3;
                                                                    _Businesstype2 =
                                                                        !_Businesstype3;
                                                                    _Businesstype4 =
                                                                        !_Businesstype3;
                                                                    value1 =
                                                                        '업종 |  카페';
                                                                    print(
                                                                        value1);
                                                                  })
                                                                },
                                                                child:
                                                                    Text('카페'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _Businesstype3
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _Businesstype4 =
                                                                        !_Businesstype4;

                                                                    _Businesstype4 =
                                                                        true;
                                                                    _Businesstype1 =
                                                                        !_Businesstype4;
                                                                    _Businesstype2 =
                                                                        !_Businesstype4;
                                                                    _Businesstype3 =
                                                                        !_Businesstype4;
                                                                    value1 =
                                                                        '업종 |  기타';
                                                                    print(
                                                                        value1);
                                                                  })
                                                                },
                                                                child:
                                                                    Text('기타'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _Businesstype4
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 40),
                                                  Container(
                                                    width: Get.width,
                                                    padding: EdgeInsets.only(
                                                        left: 15, right: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '복층 여부',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'NanumSquareB',
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _yes = true;
                                                                    _no = !_yes;
                                                                    value2 =
                                                                        '복층 여부 |  예';
                                                                  })
                                                                },
                                                                child:
                                                                    Text('있다'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _yes
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () =>
                                                                    {
                                                                  setState(() {
                                                                    _yes = !_no;
                                                                    _no = true;
                                                                    value2 =
                                                                        '복층 여부 |  아니오';
                                                                  })
                                                                },
                                                                child:
                                                                    Text('없다'),
                                                                color: Colors
                                                                    .white,
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                shape: _no
                                                                    ? RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFF025595),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )
                                                                    : RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Color(0xFFcccccc),
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ])
                                              : _serviceForm == '9'
                                                  ?
                                                  //주방후드드청소
                                                  Column(children: <Widget>[
                                                      Container(
                                                        width: Get.width,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '업종',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () => {
                                                                      setState(
                                                                          () {
                                                                        _Businesstype1 =
                                                                            true;
                                                                        _Businesstype2 =
                                                                            !_Businesstype1;
                                                                        _Businesstype3 =
                                                                            !_Businesstype1;
                                                                        _Businesstype4 =
                                                                            !_Businesstype1;
                                                                        value1 =
                                                                            '업종 |  일반 식당';
                                                                        print(
                                                                            value1);
                                                                      })
                                                                    },
                                                                    child: Text(
                                                                        '일반 식당'),
                                                                    color: Colors
                                                                        .white,
                                                                    textColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: _Businesstype1
                                                                        ? RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFF025595), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          )
                                                                        : RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () => {
                                                                      setState(
                                                                          () {
                                                                        _Businesstype2 =
                                                                            true;
                                                                        _Businesstype1 =
                                                                            !_Businesstype2;
                                                                        _Businesstype3 =
                                                                            !_Businesstype2;
                                                                        _Businesstype4 =
                                                                            !_Businesstype2;
                                                                        value1 =
                                                                            '업종 |  치킨집';
                                                                        print(
                                                                            value1);
                                                                      })
                                                                    },
                                                                    child: Text(
                                                                        '치킨집'),
                                                                    color: Colors
                                                                        .white,
                                                                    textColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: _Businesstype2
                                                                        ? RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFF025595), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          )
                                                                        : RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () => {
                                                                      setState(
                                                                          () {
                                                                        _Businesstype3 =
                                                                            true;
                                                                        _Businesstype1 =
                                                                            !_Businesstype3;
                                                                        _Businesstype2 =
                                                                            !_Businesstype3;
                                                                        _Businesstype4 =
                                                                            !_Businesstype3;
                                                                        value1 =
                                                                            '업종 |  일반가정';
                                                                        print(
                                                                            value1);
                                                                      })
                                                                    },
                                                                    child: Text(
                                                                        '일반가정'),
                                                                    color: Colors
                                                                        .white,
                                                                    textColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: _Businesstype3
                                                                        ? RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFF025595), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          )
                                                                        : RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () => {
                                                                      setState(
                                                                          () {
                                                                        _Businesstype4 =
                                                                            !_Businesstype4;

                                                                        _Businesstype4 =
                                                                            true;
                                                                        _Businesstype1 =
                                                                            !_Businesstype4;
                                                                        _Businesstype2 =
                                                                            !_Businesstype4;
                                                                        _Businesstype3 =
                                                                            !_Businesstype4;
                                                                        value1 =
                                                                            '업종 |  기타';
                                                                        print(
                                                                            value1);
                                                                      })
                                                                    },
                                                                    child: Text(
                                                                        '기타'),
                                                                    color: Colors
                                                                        .white,
                                                                    textColor:
                                                                        Colors
                                                                            .black,
                                                                    shape: _Businesstype4
                                                                        ? RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFF025595), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          )
                                                                        : RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            40,
                                                                            17,
                                                                            40,
                                                                            17),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 40),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '사이즈',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'NanumSquareB',
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              flex: 5,
                                                              child: Container(
                                                                width:
                                                                    Get.width *
                                                                        0.5,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      a_Controller,
                                                                  onChanged:
                                                                      (text) {
                                                                    setState(
                                                                        () {
                                                                      value2 =
                                                                          '사이즈 |  $text ㎡';
                                                                    });
                                                                    print(
                                                                        value2);
                                                                  },
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Color(0xFF025595)),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Color(0xFF025595)),
                                                                    ),
                                                                    suffixText:
                                                                        '㎡  ',
                                                                    suffixStyle: TextStyle(
                                                                        fontSize:
                                                                            17.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black54),
                                                                    hintText:
                                                                        '사이즈를 입력 해주세요.',
                                                                    hintStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF777777),
                                                                      fontSize:
                                                                          13,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ])
                                                  : _serviceForm == '10'
                                                      ? Container()
                                                      : _serviceForm == '11'
                                                          ?
                                                          //올인테리어
                                                          Column(
                                                              children: <
                                                                  Widget>[
                                                                  Container(
                                                                    width: Get
                                                                        .width,
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '건물 형태',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontFamily:
                                                                                'NanumSquareB',
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: RaisedButton(
                                                                                onPressed: () => {
                                                                                  setState(() {
                                                                                    _gongan1 = true;
                                                                                    _gongan2 = !_gongan1;
                                                                                    _gongan3 = !_gongan1;
                                                                                    _gongan4 = !_gongan1;
                                                                                    value1 = '건물 형태 |  아파트';
                                                                                    print(value1);
                                                                                  })
                                                                                },
                                                                                child: Text('아파트'),
                                                                                color: Colors.white,
                                                                                textColor: Colors.black,
                                                                                shape: _gongan1
                                                                                    ? RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      )
                                                                                    : RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      ),
                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                              ),
                                                                            ),
                                                                            SizedBox(width: 10),
                                                                            Expanded(
                                                                              child: RaisedButton(
                                                                                onPressed: () => {
                                                                                  setState(() {
                                                                                    _gongan2 = true;
                                                                                    _gongan1 = !_gongan2;
                                                                                    _gongan3 = !_gongan2;
                                                                                    _gongan4 = !_gongan2;
                                                                                    value1 = '건물 형태 |  오피스텔';
                                                                                    print(value1);
                                                                                  })
                                                                                },
                                                                                child: Text('오피스텔'),
                                                                                color: Colors.white,
                                                                                textColor: Colors.black,
                                                                                shape: _gongan2
                                                                                    ? RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      )
                                                                                    : RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      ),
                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: RaisedButton(
                                                                                onPressed: () => {
                                                                                  setState(() {
                                                                                    _gongan3 = true;
                                                                                    _gongan1 = !_gongan3;
                                                                                    _gongan2 = !_gongan3;
                                                                                    _gongan4 = !_gongan3;
                                                                                    value1 = '건물 형태 |  빌라';
                                                                                    print(value1);
                                                                                  })
                                                                                },
                                                                                child: Text('빌라'),
                                                                                color: Colors.white,
                                                                                textColor: Colors.black,
                                                                                shape: _gongan3
                                                                                    ? RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      )
                                                                                    : RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      ),
                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                              ),
                                                                            ),
                                                                            SizedBox(width: 10),
                                                                            Expanded(
                                                                              child: RaisedButton(
                                                                                onPressed: () => {
                                                                                  setState(() {
                                                                                    _gongan4 = true;
                                                                                    _gongan1 = !_gongan4;
                                                                                    _gongan2 = !_gongan4;
                                                                                    _gongan3 = !_gongan4;
                                                                                    value1 = '건물 형태 |  주택';
                                                                                    print(value1);
                                                                                  })
                                                                                },
                                                                                child: Text('주택'),
                                                                                color: Colors.white,
                                                                                textColor: Colors.black,
                                                                                shape: _gongan4
                                                                                    ? RoundedRectangleBorder(
                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                      )
                                                                                    : RoundedRectangleBorder(
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
                                                                  SizedBox(
                                                                      height:
                                                                          40),
                                                                  Container(
                                                                    padding: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '  준공  \n  년도  ',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: a_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value2 = '준공 년도 |  $text 년';
                                                                                        });
                                                                                        print(value2);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '방 개수',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: b_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value3 = '방 개수 |  $text 개';
                                                                                        });
                                                                                        print(value3);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '화장실\n개수',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: c_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value4 = '화장실 개수 |  $text 개';
                                                                                        });
                                                                                        print(value4);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '베란다\n개수',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: d_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value5 = '베란다 개수 |  $text 개';
                                                                                        });
                                                                                        print(value5);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ])
                                                          : _serviceForm == '12'
                                                              ?
                                                              //필름인테리어
                                                              Column(
                                                                  children: <
                                                                      Widget>[
                                                                      Container(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            right:
                                                                                15),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '방 개수',
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: a_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value1 = '방 개수 |  $text 개';
                                                                                        });
                                                                                        print(value1);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                  child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    '화장실\n개수',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          width: 1.0,
                                                                                          color: Color(0xFFcccccc),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                    child: TextField(
                                                                                      controller: b_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value2 = '화장실 개수 |  $text 개';
                                                                                        });
                                                                                        print(value2);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ])
                                                              : _serviceForm ==
                                                                      '13'
                                                                  ?
                                                                  //탄성코트
                                                                  Column(
                                                                      children: <
                                                                          Widget>[
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 15, right: 15),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Text(
                                                                                    '베란다 수',
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 20),
                                                                                Expanded(
                                                                                  flex: 5,
                                                                                  child: Container(
                                                                                    width: Get.width * 0.5,
                                                                                    child: TextField(
                                                                                      controller: a_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value1 = '베란다 개수 |  $text 개';
                                                                                        });
                                                                                        print(value1);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                        hintText: '베란다 수를 입력 해주세요.',
                                                                                        hintStyle: TextStyle(
                                                                                          color: Color(0xFF777777),
                                                                                          fontSize: 13,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ])
                                                                  : _serviceForm ==
                                                                          '15'
                                                                      ?
                                                                      //도배/장판
                                                                      Column(children: <
                                                                          Widget>[
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 15, right: 15),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Text(
                                                                                    '방 개수',
                                                                                    style: TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontFamily: 'NanumSquareB',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: 20),
                                                                                Expanded(
                                                                                  flex: 5,
                                                                                  child: Container(
                                                                                    width: Get.width * 0.5,
                                                                                    child: TextField(
                                                                                      controller: a_Controller,
                                                                                      onChanged: (text) {
                                                                                        setState(() {
                                                                                          value1 = '방 개수 |  $text 개';
                                                                                        });
                                                                                        print(value1);
                                                                                      },
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
                                                                                        suffixStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                        hintText: '방 개수를 입력 해주세요.',
                                                                                        hintStyle: TextStyle(
                                                                                          color: Color(0xFF777777),
                                                                                          fontSize: 13,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ])
                                                                      : _serviceForm ==
                                                                              '17'
                                                                          ?
                                                                          //방충망 교체
                                                                          Column(children: <
                                                                              Widget>[
                                                                              Container(
                                                                                padding: EdgeInsets.only(left: 15, right: 15),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(
                                                                                        '방충망\n개수',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(
                                                                                          fontSize: 14,
                                                                                          fontFamily: 'NanumSquareB',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 20),
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: Container(
                                                                                        width: Get.width * 0.5,
                                                                                        child: TextField(
                                                                                          controller: a_Controller,
                                                                                          onChanged: (text) {
                                                                                            setState(() {
                                                                                              value1 = '방충망 개수 |  $text 개';
                                                                                            });
                                                                                            print(value1);
                                                                                          },
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
                                                                                            suffixStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                            hintText: '방충망 개수를 입력 해주세요.',
                                                                                            hintStyle: TextStyle(
                                                                                              color: Color(0xFF777777),
                                                                                              fontSize: 13,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ])
                                                                          : _serviceForm == '18'
                                                                              ?
                                                                              //욕실인테리어/실리콘 오염 방지/욕실 나노 코팅
                                                                              Column(children: <Widget>[
                                                                                  Container(
                                                                                    padding: EdgeInsets.only(left: 15, right: 15),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Text(
                                                                                            '화장실\n개수',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(
                                                                                              fontSize: 14,
                                                                                              fontFamily: 'NanumSquareB',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(width: 20),
                                                                                        Expanded(
                                                                                          flex: 5,
                                                                                          child: Container(
                                                                                            width: Get.width * 0.5,
                                                                                            child: TextField(
                                                                                              controller: a_Controller,
                                                                                              onChanged: (text) {
                                                                                                setState(() {
                                                                                                  value1 = '화장실 개수 |  $text 개';
                                                                                                });
                                                                                                print(value1);
                                                                                              },
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
                                                                                                suffixStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                hintText: '화장실 개수를 입력 해주세요.',
                                                                                                hintStyle: TextStyle(
                                                                                                  color: Color(0xFF777777),
                                                                                                  fontSize: 13,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ])
                                                                              : _serviceForm == '19'
                                                                                  ?
                                                                                  //커튼/바닥매트
                                                                                  Column(children: <Widget>[
                                                                                      Container(
                                                                                        width: Get.width,
                                                                                        padding: EdgeInsets.only(left: 15, right: 15),
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              '건물 형태',
                                                                                              style: TextStyle(
                                                                                                fontSize: 14,
                                                                                                fontFamily: 'NanumSquareB',
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(height: 15),
                                                                                            Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: RaisedButton(
                                                                                                    onPressed: () => {
                                                                                                      setState(() {
                                                                                                        _gongan1 = true;
                                                                                                        _gongan2 = !_gongan1;
                                                                                                        _gongan3 = !_gongan1;
                                                                                                        _gongan4 = !_gongan1;
                                                                                                        value1 = '건물 형태 |  아파트';
                                                                                                        print(value1);
                                                                                                      })
                                                                                                    },
                                                                                                    child: Text('아파트'),
                                                                                                    color: Colors.white,
                                                                                                    textColor: Colors.black,
                                                                                                    shape: _gongan1
                                                                                                        ? RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          )
                                                                                                        : RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          ),
                                                                                                    padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(width: 10),
                                                                                                Expanded(
                                                                                                  child: RaisedButton(
                                                                                                    onPressed: () => {
                                                                                                      setState(() {
                                                                                                        _gongan2 = true;
                                                                                                        _gongan1 = !_gongan2;
                                                                                                        _gongan3 = !_gongan2;
                                                                                                        _gongan4 = !_gongan2;
                                                                                                        value1 = '건물 형태 |  오피스텔';
                                                                                                        print(value1);
                                                                                                      })
                                                                                                    },
                                                                                                    child: Text('오피스텔'),
                                                                                                    color: Colors.white,
                                                                                                    textColor: Colors.black,
                                                                                                    shape: _gongan2
                                                                                                        ? RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          )
                                                                                                        : RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          ),
                                                                                                    padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(height: 10),
                                                                                            Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: RaisedButton(
                                                                                                    onPressed: () => {
                                                                                                      setState(() {
                                                                                                        _gongan3 = true;
                                                                                                        _gongan1 = !_gongan3;
                                                                                                        _gongan2 = !_gongan3;
                                                                                                        _gongan4 = !_gongan3;
                                                                                                        value1 = '건물 형태 |  빌라';
                                                                                                        print(value1);
                                                                                                      })
                                                                                                    },
                                                                                                    child: Text('빌라'),
                                                                                                    color: Colors.white,
                                                                                                    textColor: Colors.black,
                                                                                                    shape: _gongan3
                                                                                                        ? RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          )
                                                                                                        : RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          ),
                                                                                                    padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(width: 10),
                                                                                                Expanded(
                                                                                                  child: RaisedButton(
                                                                                                    onPressed: () => {
                                                                                                      setState(() {
                                                                                                        _gongan4 = true;
                                                                                                        _gongan1 = !_gongan4;
                                                                                                        _gongan2 = !_gongan4;
                                                                                                        _gongan3 = !_gongan4;
                                                                                                        value1 = '건물 형태 |  주택';
                                                                                                        print(value1);
                                                                                                      })
                                                                                                    },
                                                                                                    child: Text('주택'),
                                                                                                    color: Colors.white,
                                                                                                    textColor: Colors.black,
                                                                                                    shape: _gongan4
                                                                                                        ? RoundedRectangleBorder(
                                                                                                            side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          )
                                                                                                        : RoundedRectangleBorder(
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
                                                                                      SizedBox(height: 40),
                                                                                      Container(
                                                                                        padding: EdgeInsets.only(left: 15, right: 15),
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Container(
                                                                                                  child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: <Widget>[
                                                                                                  Text(
                                                                                                    '방 개수',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 14,
                                                                                                      fontFamily: 'NanumSquareB',
                                                                                                    ),
                                                                                                    textAlign: TextAlign.center,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 15.0,
                                                                                                  ),
                                                                                                  Container(
                                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                        border: Border.all(
                                                                                                          width: 1.0,
                                                                                                          color: Color(0xFFcccccc),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                                    child: TextField(
                                                                                                      controller: a_Controller!,
                                                                                                      onChanged: (text) {
                                                                                                        setState(() {
                                                                                                          value2 = '방 개수 |  $text 개';
                                                                                                        });
                                                                                                        print(value2);
                                                                                                      },
                                                                                                      style: TextStyle(
                                                                                                        fontSize: 17,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                      ),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      decoration: InputDecoration(
                                                                                                        border: InputBorder.none,
                                                                                                        suffixText: '개  ',
                                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Container(
                                                                                                  child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: <Widget>[
                                                                                                  Text(
                                                                                                    '베란다\n개수',
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 14,
                                                                                                      fontFamily: 'NanumSquareB',
                                                                                                    ),
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 15.0,
                                                                                                  ),
                                                                                                  Container(
                                                                                                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                        border: Border.all(
                                                                                                          width: 1.0,
                                                                                                          color: Color(0xFFcccccc),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(10.0)),
                                                                                                    child: TextField(
                                                                                                      controller: b_Controller!,
                                                                                                      onChanged: (text) {
                                                                                                        setState(() {
                                                                                                          value3 = '베란다 개수 |  $text 개';
                                                                                                        });
                                                                                                        print(value3);
                                                                                                      },
                                                                                                      style: TextStyle(
                                                                                                        fontSize: 17,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                      ),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      decoration: InputDecoration(
                                                                                                        border: InputBorder.none,
                                                                                                        suffixText: '개  ',
                                                                                                        suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ])
                                                                                  : _serviceForm == '20'
                                                                                      ?
                                                                                      //줄눈
                                                                                      Column(children: <Widget>[
                                                                                          Container(
                                                                                            padding: EdgeInsets.only(left: 15, right: 15),
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Container(
                                                                                                      child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: <Widget>[
                                                                                                      Text(
                                                                                                        '화장실\n개수',
                                                                                                        style: TextStyle(
                                                                                                          fontSize: 14,
                                                                                                          fontFamily: 'NanumSquareB',
                                                                                                        ),
                                                                                                        textAlign: TextAlign.center,
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 15.0,
                                                                                                      ),
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                        width: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                            border: Border.all(
                                                                                                              width: 1.0,
                                                                                                              color: Color(0xFFcccccc),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(10.0)),
                                                                                                        child: TextField(
                                                                                                          controller: a_Controller!,
                                                                                                          onChanged: (text) {
                                                                                                            setState(() {
                                                                                                              value1 = '화장실 개수 |  $text 개';
                                                                                                            });
                                                                                                            print(value1);
                                                                                                          },
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 17,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                          ),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          keyboardType: TextInputType.number,
                                                                                                          decoration: InputDecoration(
                                                                                                            border: InputBorder.none,
                                                                                                            suffixText: '개  ',
                                                                                                            suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Container(
                                                                                                      child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: <Widget>[
                                                                                                      Text(
                                                                                                        '베란다\n개수',
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: TextStyle(
                                                                                                          fontSize: 14,
                                                                                                          fontFamily: 'NanumSquareB',
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 15.0,
                                                                                                      ),
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                        width: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                            border: Border.all(
                                                                                                              width: 1.0,
                                                                                                              color: Color(0xFFcccccc),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(10.0)),
                                                                                                        child: TextField(
                                                                                                          controller: b_Controller!,
                                                                                                          onChanged: (text) {
                                                                                                            setState(() {
                                                                                                              value2 = '베란다 개수 |  $text 개';
                                                                                                            });
                                                                                                            print(value2);
                                                                                                          },
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 17,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                          ),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          keyboardType: TextInputType.number,
                                                                                                          decoration: InputDecoration(
                                                                                                            border: InputBorder.none,
                                                                                                            suffixText: '개  ',
                                                                                                            suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ])
                                                                                      : _serviceForm == '21'
                                                                                          ?
                                                                                          //상판연마코팅/엔지니어스톤 코팅  //controller edit
                                                                                          Column(children: <Widget>[
                                                                                              Container(
                                                                                                width: Get.width,
                                                                                                padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                child: Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '싱크대 형태',
                                                                                                      style: TextStyle(
                                                                                                        fontSize: 14,
                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(height: 15),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RaisedButton(
                                                                                                            onPressed: () => {
                                                                                                              setState(() {
                                                                                                                _wall1 = true;
                                                                                                                _wall2 = !_wall1;
                                                                                                                _wall3 = !_wall1;
                                                                                                                _wall4 = !_wall1;
                                                                                                                value1 = '싱크대 형태 |  ㅡ자';
                                                                                                              }),
                                                                                                              print(value1),
                                                                                                            },
                                                                                                            child: Text('ㅡ자'),
                                                                                                            color: Colors.white,
                                                                                                            textColor: Colors.black,
                                                                                                            shape: _wall1
                                                                                                                ? RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  )
                                                                                                                : RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  ),
                                                                                                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                          ),
                                                                                                        ),
                                                                                                        SizedBox(width: 10),
                                                                                                        Expanded(
                                                                                                          child: RaisedButton(
                                                                                                            onPressed: () => {
                                                                                                              setState(() {
                                                                                                                _wall2 = true;
                                                                                                                _wall1 = !_wall2;
                                                                                                                _wall3 = !_wall2;
                                                                                                                _wall4 = !_wall2;
                                                                                                                value1 = '싱크대 형태 |  ㄱ자';
                                                                                                              }),
                                                                                                              print(value1),
                                                                                                            },
                                                                                                            child: Text('ㄱ자'),
                                                                                                            color: Colors.white,
                                                                                                            textColor: Colors.black,
                                                                                                            shape: _wall2
                                                                                                                ? RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  )
                                                                                                                : RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  ),
                                                                                                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 10),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RaisedButton(
                                                                                                            onPressed: () => {
                                                                                                              setState(() {
                                                                                                                _wall3 = true;
                                                                                                                _wall1 = !_wall3;
                                                                                                                _wall2 = !_wall3;
                                                                                                                _wall4 = !_wall3;
                                                                                                                value1 = '싱크대 형태 |  ㄷ자';
                                                                                                              }),
                                                                                                              print(value1),
                                                                                                            },
                                                                                                            child: Text('ㄷ자'),
                                                                                                            color: Colors.white,
                                                                                                            textColor: Colors.black,
                                                                                                            shape: _wall3
                                                                                                                ? RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  )
                                                                                                                : RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  ),
                                                                                                            padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                          ),
                                                                                                        ),
                                                                                                        SizedBox(width: 10),
                                                                                                        Expanded(
                                                                                                          child: RaisedButton(
                                                                                                            onPressed: () => {
                                                                                                              setState(() {
                                                                                                                _wall4 = true;
                                                                                                                _wall1 = !_wall4;
                                                                                                                _wall2 = !_wall4;
                                                                                                                _wall3 = !_wall4;
                                                                                                                value1 = '싱크대 형태 |  ㄹ자';
                                                                                                              }),
                                                                                                              print(value1),
                                                                                                            },
                                                                                                            child: Text('ㄹ자'),
                                                                                                            color: Colors.white,
                                                                                                            textColor: Colors.black,
                                                                                                            shape: _wall4
                                                                                                                ? RoundedRectangleBorder(
                                                                                                                    side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                  )
                                                                                                                : RoundedRectangleBorder(
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
                                                                                            ])
                                                                                          : _serviceForm == '22'
                                                                                              ?
                                                                                              //바닥왁싱  //controller edit  //list edit
                                                                                              Column(children: <Widget>[
                                                                                                  Container(
                                                                                                    width: Get.width,
                                                                                                    padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: Column(
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          '바닥 형태',
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 14,
                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                          ),
                                                                                                        ),
                                                                                                        SizedBox(height: 15),
                                                                                                        Row(
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: RaisedButton(
                                                                                                                onPressed: () => {
                                                                                                                  setState(() {
                                                                                                                    _wall1 = true;
                                                                                                                    _wall2 = !_wall1;
                                                                                                                    _wall3 = !_wall1;
                                                                                                                    _wall4 = !_wall1;
                                                                                                                    value1 = '바닥 형태 |  유리';
                                                                                                                  }),
                                                                                                                  print(value1),
                                                                                                                },
                                                                                                                child: Text('유리'),
                                                                                                                color: Colors.white,
                                                                                                                textColor: Colors.black,
                                                                                                                shape: _wall1
                                                                                                                    ? RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      )
                                                                                                                    : RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      ),
                                                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(width: 10),
                                                                                                            Expanded(
                                                                                                              child: RaisedButton(
                                                                                                                onPressed: () => {
                                                                                                                  setState(() {
                                                                                                                    _wall2 = true;
                                                                                                                    _wall1 = !_wall2;
                                                                                                                    _wall3 = !_wall2;
                                                                                                                    _wall4 = !_wall2;
                                                                                                                    value1 = '바닥 형태 |  장판';
                                                                                                                  }),
                                                                                                                  print(value1),
                                                                                                                },
                                                                                                                child: Text('장판'),
                                                                                                                color: Colors.white,
                                                                                                                textColor: Colors.black,
                                                                                                                shape: _wall2
                                                                                                                    ? RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      )
                                                                                                                    : RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      ),
                                                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        SizedBox(height: 10),
                                                                                                        Row(
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: RaisedButton(
                                                                                                                onPressed: () => {
                                                                                                                  setState(() {
                                                                                                                    _wall3 = true;
                                                                                                                    _wall1 = !_wall3;
                                                                                                                    _wall2 = !_wall3;
                                                                                                                    _wall4 = !_wall3;
                                                                                                                    value1 = '바닥 형태 |  타일';
                                                                                                                  }),
                                                                                                                  print(value1),
                                                                                                                },
                                                                                                                child: Text('타일'),
                                                                                                                color: Colors.white,
                                                                                                                textColor: Colors.black,
                                                                                                                shape: _wall3
                                                                                                                    ? RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      )
                                                                                                                    : RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      ),
                                                                                                                padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(width: 10),
                                                                                                            Expanded(
                                                                                                              child: RaisedButton(
                                                                                                                onPressed: () => {
                                                                                                                  setState(() {
                                                                                                                    _wall4 = true;
                                                                                                                    _wall1 = !_wall4;
                                                                                                                    _wall2 = !_wall4;
                                                                                                                    _wall3 = !_wall4;
                                                                                                                    value1 = '바닥 형태 |  벽돌';
                                                                                                                  }),
                                                                                                                  print(value1),
                                                                                                                },
                                                                                                                child: Text('벽돌'),
                                                                                                                color: Colors.white,
                                                                                                                textColor: Colors.black,
                                                                                                                shape: _wall4
                                                                                                                    ? RoundedRectangleBorder(
                                                                                                                        side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                                                      )
                                                                                                                    : RoundedRectangleBorder(
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
                                                                                                ])
                                                                                              : _serviceForm == '23'
                                                                                                  ?
                                                                                                  //단열차단필름/정리정돈/새집 증후군
                                                                                                  Column(children: <Widget>[
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              flex: 1,
                                                                                                              child: Text(
                                                                                                                '방 개수',
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: TextStyle(
                                                                                                                  fontSize: 14,
                                                                                                                  fontFamily: 'NanumSquareB',
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(width: 20),
                                                                                                            Expanded(
                                                                                                              flex: 5,
                                                                                                              child: Container(
                                                                                                                width: Get.width * 0.5,
                                                                                                                child: TextField(
                                                                                                                  controller: a_Controller,
                                                                                                                  onChanged: (text) {
                                                                                                                    setState(() {
                                                                                                                      value1 = '방 개수 |  $text 개';
                                                                                                                    });
                                                                                                                    print(value1);
                                                                                                                  },
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
                                                                                                                    suffixStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                    hintText: '방 개수를 입력 해주세요.',
                                                                                                                    hintStyle: TextStyle(
                                                                                                                      color: Color(0xFF777777),
                                                                                                                      fontSize: 13,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ])
                                                                                                  : _serviceForm == '24'
                                                                                                      ?
                                                                                                      //조명 설치
                                                                                                      Column(children: <Widget>[
                                                                                                          Container(
                                                                                                            width: Get.width,
                                                                                                            padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                            child: Column(
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '신규 / 교체 여부',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 14,
                                                                                                                    fontFamily: 'NanumSquareB',
                                                                                                                  ),
                                                                                                                ),
                                                                                                                SizedBox(height: 15),
                                                                                                                Row(
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: RaisedButton(
                                                                                                                        onPressed: () => {
                                                                                                                          setState(() {
                                                                                                                            _wall1 = true;
                                                                                                                            _wall2 = !_wall1;
                                                                                                                            value1 = '신규 / 교체 여부 |  신규';
                                                                                                                          }),
                                                                                                                          print(value1),
                                                                                                                        },
                                                                                                                        child: Text('신규'),
                                                                                                                        color: Colors.white,
                                                                                                                        textColor: Colors.black,
                                                                                                                        shape: _wall1
                                                                                                                            ? RoundedRectangleBorder(
                                                                                                                                side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                                                              )
                                                                                                                            : RoundedRectangleBorder(
                                                                                                                                side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                                                              ),
                                                                                                                        padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    SizedBox(width: 10),
                                                                                                                    Expanded(
                                                                                                                      child: RaisedButton(
                                                                                                                        onPressed: () => {
                                                                                                                          setState(() {
                                                                                                                            _wall2 = true;
                                                                                                                            _wall1 = !_wall2;
                                                                                                                            value1 = '신규 / 교체 여부 |  교체';
                                                                                                                          }),
                                                                                                                          print(value1),
                                                                                                                        },
                                                                                                                        child: Text('교체'),
                                                                                                                        color: Colors.white,
                                                                                                                        textColor: Colors.black,
                                                                                                                        shape: _wall2
                                                                                                                            ? RoundedRectangleBorder(
                                                                                                                                side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                                                              )
                                                                                                                            : RoundedRectangleBorder(
                                                                                                                                side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                                                              ),
                                                                                                                        padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                SizedBox(height: 10),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ])
                                                                                                      : _serviceForm == '25'
                                                                                                          ?
                                                                                                          //에어컨 이전 설치
                                                                                                          Column(
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
                                                                                                                          Text(
                                                                                                                            '기기 수량',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: TextStyle(
                                                                                                                              fontSize: 14,
                                                                                                                              fontFamily: 'NanumSquareB',
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          SizedBox(
                                                                                                                            width: 15.0,
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                            width: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                                border: Border.all(
                                                                                                                                  width: 1.0,
                                                                                                                                  color: Color(0xFFcccccc),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(10.0)),
                                                                                                                            child: TextField(
                                                                                                                              controller: a_Controller,
                                                                                                                              onChanged: (text) {
                                                                                                                                setState(() {
                                                                                                                                  value1 = '기기 수량 |  $text 개';
                                                                                                                                });
                                                                                                                                print(value1);
                                                                                                                              },
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
                                                                                                                                suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Container(
                                                                                                                          child: Row(
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: <Widget>[
                                                                                                                          Text(
                                                                                                                            '  층 수  ',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: TextStyle(
                                                                                                                              fontSize: 14,
                                                                                                                              fontFamily: 'NanumSquareB',
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          SizedBox(
                                                                                                                            width: 15.0,
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                            width: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                                border: Border.all(
                                                                                                                                  width: 1.0,
                                                                                                                                  color: Color(0xFFcccccc),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(10.0)),
                                                                                                                            child: TextField(
                                                                                                                              controller: b_Controller,
                                                                                                                              onChanged: (text) {
                                                                                                                                setState(() {
                                                                                                                                  value2 = '층 수 |  $text 층';
                                                                                                                                });
                                                                                                                                print(value2);
                                                                                                                              },
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: 17,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                fontFamily: 'NanumSquareB',
                                                                                                                              ),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              keyboardType: TextInputType.number,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                border: InputBorder.none,
                                                                                                                                suffixText: '층',
                                                                                                                                suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                SizedBox(height: 10.0),
                                                                                                                Container(
                                                                                                                    width: Get.width,
                                                                                                                    child: Row(
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: <Widget>[
                                                                                                                        SizedBox(
                                                                                                                          width: 15.0,
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          flex: 1,
                                                                                                                          child: Text(
                                                                                                                            '이전\n주소지',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: TextStyle(
                                                                                                                              fontSize: 14,
                                                                                                                              fontFamily: 'NanumSquareB',
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          width: 10.0,
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          flex: 5,
                                                                                                                          child: Container(
                                                                                                                            padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                            width: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                                border: Border.all(
                                                                                                                                  width: 1.0,
                                                                                                                                  color: Color(0xFFcccccc),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(10.0)),
                                                                                                                            child: TextField(
                                                                                                                              controller: c_Controller,
                                                                                                                              onChanged: (text) {
                                                                                                                                setState(() {
                                                                                                                                  value3 = '이전 주소지 |  $text';
                                                                                                                                });
                                                                                                                                print(value3);
                                                                                                                              },
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: 17,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                fontFamily: 'NanumSquareB',
                                                                                                                              ),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              keyboardType: TextInputType.number,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                border: InputBorder.none,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          width: 15.0,
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    )),
                                                                                                                SizedBox(height: 10.0),
                                                                                                                Container(
                                                                                                                    width: Get.width,
                                                                                                                    child: Row(
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: <Widget>[
                                                                                                                        SizedBox(
                                                                                                                          width: 15.0,
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          flex: 1,
                                                                                                                          child: Text(
                                                                                                                            '신규\n주소지',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: TextStyle(
                                                                                                                              fontSize: 14,
                                                                                                                              fontFamily: 'NanumSquareB',
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          width: 10.0,
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          flex: 5,
                                                                                                                          child: Container(
                                                                                                                            padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                            width: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                                border: Border.all(
                                                                                                                                  width: 1.0,
                                                                                                                                  color: Color(0xFFcccccc),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(10.0)),
                                                                                                                            child: TextField(
                                                                                                                              controller: d_Controller,
                                                                                                                              onChanged: (text) {
                                                                                                                                setState(() {
                                                                                                                                  value4 = '신규 주소지 |  $text';
                                                                                                                                });
                                                                                                                                print(value4);
                                                                                                                              },
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: 17,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                fontFamily: 'NanumSquareB',
                                                                                                                              ),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              keyboardType: TextInputType.number,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                border: InputBorder.none,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          width: 15.0,
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    )),
                                                                                                              ],
                                                                                                            )
                                                                                                          : _serviceForm == '26'
                                                                                                              ?
                                                                                                              //에어컨 분해 청소 / 세탁기 분해 청소 / 냉장고 청소
                                                                                                              Column(
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      padding: EdgeInsets.only(left: 5, right: 5),
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
                                                                                                                                    Text(
                                                                                                                                      '기기 수량',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14,
                                                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      width: 15.0,
                                                                                                                                    ),
                                                                                                                                    Container(
                                                                                                                                      padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                      width: 100.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                          border: Border.all(
                                                                                                                                            width: 1.0,
                                                                                                                                            color: Color(0xFFcccccc),
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                      child: TextField(
                                                                                                                                        controller: a_Controller!,
                                                                                                                                        onChanged: (text) {
                                                                                                                                          setState(() {
                                                                                                                                            value1 = '기기 수량 |  $text 개';
                                                                                                                                          });
                                                                                                                                          print(value1);
                                                                                                                                        },
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
                                                                                                                                          suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                )),
                                                                                                                              ),
                                                                                                                              Expanded(
                                                                                                                                flex: 1,
                                                                                                                                child: Container(
                                                                                                                                    child: Row(
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                  children: <Widget>[
                                                                                                                                    Text(
                                                                                                                                      '기기 형태',
                                                                                                                                      textAlign: TextAlign.center,
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14,
                                                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      width: 15.0,
                                                                                                                                    ),
                                                                                                                                    Container(
                                                                                                                                      padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                      width: 100.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                          border: Border.all(
                                                                                                                                            width: 1.0,
                                                                                                                                            color: Color(0xFFcccccc),
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                      child: TextField(
                                                                                                                                        controller: b_Controller!,
                                                                                                                                        onChanged: (text) {
                                                                                                                                          setState(() {
                                                                                                                                            value2 = '기기 형태 |  $text';
                                                                                                                                          });
                                                                                                                                          print(value2);
                                                                                                                                        },
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: 17,
                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                          fontFamily: 'NanumSquareB',
                                                                                                                                        ),
                                                                                                                                        textAlign: TextAlign.center,
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          border: InputBorder.none,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                )),
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
                                                                                                                                    Text(
                                                                                                                                      '  사이즈  ',
                                                                                                                                      textAlign: TextAlign.center,
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14,
                                                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      width: 15.0,
                                                                                                                                    ),
                                                                                                                                    Container(
                                                                                                                                      padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                      width: 100.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                          border: Border.all(
                                                                                                                                            width: 1.0,
                                                                                                                                            color: Color(0xFFcccccc),
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                      child: TextField(
                                                                                                                                        controller: c_Controller!,
                                                                                                                                        onChanged: (text) {
                                                                                                                                          setState(() {
                                                                                                                                            value3 = '사이즈 |  $text';
                                                                                                                                          });
                                                                                                                                          print(value3);
                                                                                                                                        },
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: 17,
                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                          fontFamily: 'NanumSquareB',
                                                                                                                                        ),
                                                                                                                                        textAlign: TextAlign.center,
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          border: InputBorder.none,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                )),
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
                                                                                                                  ],
                                                                                                                )
                                                                                                              : _serviceForm == '29'
                                                                                                                  ?
                                                                                                                  //맞춤 가구 제작
                                                                                                                  Column(
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          width: Get.width,
                                                                                                                          padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                          child: Column(
                                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                '의뢰 가구',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 14,
                                                                                                                                  fontFamily: 'NanumSquareB',
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              SizedBox(height: 15),
                                                                                                                              Row(
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: RaisedButton(
                                                                                                                                      onPressed: () => {
                                                                                                                                        setState(() {
                                                                                                                                          _wall1 = true;
                                                                                                                                          _wall2 = !_wall1;
                                                                                                                                          _wall3 = !_wall1;
                                                                                                                                          _wall4 = !_wall1;
                                                                                                                                          value1 = '의뢰 가구 |  쇼파';
                                                                                                                                        }),
                                                                                                                                        print(value1),
                                                                                                                                      },
                                                                                                                                      child: Text('쇼파'),
                                                                                                                                      color: Colors.white,
                                                                                                                                      textColor: Colors.black,
                                                                                                                                      shape: _wall1
                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            )
                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            ),
                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  SizedBox(width: 10),
                                                                                                                                  Expanded(
                                                                                                                                    child: RaisedButton(
                                                                                                                                      onPressed: () => {
                                                                                                                                        setState(() {
                                                                                                                                          _wall2 = true;
                                                                                                                                          _wall1 = !_wall2;
                                                                                                                                          _wall3 = !_wall2;
                                                                                                                                          _wall4 = !_wall2;
                                                                                                                                          value1 = '의뢰 가구 |  거실장';
                                                                                                                                        }),
                                                                                                                                        print(value1),
                                                                                                                                      },
                                                                                                                                      child: Text('거실장'),
                                                                                                                                      color: Colors.white,
                                                                                                                                      textColor: Colors.black,
                                                                                                                                      shape: _wall2
                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            )
                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            ),
                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              SizedBox(height: 10),
                                                                                                                              Row(
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: RaisedButton(
                                                                                                                                      onPressed: () => {
                                                                                                                                        setState(() {
                                                                                                                                          _wall3 = true;
                                                                                                                                          _wall1 = !_wall3;
                                                                                                                                          _wall2 = !_wall3;
                                                                                                                                          _wall4 = !_wall3;
                                                                                                                                          value1 = '의뢰 가구 |  식탁';
                                                                                                                                        }),
                                                                                                                                        print(value1),
                                                                                                                                      },
                                                                                                                                      child: Text('식탁'),
                                                                                                                                      color: Colors.white,
                                                                                                                                      textColor: Colors.black,
                                                                                                                                      shape: _wall3
                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            )
                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            ),
                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  SizedBox(width: 10),
                                                                                                                                  Expanded(
                                                                                                                                    child: RaisedButton(
                                                                                                                                      onPressed: () => {
                                                                                                                                        setState(() {
                                                                                                                                          _wall4 = true;
                                                                                                                                          _wall1 = !_wall4;
                                                                                                                                          _wall2 = !_wall4;
                                                                                                                                          _wall3 = !_wall4;
                                                                                                                                          value1 = '의뢰 가구 |  기타';
                                                                                                                                        }),
                                                                                                                                        print(value1),
                                                                                                                                      },
                                                                                                                                      child: Text('기타'),
                                                                                                                                      color: Colors.white,
                                                                                                                                      textColor: Colors.black,
                                                                                                                                      shape: _wall4
                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                            )
                                                                                                                                          : RoundedRectangleBorder(
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
                                                                                                                      ],
                                                                                                                    )
                                                                                                                  : _serviceForm == '30'
                                                                                                                      ?
                                                                                                                      //붙박이장 설치 / 시스템 행거 / 펜트리 선반 설치
                                                                                                                      Column(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                              child: Row(
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    flex: 1,
                                                                                                                                    child: Text(
                                                                                                                                      '설치 위치',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14,
                                                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  SizedBox(width: 10),
                                                                                                                                  Expanded(
                                                                                                                                    flex: 5,
                                                                                                                                    child: Container(
                                                                                                                                      width: Get.width * 0.5,
                                                                                                                                      child: TextField(
                                                                                                                                        controller: a_Controller,
                                                                                                                                        onChanged: (text) {
                                                                                                                                          setState(() {
                                                                                                                                            value1 = '설치 위치 |  $text';
                                                                                                                                          });
                                                                                                                                          print(value1);
                                                                                                                                        },
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
                                                                                                                                          hintText: '설치 위치를 입력 해주세요.',
                                                                                                                                          hintStyle: TextStyle(
                                                                                                                                            color: Color(0xFF777777),
                                                                                                                                            fontSize: 13,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            SizedBox(
                                                                                                                              height: 10,
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                              child: Row(
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    flex: 1,
                                                                                                                                    child: Text(
                                                                                                                                      '사이즈',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14,
                                                                                                                                        fontFamily: 'NanumSquareB',
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  SizedBox(width: 10),
                                                                                                                                  Expanded(
                                                                                                                                    flex: 5,
                                                                                                                                    child: Container(
                                                                                                                                      width: Get.width * 0.5,
                                                                                                                                      child: TextField(
                                                                                                                                        controller: b_Controller,
                                                                                                                                        onChanged: (text) {
                                                                                                                                          setState(() {
                                                                                                                                            value2 = '사이즈 |  $text';
                                                                                                                                          });
                                                                                                                                          print(value2);
                                                                                                                                        },
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
                                                                                                                                          hintText: '사이즈를 입력 해주세요.',
                                                                                                                                          hintStyle: TextStyle(
                                                                                                                                            color: Color(0xFF777777),
                                                                                                                                            fontSize: 13,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        )
                                                                                                                      : _serviceForm == '31'
                                                                                                                          ?
                                                                                                                          //쇼파 천갈이
                                                                                                                          Column(
                                                                                                                              children: [
                                                                                                                                Container(
                                                                                                                                  padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Text(
                                                                                                                                          '쇼파 수',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 14,
                                                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      SizedBox(width: 10),
                                                                                                                                      Expanded(
                                                                                                                                        flex: 5,
                                                                                                                                        child: Container(
                                                                                                                                          width: Get.width * 0.5,
                                                                                                                                          child: TextField(
                                                                                                                                            controller: a_Controller,
                                                                                                                                            onChanged: (text) {
                                                                                                                                              setState(() {
                                                                                                                                                value1 = '쇼파 수 |  $text 개';
                                                                                                                                              });
                                                                                                                                              print(value1);
                                                                                                                                            },
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
                                                                                                                                              hintText: '쇼파 수를 입력 해주세요.',
                                                                                                                                              hintStyle: TextStyle(
                                                                                                                                                color: Color(0xFF777777),
                                                                                                                                                fontSize: 13,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                SizedBox(
                                                                                                                                  height: 10,
                                                                                                                                ),
                                                                                                                                Container(
                                                                                                                                  padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Text(
                                                                                                                                          '사이즈',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 14,
                                                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      SizedBox(width: 10),
                                                                                                                                      Expanded(
                                                                                                                                        flex: 5,
                                                                                                                                        child: Container(
                                                                                                                                          width: Get.width * 0.5,
                                                                                                                                          child: TextField(
                                                                                                                                            controller: b_Controller,
                                                                                                                                            onChanged: (text) {
                                                                                                                                              setState(() {
                                                                                                                                                value2 = '사이즈 |  $text';
                                                                                                                                              });
                                                                                                                                              print(value2);
                                                                                                                                            },
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
                                                                                                                                              hintText: '사이즈를 입력 해주세요.',
                                                                                                                                              hintStyle: TextStyle(
                                                                                                                                                color: Color(0xFF777777),
                                                                                                                                                fontSize: 13,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            )
                                                                                                                          : _serviceForm == '33'
                                                                                                                              ?
                                                                                                                              //매트리스 케어
                                                                                                                              Column(
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Expanded(
                                                                                                                                            flex: 1,
                                                                                                                                            child: Text(
                                                                                                                                              '침대 수',
                                                                                                                                              style: TextStyle(
                                                                                                                                                fontSize: 14,
                                                                                                                                                fontFamily: 'NanumSquareB',
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          SizedBox(width: 10),
                                                                                                                                          Expanded(
                                                                                                                                            flex: 5,
                                                                                                                                            child: Container(
                                                                                                                                              width: Get.width * 0.5,
                                                                                                                                              child: TextField(
                                                                                                                                                controller: b_Controller,
                                                                                                                                                onChanged: (text) {
                                                                                                                                                  setState(() {
                                                                                                                                                    value1 = '침대 수 |  $text 개';
                                                                                                                                                  });
                                                                                                                                                  print(value1);
                                                                                                                                                },
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
                                                                                                                                                  hintText: '침대 수를 입력 해주세요.',
                                                                                                                                                  hintStyle: TextStyle(
                                                                                                                                                    color: Color(0xFF777777),
                                                                                                                                                    fontSize: 13,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      height: 10,
                                                                                                                                    ),
                                                                                                                                    Container(
                                                                                                                                      padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Expanded(
                                                                                                                                            flex: 1,
                                                                                                                                            child: Text(
                                                                                                                                              '사이즈',
                                                                                                                                              style: TextStyle(
                                                                                                                                                fontSize: 14,
                                                                                                                                                fontFamily: 'NanumSquareB',
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          SizedBox(width: 10),
                                                                                                                                          Expanded(
                                                                                                                                            flex: 5,
                                                                                                                                            child: Container(
                                                                                                                                              width: Get.width * 0.5,
                                                                                                                                              child: TextField(
                                                                                                                                                controller: a_Controller,
                                                                                                                                                onChanged: (text) {
                                                                                                                                                  setState(() {
                                                                                                                                                    value2 = '사이즈 |  $text';
                                                                                                                                                  });
                                                                                                                                                  print(value2);
                                                                                                                                                },
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
                                                                                                                                                  hintText: '사이즈를 입력 해주세요.',
                                                                                                                                                  hintStyle: TextStyle(
                                                                                                                                                    color: Color(0xFF777777),
                                                                                                                                                    fontSize: 13,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                )
                                                                                                                              : _serviceForm == '34'
                                                                                                                                  ?
                                                                                                                                  //사전점검 / 소독 & 방역
                                                                                                                                  Column(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          width: Get.width,
                                                                                                                                          padding: EdgeInsets.only(left: 15, right: 15),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                '건물 형태',
                                                                                                                                                style: TextStyle(
                                                                                                                                                  fontSize: 14,
                                                                                                                                                  fontFamily: 'NanumSquareB',
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              SizedBox(height: 15),
                                                                                                                                              Row(
                                                                                                                                                children: [
                                                                                                                                                  Expanded(
                                                                                                                                                    child: RaisedButton(
                                                                                                                                                      onPressed: () => {
                                                                                                                                                        setState(() {
                                                                                                                                                          _gongan1 = true;
                                                                                                                                                          _gongan2 = !_gongan1;
                                                                                                                                                          _gongan3 = !_gongan1;
                                                                                                                                                          _gongan4 = !_gongan1;
                                                                                                                                                          value1 = '건물 형태 |  아파트';
                                                                                                                                                          print(value1);
                                                                                                                                                        })
                                                                                                                                                      },
                                                                                                                                                      child: Text('아파트'),
                                                                                                                                                      color: Colors.white,
                                                                                                                                                      textColor: Colors.black,
                                                                                                                                                      shape: _gongan1
                                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            )
                                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            ),
                                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  SizedBox(width: 10),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: RaisedButton(
                                                                                                                                                      onPressed: () => {
                                                                                                                                                        setState(() {
                                                                                                                                                          _gongan2 = true;
                                                                                                                                                          _gongan1 = !_gongan2;
                                                                                                                                                          _gongan3 = !_gongan2;
                                                                                                                                                          _gongan4 = !_gongan2;
                                                                                                                                                          value1 = '건물 형태 |  오피스텔';
                                                                                                                                                          print(value1);
                                                                                                                                                        })
                                                                                                                                                      },
                                                                                                                                                      child: Text('오피스텔'),
                                                                                                                                                      color: Colors.white,
                                                                                                                                                      textColor: Colors.black,
                                                                                                                                                      shape: _gongan2
                                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            )
                                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            ),
                                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                              SizedBox(height: 10),
                                                                                                                                              Row(
                                                                                                                                                children: [
                                                                                                                                                  Expanded(
                                                                                                                                                    child: RaisedButton(
                                                                                                                                                      onPressed: () => {
                                                                                                                                                        setState(() {
                                                                                                                                                          _gongan3 = true;
                                                                                                                                                          _gongan1 = !_gongan3;
                                                                                                                                                          _gongan2 = !_gongan3;
                                                                                                                                                          _gongan4 = !_gongan3;
                                                                                                                                                          value1 = '건물 형태 |  빌라';
                                                                                                                                                          print(value1);
                                                                                                                                                        })
                                                                                                                                                      },
                                                                                                                                                      child: Text('빌라'),
                                                                                                                                                      color: Colors.white,
                                                                                                                                                      textColor: Colors.black,
                                                                                                                                                      shape: _gongan3
                                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            )
                                                                                                                                                          : RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFFcccccc), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            ),
                                                                                                                                                      padding: EdgeInsets.fromLTRB(40, 17, 40, 17),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  SizedBox(width: 10),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: RaisedButton(
                                                                                                                                                      onPressed: () => {
                                                                                                                                                        setState(() {
                                                                                                                                                          _gongan4 = true;
                                                                                                                                                          _gongan1 = !_gongan4;
                                                                                                                                                          _gongan2 = !_gongan4;
                                                                                                                                                          _gongan3 = !_gongan4;
                                                                                                                                                          value1 = '건물 형태 |  주택';
                                                                                                                                                          print(value1);
                                                                                                                                                        })
                                                                                                                                                      },
                                                                                                                                                      child: Text('주택'),
                                                                                                                                                      color: Colors.white,
                                                                                                                                                      textColor: Colors.black,
                                                                                                                                                      shape: _gongan4
                                                                                                                                                          ? RoundedRectangleBorder(
                                                                                                                                                              side: BorderSide(color: Color(0xFF025595), width: 1),
                                                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                                                            )
                                                                                                                                                          : RoundedRectangleBorder(
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
                                                                                                                                        SizedBox(height: 40),
                                                                                                                                        Container(
                                                                                                                                          padding: EdgeInsets.only(left: 5, right: 5),
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
                                                                                                                                                        Text(
                                                                                                                                                          '방 개수',
                                                                                                                                                          style: TextStyle(
                                                                                                                                                            fontSize: 14,
                                                                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                        SizedBox(
                                                                                                                                                          width: 15.0,
                                                                                                                                                        ),
                                                                                                                                                        Container(
                                                                                                                                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                                          width: 100.0,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                              border: Border.all(
                                                                                                                                                                width: 1.0,
                                                                                                                                                                color: Color(0xFFcccccc),
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                                          child: TextField(
                                                                                                                                                            controller: a_Controller!,
                                                                                                                                                            onChanged: (text) {
                                                                                                                                                              setState(() {
                                                                                                                                                                value2 = '방 개수 |  $text 개';
                                                                                                                                                              });
                                                                                                                                                              print(value2);
                                                                                                                                                            },
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
                                                                                                                                                              suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    )),
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    flex: 1,
                                                                                                                                                    child: Container(
                                                                                                                                                        child: Row(
                                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                      children: <Widget>[
                                                                                                                                                        Text(
                                                                                                                                                          '화장실\n개수',
                                                                                                                                                          textAlign: TextAlign.center,
                                                                                                                                                          style: TextStyle(
                                                                                                                                                            fontSize: 14,
                                                                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                        SizedBox(
                                                                                                                                                          width: 15.0,
                                                                                                                                                        ),
                                                                                                                                                        Container(
                                                                                                                                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                                          width: 100.0,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                              border: Border.all(
                                                                                                                                                                width: 1.0,
                                                                                                                                                                color: Color(0xFFcccccc),
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                                          child: TextField(
                                                                                                                                                            controller: b_Controller!,
                                                                                                                                                            onChanged: (text) {
                                                                                                                                                              setState(() {
                                                                                                                                                                value3 = '화장실 개수 |  $text 개';
                                                                                                                                                              });
                                                                                                                                                              print(value3);
                                                                                                                                                            },
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
                                                                                                                                                              suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    )),
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
                                                                                                                                                        Text(
                                                                                                                                                          '베란다\n개수',
                                                                                                                                                          textAlign: TextAlign.center,
                                                                                                                                                          style: TextStyle(
                                                                                                                                                            fontSize: 14,
                                                                                                                                                            fontFamily: 'NanumSquareB',
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                        SizedBox(
                                                                                                                                                          width: 15.0,
                                                                                                                                                        ),
                                                                                                                                                        Container(
                                                                                                                                                          padding: EdgeInsets.only(left: 10.0, right: 25.0),
                                                                                                                                                          width: 100.0,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                              border: Border.all(
                                                                                                                                                                width: 1.0,
                                                                                                                                                                color: Color(0xFFcccccc),
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(10.0)),
                                                                                                                                                          child: TextField(
                                                                                                                                                            controller: c_Controller!,
                                                                                                                                                            onChanged: (text) {
                                                                                                                                                              setState(() {
                                                                                                                                                                value4 = '베란다 개수 |  $text 개';
                                                                                                                                                              });
                                                                                                                                                              print(value4);
                                                                                                                                                            },
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
                                                                                                                                                              suffixStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    )),
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
                                                                                                                                      ],
                                                                                                                                    )
                                                                                                                                  : Container(),

              ////////////////////////////////////////////////////////////////////////

              //요청사항
              SizedBox(height: 40.0),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '요청 사항',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding:
                          EdgeInsets.only(left: 15, right: 15, bottom: 10.0),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        border: Border.all(
                          width: 1.0,
                          color: Color(0xFFcccccc),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: detail_Controller,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14.0),
                        keyboardType: TextInputType.multiline,
                        maxLength: 500,
                        maxLines: 5,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              //사진첨부
              SizedBox(height: 40),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '사진 첨부',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '1';
                                  });
                                  print(1);
                                  getImageGallery();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.6, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  height: 90.0,
                                  child: _image1 == null
                                      ? Center(
                                          child: Icon(CupertinoIcons.camera),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.file(
                                            File(_image1!.path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ))),
                        SizedBox(width: 10.0),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '2';
                                  });
                                  print(2);
                                  getImageGallery();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.6, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  height: 90.0,
                                  child: _image2 == null
                                      ? Center(
                                          child: Icon(CupertinoIcons.camera),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.file(
                                            File(_image2!.path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ))),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '3';
                                  });
                                  print(3);
                                  getImageGallery();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.6, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  height: 90.0,
                                  child: _image3 == null
                                      ? Center(
                                          child: Icon(CupertinoIcons.camera),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.file(
                                            File(_image3!.path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ))),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 60.0),

              //확인 BTN
              InkWell(
                onTap: () {
                  updateOrder();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: 260,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF025595),
                    ),
                    child: Center(
                      child: Text(
                        '신청 하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}

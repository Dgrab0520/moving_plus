import 'dart:math';

import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/customer_data.dart';
import 'package:moving_plus/datas/order_data.dart';
import 'package:moving_plus/models/customer_model.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

final _processes = [
  '필수정보',
  '선택정보',
  '완료',
];

final controller = Get.put(ReactiveController());

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);

class Request_Estimate extends StatefulWidget {
  const Request_Estimate({
    Key? key,
  }) : super(key: key);

  @override
  _Request_EstimateState createState() => _Request_EstimateState();
}

class _Request_EstimateState extends State<Request_Estimate> {
  bool _gongan5 = true;
  bool _gongan6 = false;

  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController phController = TextEditingController();

  bool _buttonPressed = false;
  bool _buttonPressed2 = true;

  String addressJSON = '';
  String? _serviceType = '';
  String orderInfo = ""; //자동 로그인시 로그인 정보 저장
  String? name = '';
  String? orderId = '';
  String? space_type = '';
  String? size_unit = '';
  List<Customer> customer = [];
  bool isLoading = false;

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  updateOrder() {
    OrderData.updateOrder(
            controller.pro.value.pro_id.split("@")[0] + orderId!,
            controller.pro.value.pro_id,
            nameController!.text,
            phController.text,
            addressJSON,
            addressController.text,
            space_type!,
            areaController.text + size_unit!,
            _serviceType!)
        .then((value) {
      //controller.pro.value.pro_id+orderId!, controller.pro.value.pro_id, nameController!.text, phController!.text, addressJSON, addressController!.text, space_type!, areaController!.text+size_unit!
      if (value == "success") {
        print('Insert Success');
        Get.toNamed(
            "/request_estimate2/true?serviceType=$_serviceType&orderId=${controller.pro.value.pro_id.split('@')[0]}$orderId&&address=$addressJSON");
      } else {
        print('$value : Insert Fails');
      }
    });
  }

  @override
  void initState() {
    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });

    if (controller.pro.value.type == 'cus') {
      Customer_Data.get_Customer(controller.pro.value.pro_id).then((value) {
        print('token11: ${controller.pro.value.pro_id}');
        setState(() {
          customer = value;
        });
        print({'customer : ${customer[0].cus_token}'});
        if (value.length == 0) {
          isLoading = false;
        } else {
          isLoading = true;
          controller.change(
            type: 'cus',
            id: '0',
            pro_id: controller.pro.value.pro_id,
            pro_pw: controller.pro.value.pro_pw,
            pro_name: controller.pro.value.pro_name,
            pro_phone: controller.pro.value.pro_phone,
            pro_email: 'None',
            com_name: 'None',
            profile_img: controller.pro.value.profile_img,
            pro_token: customer[0].cus_token,
            recom: customer[0].cus_recom,
          );
        }
      });
    }

    orderId = generateRandomString(6);
    _serviceType = Get.parameters['serviceType'];
    print('orderId : $orderId');
    nameController!.text = name!;
    if (_gongan5) {
      setState(() {
        space_type = '거주';
      });
    } else if (_gongan6) {
      setState(() {
        space_type = '상업';
      });
    }
    if (_buttonPressed2) {
      setState(() {
        size_unit = '평형';
      });
    } else if (_buttonPressed) {
      setState(() {
        size_unit = '㎡';
      });
    }
    super.initState();
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    orderInfo = (await storage.read(key: "order"))!;
    print('proInfo?? $orderInfo');

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (orderInfo != null) {
      setState(() {
        addressJSON = '${orderInfo.split("/")[1]}';
        addressController.text = '${orderInfo.split("/")[3]}';
        areaController.text = '${orderInfo.split("/")[5]}';
        _gongan5 = '${orderInfo.split("/")[7]}' == 'true';
        _gongan6 = '${orderInfo.split("/")[9]}' == 'true';
        _buttonPressed = '${orderInfo.split("/")[11]}' == 'true';
        _buttonPressed2 = '${orderInfo.split("/")[13]}' == 'true';
        nameController!.text = '${orderInfo.split("/")[15]}';
        phController.text = '${orderInfo.split("/")[17]}';
      });
      // print('Success & return ${orderInfo.split("/")[7]} ${orderInfo.split("/")[9]}');
      // print("gong5 : ${orderInfo.split("/")[7]}\ngong6 : ${orderInfo.split("/")[9]}\n_buttonPressed : ${orderInfo.split("/")[11]}\n_buttonPressed2 : ${orderInfo.split("/")[13]}");

    } else {
      print('false & Again');
    }
  }

  //OrderId Random 생성
  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  //TimeLine 색상 변경
  Color getColor(int index) {
    if (index == 2) {
      return inProgressColor;
    } else {
      return completeColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '견적 신청',
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
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   padding:
              //       EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              //   width: Get.width,
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(width: 1, color: Color(0xFFcccccc)),
              //     ),
              //   ),
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: 100.0,
              //     width: Get.width,
              //     child: Timeline.tileBuilder(
              //       theme: TimelineThemeData(
              //           direction: Axis.horizontal,
              //           connectorTheme:
              //               ConnectorThemeData(space: 15.0, thickness: 3.0)),
              //       builder: TimelineTileBuilder.connected(
              //         connectionDirection: ConnectionDirection.before,
              //         itemExtentBuilder: (_, __) =>
              //             MediaQuery.of(context).size.width / _processes.length,
              //         contentsBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.only(top: 8.0),
              //             child: Text(
              //               _processes[index],
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 11.0,
              //                 color:
              //                     index == 0 ? inProgressColor : completeColor,
              //               ),
              //             ),
              //           );
              //         },
              //         indicatorBuilder: (_, index) {
              //           var color;
              //           var child;
              //           if (index == 0) {
              //             color = Color(0xff5ec792);
              //             child = Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     border: Border.all(
              //                         width: 2.5, color: Colors.white),
              //                     color: Color(0xff5ec792),
              //                   ),
              //                 ));
              //           } else if (index < 2) {
              //             color = completeColor;
              //           } else {
              //             color = completeColor;
              //           }
              //
              //           if (index <= 2) {
              //             return Stack(
              //               children: [
              //                 CustomPaint(
              //                   size: Size(30.0, 30.0),
              //                 ),
              //                 DotIndicator(
              //                   size: 30.0,
              //                   color: color,
              //                   child: child,
              //                 ),
              //               ],
              //             );
              //           } else {
              //             return Stack(
              //               children: [
              //                 CustomPaint(
              //                   size: Size(15.0, 15.0),
              //                 ),
              //                 OutlinedDotIndicator(
              //                   borderWidth: 4.0,
              //                   color: Colors.pink,
              //                 ),
              //               ],
              //             );
              //           }
              //         },
              //         connectorBuilder: (_, index, type) {
              //           if (index > 0) {
              //             if (index == 2) {
              //               final prevColor = getColor(index - 1);
              //               final color = getColor(index);
              //
              //               return DecoratedLineConnector(
              //                 decoration:
              //                     BoxDecoration(color: Color(0xff071039)),
              //               );
              //             } else {
              //               return SolidLineConnector(
              //                 color: Color(0xff071039),
              //               );
              //             }
              //           } else {
              //             return null;
              //           }
              //         },
              //         itemCount: _processes.length,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
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
                          Text(
                            '주소',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          SizedBox(height: 10),
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF9F9F9),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Color(0xFFcccccc),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        addressJSON == ''
                                            ? '주소를 입력해주세요'
                                            : '$addressJSON',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    )),
                              )),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFcccccc),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black87),
                              onChanged: (text) {},
                              decoration: InputDecoration(
                                hintText: '상세 주소를 입력해주세요',
                                hintStyle: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '공간 유형',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan5 = true;
                                _gongan6 = false;
                                space_type = '거주';
                              })
                            },
                            child: Text('거주'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan5
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
                        SizedBox(width: 10),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                _gongan6 = true;
                                _gongan5 = false;
                                space_type = '상업';
                              })
                            },
                            child: Text('상업'),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: _gongan6
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '평수 ( 공급면적 )',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: Get.width * 0.4,
                            child: TextField(
                              controller: areaController,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF025595)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF025595)),
                                ),
                                hintText: '공급 면적을 입력 해주세요',
                                hintStyle: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: RaisedButton(
                          child: new Text(
                            '평',
                            style: TextStyle(
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          textColor: Colors.white,
                          // 2
                          color: _buttonPressed2
                              ? Color(0xFF025595)
                              : Color(0xFF777777),
                          // 3
                          onPressed: () => {
                            setState(() {
                              _buttonPressed2 = true;
                              _buttonPressed = false;
                              size_unit = '평';
                            })
                          },
                        )),
                        SizedBox(width: 10),
                        Expanded(
                            child: RaisedButton(
                          child: new Text(
                            '㎡',
                            style: TextStyle(
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          textColor: Colors.white,
                          // 2
                          color: _buttonPressed
                              ? Color(0xFF025595)
                              : Color(0xFF777777),
                          // 3
                          onPressed: () => {
                            setState(() {
                              _buttonPressed = true;
                              _buttonPressed2 = false;
                              size_unit = '㎡';
                            })
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '성함',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        border: Border.all(
                          width: 1.0,
                          color: Color(0xFFcccccc),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '연락처',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        border: Border.all(
                          width: 1.0,
                          color: Color(0xFFcccccc),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: phController,
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                        style: TextStyle(fontSize: 13.0, color: Colors.black87),
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: '"-"를 뺀 전화번호를 입력해주세요.',
                          hintStyle:
                              TextStyle(fontSize: 13.0, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (addressJSON == "" ||
                      areaController.text == "" ||
                      nameController?.text == "" ||
                      phController.text == "") {
                    Get.snackbar("실패", "빈칸이 있습니다");
                  } else {
                    storage.write(
                        key: "order",
                        value: "address/" +
                            addressJSON +
                            "/" +
                            "addressDetail/" +
                            addressController.text.toString() +
                            "/" +
                            "area/" +
                            areaController.text.toString() +
                            "/" +
                            "_gongan5/" +
                            _gongan5.toString() +
                            "/" +
                            "_gongan6/" +
                            _gongan6.toString() +
                            "/" +
                            "_buttonPressed/" +
                            _buttonPressed.toString() +
                            "/" +
                            "_buttonPressed2/" +
                            _buttonPressed2.toString() +
                            "/" +
                            "name/" +
                            nameController!.text.toString() +
                            "/" +
                            "ph/" +
                            phController.text.toString());
                    updateOrder();
                  }
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
                        '다음 단계',
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
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

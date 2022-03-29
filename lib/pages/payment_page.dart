import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/customer_data.dart';
import 'package:moving_plus/datas/final_order_data.dart';
import 'package:moving_plus/models/payment_model.dart';
import 'package:moving_plus/pages/transaction_breakdown.dart';

final controller_Getx = Get.put(ReactiveController());

class Payment_Page extends StatefulWidget {
  @override
  _Payment_PageState createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {
  List<Payment> payment = [];
  bool _isLoading = false;
  String estimate_id = Get.arguments;
  String strToday = '';
  String method = '';
  int point = 0;

  TextEditingController pointController = TextEditingController();

  selectPayment() {
    print(estimate_id);
    FinalOrder_Data.selectPayment(estimate_id).then((value) {
      setState(() {
        payment = value;
      });
      if (value.isEmpty) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
          Customer_Data.getCustomerPoint(controller_Getx.pro.value.pro_id)
              .then((value) {
            setState(() {
              point = int.parse(value);
              print(point);
            });
          });
        });
      }
    });
  }

  @override
  void initState() {
    selectPayment();
    getToday();
    super.initState();
  }

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd EE');
    strToday = formatter.format(now);
    return strToday;
  }

  final controller = GroupButtonController(
    selectedIndex: 3,
    selectedIndexes: [1, 2, 3],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('결제'),
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      '$strToday',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'NanumSquareB',
                          color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    _isLoading
                        ? Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFcccccc),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/won_g.png',
                                        width: 23, height: 23),
                                    SizedBox(width: 7),
                                    Text(
                                      '결제 내역',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                        child: InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                            radius: 5.0,
                                            title: '계약금',
                                            titleStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            content: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: Get.width,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20.0,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '전체 비용',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '계약 수수료',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '1~150,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '15,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '150,001~499,999 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '전체 비용 10%',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '500,000~1,000,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '50,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '1,000,001~1,500,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '60,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '1,500,001~2,000,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '70,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '2,000,001~2,500,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '80,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '2,500,000~3,000,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '90,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '3,000,001~ 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                height: 25.0,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .black54)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '100,000 원',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontFamily:
                                                                            'NanumSquareB',
                                                                        color: Colors
                                                                            .deepOrange),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20.0,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 35.0,
                                                              color: Color(
                                                                  0xFF025595),
                                                              child: Center(
                                                                  child: Text(
                                                                '확인',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              )),
                                                            ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            '계약금 요율표',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Icon(CupertinoIcons.question_circle,
                                              size: 17.0),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  payment[0].estimate_detail,
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text('서비스',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].service_type,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text('의뢰 고객',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].user_id,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text('최종 금액',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].final_price,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text('계약금',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].final_fee,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text('작업 시작일',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].final_date,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text('주소',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                payment[0].address,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text('포인트',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, right: 10),
                                              height: 27,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFeeeeee),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "(보유 포인트 : $point)",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    child: TextField(
                                                      controller:
                                                          pointController,
                                                      onChanged: (text) {
                                                        int value =
                                                            int.parse(text);
                                                        if (value > point) {
                                                          pointController.text =
                                                              point.toString();
                                                        }
                                                      },
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF025595)),
                                                        ),
                                                        suffixText: '포인트  ',
                                                        suffixStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('결제방법',
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      GroupButton(
                                        controller: controller,
                                        isRadio: true,
                                        selectedTextStyle:
                                            TextStyle(fontSize: 12),
                                        unselectedTextStyle: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        buttons: ['카드', '실시간계좌이체', '삼성페이'],
                                        selectedColor: Color(0xFF025595),
                                        onSelected: (i, selected) {
                                          setState(() {
                                            if (i == 0) {
                                              method = 'card';
                                            } else if (i == 1) {
                                              method = 'trans';
                                            } else {
                                              method = 'samsung';
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '*최종 금액의 일정 비율로 계약금이 책정됩니다',
                                    style: TextStyle(
                                      color: Color(0xFF025595),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '*최종 금액의 일정 비율로 계약금이 책정됩니다',
                                    style: TextStyle(
                                      color: Color(0xFF025595),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '*최종 금액의 일정 비율로 계약금이 책정됩니다',
                                    style: TextStyle(
                                      color: Color(0xFF025595),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                InkWell(
                                  onTap: () {
                                    if (controller_Getx.pro.value.type ==
                                        'cus') {
                                      if (method == '') {
                                        Get.snackbar("결제실패", "결제 수단을 선택하세요",
                                            backgroundColor: Colors.white);
                                      } else {
                                        Get.to(Payment_IMP(
                                          method: method,
                                          amount: payment[0]
                                                  .final_fee
                                                  .split(',')[0] +
                                              payment[0]
                                                  .final_fee
                                                  .split(',')[1],
                                          user_name: payment[0].user_id,
                                          estimate_id: estimate_id,
                                          point: pointController.text == ""
                                              ? 0
                                              : int.parse(pointController.text),
                                        ));
                                      }
                                    } else {
                                      Get.snackbar("결제실패", "고객으로 로그인하여 결제해주세요",
                                          backgroundColor: Colors.white);
                                    }
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 35, right: 35),
                                    width: Get.width,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xFF025595),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '결제하기',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     FinalOrder_Data.updateStatus(estimate_id)
                                //         .then((value) {
                                //       if (value == 'success') {
                                //         print('Update Status Success');
                                //         Customer_Data.usePoint(
                                //                 pointController.text == ""
                                //                     ? "0"
                                //                     : pointController.text)
                                //             .then((value) {
                                //           if (value) {
                                //             Get.back(result: true);
                                //             Get.to(TransactionBreakdown());
                                //           }
                                //         });
                                //       } else {
                                //         print('Update Status Fail');
                                //       }
                                //     });
                                //   },
                                //   child: Container(
                                //     margin:
                                //         EdgeInsets.only(left: 35, right: 35),
                                //     width: Get.width,
                                //     height: 45,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(5),
                                //       color: Color(0xFF025595),
                                //     ),
                                //     child: Center(
                                //       child: Text(
                                //         '테스트 결제하기',
                                //         style: TextStyle(
                                //           fontSize: 14,
                                //           fontFamily: 'NanumSquareB',
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//아임포트 결제모듈

class Payment_IMP extends StatelessWidget {
  String method;
  String amount;
  String user_name;
  String estimate_id;
  int point;

  Payment_IMP({
    required this.method,
    required this.amount,
    required this.user_name,
    required this.estimate_id,
    required this.point,
  });

  updateStatus() {
    FinalOrder_Data.updateStatus(estimate_id).then((value) {
      if (value == 'success') {
        print('Update Status Success');
        Customer_Data.usePoint(point.toString()).then((value) {
          if (value) {
            Get.back(result: true);
            Get.to(TransactionBreakdown());
          }
        });
      } else {
        print('Update Status Fail');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '입주플러스 결제',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: const Center(
        child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp01232724',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
          pg: 'html5_inicis', // PG사
          payMethod: method, // 결제수단
          name: '입주플러스 계약금 결제', // 주문명
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
          amount: int.parse(amount) - point, // 결제금액
          buyerName: user_name, // 구매자 이름
          buyerTel: '', // 구매자 연락처
          buyerEmail: '', // 구매자 이메일
          appScheme: 'movingplusapp', // 앱 URL scheme
          displayCardQuota: [2, 6] //결제창 UI 내 할부개월수 제한
          ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        if (result['success'] == 'true') {
          updateStatus();
        } else {
          Get.back();
        }
      },
    );
  }
}

// card(신용카드)
// trans(실시간계좌이체)
// samsung(삼성페이 / 이니시스, KCP 전용)

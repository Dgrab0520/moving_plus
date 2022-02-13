import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/datas/final_order_data.dart';
import 'package:moving_plus/models/payment_model.dart';

class Payment_Page extends StatefulWidget{
  @override
  _Payment_PageState createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page>{


  List<Payment> payment = [];
  bool _isLoading = false;
  String estimate_id = Get.arguments;
  String strToday = '';


  selectPayment(){
    FinalOrder_Data.selectPayment(estimate_id).then((value){
      setState(() {
        payment = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  @override
  void initState(){
    selectPayment();
    getToday();
    super.initState();
  }


  String getToday(){
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd EE');
    strToday = formatter.format(now);
    return strToday;
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )
        ),
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
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 30),
                  _isLoading ?
                  Container(
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
                              height: 20,
                              child: IconButton(
                                  onPressed: (){
                                    Get.defaultDialog(
                                        radius: 5.0,
                                        title: '수수료 요율표',
                                        titleStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareB',),
                                        content: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: Get.width,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 20.0,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('전체 비용', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('계약 수수료', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('1~150,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('15,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('150,001~499,999 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('전체 비용 10%', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('500,000~1,000,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('50,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('1,000,001~1,500,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('60,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('1,500,001~2,000,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('70,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('2,000,001~2,500,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('80,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('2,500,000~3,000,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('90,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
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
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('3,000,001~ 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB'),),),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(width: 0.5, color: Colors.black54)
                                                            ),
                                                            child: Center(child: Text('100,000 원', style: TextStyle(fontSize: 13, fontFamily: 'NanumSquareB', color: Colors.deepOrange),),),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 20.0,),
                                                    InkWell(
                                                        onTap: (){Get.back();},
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 35.0,
                                                          color: Color(0xFF025595),
                                                          child: Center(child: Text('확인', style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w700),)),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    );
                                  },
                                  icon: Icon(CupertinoIcons.question_circle, size: 20.0)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(payment[0].estimate_detail,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text('서비스',
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                      flex: 3,
                                      child: Text(payment[0].service_type, style:
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text('의뢰 고객',
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                      flex: 3,
                                      child: Text(payment[0].user_id, style:
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      )
                                  ),
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
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                      flex: 3,
                                      child: Text(payment[0].final_price, style:
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text('계약금',
                                        style: TextStyle(
                                          fontSize: 14,
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                    flex: 3,
                                    child: Text(payment[0].final_fee, style:
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    )
                                  ),
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
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                      flex: 3,
                                      child: Text(payment[0].final_date, style:
                                      TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      )
                                  ),
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
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                      flex: 3,
                                      child: Text(payment[0].address, style:
                                        TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),
                                ],
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
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 35, right: 35),
                            width: Get.width,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF025595),
                            ),
                            child: Center(
                              child: Text(
                                '보내기',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NanumSquareB',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
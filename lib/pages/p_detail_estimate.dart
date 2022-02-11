import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/final_order_data.dart';

class P_Detail_Estimate extends StatefulWidget {
  const P_Detail_Estimate({Key? key}) : super(key: key);

  @override
  _P_Detail_EstimateState createState() => _P_Detail_EstimateState();
}

class _P_Detail_EstimateState extends State<P_Detail_Estimate> {
  var finalPriceController = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: ',', precision: 0);
  var finalDownPriceController = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: ',', precision: 0);


  String estimate_id = Get.arguments;
  DateTime selectedDate = DateTime.now();
  String? final_Selected1 = '';


  insertFinal(){
    FinalOrder_Data.insertFinal(estimate_id, finalPriceController.text, finalDownPriceController.text, final_Selected1!).then((value){
      if(value == 'success'){
        print('Insert Final Order Success');
      }else{
        print('Insert Final Order Fail');
      }
    });
  }

  @override
  void initState(){
    super.initState();
    print('aaaa : $estimate_id');
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2999),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '최종견적 작성',
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
                      '2021년 12월 16일 목요일',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 470,
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
                                '견적서',
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
                          Text(
                            '안녕하세요 \n인테리어 작업대 입니다 \n요청 해주신 견적서 보내드립니다.',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            width: Get.width,
                            height: 315,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('서비스',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                            hintText: '인테리어 시공 | 올 인테리어',
                                            hintStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('최종 금액',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFeeeeee),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextField(
                                          controller: finalPriceController,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                          onChanged: (value) {
                                            if(finalPriceController.numberValue <= 150000){
                                              finalDownPriceController
                                                  .updateValue(15000);
                                            }else if(finalPriceController.numberValue > 150000 && finalPriceController.numberValue < 500000){
                                              finalDownPriceController
                                                  .updateValue(
                                                  finalPriceController
                                                      .numberValue /
                                                      10);
                                            }else if(finalPriceController.numberValue >= 500000 && finalPriceController.numberValue <= 1000000){
                                              finalDownPriceController
                                                  .updateValue(50000);
                                            }else if(finalPriceController.numberValue >= 1000001 && finalPriceController.numberValue <= 1500000){
                                              finalDownPriceController
                                                  .updateValue(60000);
                                            }else if(finalPriceController.numberValue >= 1500001 && finalPriceController.numberValue <= 2000000){
                                              finalDownPriceController
                                                  .updateValue(70000);
                                            }else if(finalPriceController.numberValue >= 2000001 && finalPriceController.numberValue <= 2500000){
                                              finalDownPriceController
                                                  .updateValue(80000);
                                            }else if(finalPriceController.numberValue >= 2500001 && finalPriceController.numberValue <= 3000000){
                                              finalDownPriceController
                                                  .updateValue(90000);
                                            }else if(finalPriceController.numberValue >= 3000001){
                                              finalDownPriceController
                                                  .updateValue(100000);
                                            }

                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF025595)),
                                            ),
                                            suffixText: '원  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                            hintText: '최종 금액을 입력해주세요',
                                            hintStyle: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text('계약금',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30),
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          controller: finalDownPriceController,
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixText: '원  ',
                                            suffixStyle: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text('작업 시작일',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    // Expanded(
                                    //   flex: 3,
                                    //   child: Container(
                                    //     margin: EdgeInsets.only(right: 30),
                                    //     padding: EdgeInsets.only(
                                    //         right: 10, left: 10),
                                    //     height: 30,
                                    //     child: TextField(
                                    //       enabled: false,
                                    //       keyboardType: TextInputType.text,
                                    //       onChanged: (text) {},
                                    //       decoration: InputDecoration(
                                    //         labelText:
                                    //         '2021.12.25~2022.2월',
                                    //         labelStyle: TextStyle(
                                    //           fontSize: 12,
                                    //           color: Colors.black,
                                    //           fontFamily: 'NanumSquareB',
                                    //         ),
                                    //         border: InputBorder.none,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(width: 15,),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                          onTap: () => _selectDate(context),
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "${selectedDate.toLocal()}".split(' ')[0],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,),
                                                Container(
                                                  child: Icon(
                                                    Icons.calendar_today,
                                                    color: Color(0xFF025595),
                                                    size: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('공간 유형',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30),
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                            labelText: '거주',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('공간 선택',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30),
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                            labelText: '전체 공간',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('지역',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30),
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                            labelText: '서울 양천구',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('예상 견적',
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30),
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        height: 30,
                                        child: TextField(
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          onChanged: (text) {},
                                          decoration: InputDecoration(
                                            labelText: '5000~6000만원',
                                            labelStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
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
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        if (finalPriceController.numberValue != 0) {
                          insertFinal();
                          Get.back(
                              result: finalPriceController.numberValue.toInt());
                        } else {
                          Get.snackbar("오류", "최종 금액을 입력해주세요");
                        }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

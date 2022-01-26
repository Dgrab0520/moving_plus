import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/estimate_data.dart';
import 'package:moving_plus/models/estimate_model.dart';
import 'chat_estimate.dart';



final controller = Get.put(ReactiveController());

class Estimate_Page extends StatefulWidget{
  @override
  _Estimate_PageState createState() => _Estimate_PageState();
}

class _Estimate_PageState extends State<Estimate_Page>{

  String? estimateId = '';
  String? order_id = Get.parameters['order_id'];
  String? customer_id = Get.parameters['customer_id'];
  bool _isSend = false;
  List<Estimate> estimate = [];

  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  UpdateEstimate(){
    EstimateData.insertEstimate(controller.pro.value.pro_id, estimateId!, order_id!, priceController.text, detailController.text).then((value){
      if(value == "success"){
        print('Insert Success');
        insertChat();
      }else{
        print('$value : Insert Fails');
        Get.snackbar('전송 실패', '견적서 전송에 실패하였습니다\n네트워크 상태를 확인해주세요', backgroundColor: Colors.white);
      }
    });
  }

  insertChat(){
    EstimateData.insertEstimate_Chat(estimateId!, customer_id!, controller.pro.value.id, detailController.text, priceController.text).then((value){
      if(value == "success"){
        print('Chat Success');
        Get.offAndToNamed('/request_form/true?order_id=${order_id}');
      }else{
        print('$value : Chat Fails');
        Get.snackbar('채팅 전송 실패', '견적서 전송에 실패하였습니다\n네트워크 상태를 확인해주세요', backgroundColor: Colors.white);
      }
    });
  }


  getRecord(){
    EstimateData.getEstimate_record(order_id!, controller.pro.value.pro_id).then((value){
      setState(() {
        estimate = value;
      });
      if(value.isEmpty){
        setState(() {
          _isSend = true;
        });
      }else{
        setState(() {
          _isSend = false;
        });
      }
    });
  }


  @override
  void initState(){
    estimateId = generateRandomString(10);
    getRecord();
    super.initState();
  }

  //OrderId Random 생성
  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:0,
          title: Text('견적서 작성',
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
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0,),
                      Text('요청서를 보고 예상 견적 비용을 적어주세요', style:
                      TextStyle(
                        color:Colors.black87,
                        fontSize:16,
                        fontFamily: 'NanumSquareB',
                      ),
                      ),
                      SizedBox(height: 15.0,),
                      Text('입력하신 견적 비용은\n고객님에게 채팅으로 전달 됩니다', style:
                      TextStyle(
                        color:Colors.black87,
                        fontSize:15,
                        fontFamily: 'NanumSquareL',
                      ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        width: Get.width*0.6,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 1.5, color: Color(0xFF025595))
                        ),
                        child: Center(
                          child: Text('총 비용', style:
                          TextStyle(
                            color:Color(0xFF025595),
                            fontSize:18,
                            fontFamily: 'NanumSquareB',
                          ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60.0,),
                      Container(
                        width: Get.width*0.7,
                        child: TextField(
                          controller: priceController,
                          style: TextStyle(
                              fontSize: 22.0,
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
                            suffixText: '원  ',
                            suffixStyle: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                            hintText: '   견적 금액을 입력해주세요',
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: Get.width*0.71,
                        height: 110.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFe6e6e6),
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: TextField(
                          controller: detailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "견적 정보에 대해 입력해주세요",
                              hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black87
                              )
                          ),
                          maxLines: 3,
                          maxLength: 300,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Spacer(),

                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: Get.width,
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF025595),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('견적서 보내기', style:
                        TextStyle(
                          color:Colors.white,
                          fontSize:17,
                          fontFamily: 'NanumSquareB',
                        ),
                        ),
                        InkWell(
                          onTap:(){
                            if(_isSend){
                              UpdateEstimate();
                            }else{
                              Get.snackbar('견적서 전송 실패', '이미 보낸 견적서 입니다', backgroundColor: Colors.white);
                            }
                            // Get.to(Chat_Estimate());
                          },
                          child: Container(
                            width: 100.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child: Center(
                                child: Text('보내기', style:
                                TextStyle(
                                    color:Color(0xFF025595),
                                    fontSize:16.0,
                                    fontWeight: FontWeight.bold
                                ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/alarm_data.dart';
import 'package:moving_plus/datas/customer_data.dart';
import 'package:moving_plus/datas/estimate_data.dart';
import 'package:moving_plus/models/estimate_model.dart';

final controller = Get.put(ReactiveController());

class Estimate_Page extends StatefulWidget {
  const Estimate_Page({Key? key}) : super(key: key);

  @override
  _Estimate_PageState createState() => _Estimate_PageState();
}

class _Estimate_PageState extends State<Estimate_Page> {
  String? estimateId = '';
  String? order_id = Get.parameters['order_id'];
  String? customer_id = Get.parameters['customer_id'];
  String? service_type = Get.parameters['service_type'];
  bool _isSend = false;
  List<Estimate> estimate = [];

  var priceController = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: ',', precision: 0);
  TextEditingController detailController = TextEditingController();

  UpdateEstimate() {
    EstimateData.insertEstimate(
            controller.pro.value.pro_id,
            customer_id!,
            estimateId!,
            order_id!,
            priceController.numberValue.toInt().toString(),
            detailController.text)
        .then((value) {
      if (value == "success") {
        print('Insert Success');
        insertChat();
      } else {
        print('$value : Insert Fails');
        Get.snackbar('전송 실패', '견적서 전송에 실패하였습니다\n네트워크 상태를 확인해주세요',
            backgroundColor: Colors.white);
      }
    });
  }

  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendFCM',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 5)));

  sendAlarm() async {
    String token = "";

    await Customer_Data.getCustomerToken(customer_id!).then((value) {
      setState(() {
        token = value;
      });
    });

    print("token : $token");
    final tempController = Get.put(ReactiveController());
    AlarmData.putChat(
        tempController.pro.value.pro_id, [customer_id], "estimated price",
        order_id: order_id, mainType: service_type);

    final HttpsCallableResult result = await callable.call(
      <String, dynamic>{
        "token": token,
        "title": "Alarm",
        "body": '${tempController.pro.value.pro_name}로부터 견적이 도착했습니다',
      },
    );
    print(token);
    print(result.data);
  }

  insertChat() {
    EstimateData.insertEstimate_Chat(
            estimateId!,
            customer_id!,
            controller.pro.value.pro_id,
            detailController.text,
            priceController.numberValue.toInt().toString())
        .then((value) {
      if (value == "success") {
        print('Chat Success');
        sendAlarm();
        Get.offAndToNamed('/request_form/true?order_id=$order_id');
        Get.snackbar('성공', '견적 보내기에 성공했습니다!', backgroundColor: Colors.white);
      } else {
        print('$value : Chat Fails');
        Get.snackbar('채팅 전송 실패', '견적서 전송에 실패하였습니다\n네트워크 상태를 확인해주세요',
            backgroundColor: Colors.white);
      }
    });
  }

  getRecord() {
    EstimateData.getEstimate_record(order_id!, controller.pro.value.pro_id)
        .then((value) {
      setState(() {
        estimate = value;
      });
      if (value.isEmpty) {
        setState(() {
          _isSend = true;
        });
      } else {
        setState(() {
          _isSend = false;
        });
      }
    });
  }

  @override
  void initState() {
    estimateId = generateRandomString(10);
    getRecord();
    super.initState();
  }

  //OrderId Random 생성
  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
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
            title: const Text(
              '견적서 작성',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'NanumSquareB',
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF025595),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 70.0,
                        ),
                        const Text(
                          '요청서를 보고 예상 견적 비용을 적어주세요',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          '입력하신 견적 비용은\n고객님에게 채팅으로 전달 됩니다',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontFamily: 'NanumSquareL',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: Get.width * 0.6,
                          height: 35.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  width: 1.5, color: const Color(0xFF025595))),
                          child: const Center(
                            child: Text(
                              '예상 견적 비용',
                              style: TextStyle(
                                color: Color(0xFF025595),
                                fontSize: 18,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                        SizedBox(
                          width: Get.width * 0.7,
                          child: TextField(
                            controller: priceController,
                            style: const TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF025595)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF025595)),
                              ),
                              suffixText: '원  ',
                              suffixStyle: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              hintText: '   견적 금액을 입력해주세요',
                              hintStyle: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: Get.width * 0.71,
                          height: 110.0,
                          decoration: BoxDecoration(
                              color: const Color(0xFFe6e6e6),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextField(
                            controller: detailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "견적 정보에 대해 입력해주세요",
                                hintStyle: TextStyle(
                                    fontSize: 13.0, color: Colors.black87)),
                            maxLines: 3,
                            maxLength: 300,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: Get.width,
                    height: 80.0,
                    decoration: const BoxDecoration(
                        color: Color(0xFF025595),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          '견적서 보내기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print(priceController.numberValue);
                            print(priceController.numberValue.toInt());
                            if (_isSend) {
                              UpdateEstimate();
                            } else {
                              Get.snackbar('견적서 전송 실패', '이미 보낸 견적서 입니다',
                                  backgroundColor: Colors.white);
                            }
                            // Get.to(Chat_Estimate());
                          },
                          child: Container(
                            width: 100.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: const Center(
                                child: Text(
                              '보내기',
                              style: TextStyle(
                                  color: Color(0xFF025595),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

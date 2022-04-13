import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/alarm_data.dart';
import 'package:moving_plus/datas/order_list_data.dart';
import 'package:moving_plus/datas/time_calculator.dart';
import 'package:moving_plus/pages/c_chatlist.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/pages/request_received..dart';

import 'notice.dart';

class MainAlarm extends StatelessWidget {
  MainAlarm({Key? key}) : super(key: key);

  final alarmController = Get.put(AlarmData());
  @override
  Widget build(BuildContext context) {
    alarmController.getAlarm();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '알림',
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
      body: Obx(
        () => alarmController.isAlarmLoad
            ? alarmController.alarms.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: alarmController.alarms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AlarmBox(
                        index: index,
                      );
                    })
                : Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.topCenter,
                    child: const Text(
                      "알람이 없습니다.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ))
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class AlarmBox extends StatelessWidget {
  AlarmBox({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final AlarmData alarmController = Get.find();

  @override
  Widget build(BuildContext context) {
    final currentAlarm = alarmController.alarms[index];
    return InkWell(
      onTap: () {
        if (currentAlarm.alarmType == "estimated price") {
          OrderList_Data.getOrderChat(currentAlarm.order_id).then((value) {
            Get.off(() =>
                C_ChatList(mainType: currentAlarm.mainType, orderChat: value!));
          });
        } else if (currentAlarm.alarmType == "estimate") {
          Get.off(() => const Request_Received());
        } else if (currentAlarm.alarmType == "notice") {
          Get.off(() => Notice());
        } else if (currentAlarm.alarmType == "first chat" ||
            currentAlarm.alarmType == "personal chat") {
          Get.off(() => const P_Chat());
        }
        alarmController.alarmDelete(index);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Image.asset('assets/defaultImage.png', width: 50, height: 50),
                  const SizedBox(width: 12),
                  Flexible(
                    child: currentAlarm.alarmType == "notice"
                        ? const Text(
                            "새로운 공지사항이 있습니다",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: currentAlarm.callerName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  ),
                                  TextSpan(
                                      text: currentAlarm.alarmType ==
                                              "personal chat"
                                          ? "님이 개인문의를 보냈습니다"
                                          : currentAlarm.alarmType ==
                                                  "first chat"
                                              ? "님이 견적서 응답했습니다"
                                              : currentAlarm.alarmType ==
                                                      "estimated price"
                                                  ? '님이 예상 견적을 보냈습니다'
                                                  : '님이 견적서를 요청했습니다.'),
                                ]),
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(TimeCalculator().getTime(currentAlarm.receptionTime),
                style: const TextStyle(
                  fontSize: 13,
                )),
          ],
        ),
      ),
    );
  }
}

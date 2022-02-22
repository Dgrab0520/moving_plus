import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/alarm_settings_controller.dart';

class MyPageAlarm extends StatelessWidget {
  MyPageAlarm({Key? key}) : super(key: key);

  final alarmSettingsController = Get.put(AlarmSettings());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '알림설정',
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
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('앱푸시',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NanumSquareB',
                        )),
                    FlutterSwitch(
                      activeColor: const Color(0xFF025595),
                      width: 38.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 17.0,
                      value: alarmSettingsController.isPush,
                      onToggle: (val) {
                        alarmSettingsController.isPush = val;
                        alarmSettingsController.setAlarmSetting("isPush", val);
                      },
                    ),
                  ],
                ),
              ),
              alarmSettingsController.isPush
                  ? Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('소식 알리미',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      )),
                                  SizedBox(height: 5),
                                  Text(
                                    '프로모션, 업데이트 등 소식을 받아보세요.',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                activeColor: Color(0xFF025595),
                                width: 38.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 17.0,
                                value: alarmSettingsController.isNotice,
                                onToggle: (val) {
                                  alarmSettingsController.isNotice = val;
                                  alarmSettingsController.setAlarmSetting(
                                      "isNotice", val);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('방해 금지 모드',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      )),
                                  SizedBox(height: 5),
                                  Text(
                                    '특정시간 동안 알림이 울리지 않아요.',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                activeColor: const Color(0xFF025595),
                                width: 38.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 17.0,
                                value: alarmSettingsController.isDisturb,
                                onToggle: (val) {
                                  alarmSettingsController.isDisturb = val;
                                  alarmSettingsController.setAlarmSetting(
                                      "isDisturb", val);
                                },
                              ),
                            ],
                          ),
                        ),
                        alarmSettingsController.isDisturb
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('방해 금지 시간',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'NanumSquareB',
                                        )),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            alarmSettingsController
                                                .selectFromTime(context);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(CupertinoIcons.clock),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(TimeOfDay.now()
                                                  .format(context)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Icon(CupertinoIcons.clock),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(TimeOfDay.now()
                                                  .format(context)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

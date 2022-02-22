import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/alarm_settings_controller.dart';
import 'package:moving_plus/pages/estimate_page.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:moving_plus/pages/request_estimate2.dart';
import 'package:moving_plus/pages/request_form.dart';

const String homeURL = "http://211.110.44.91";

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void onSelectNotification(String? payload) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBoZtVOfbB3tr26NL_CKne4zGexOwpLYaE",
          appId: "1:120006776704:ios:0e2bf2dbca3db9f86c5365",
          messagingSenderId: "120006776704",
          projectId:
              "moving-plus-8223e"), //DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }

  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final alarmSettingsController = Get.put(AlarmSettings());

  @override
  Widget build(BuildContext context) {
    alarmSettingsController.getAlarmSettings();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NanumSquareR',
      ),
      home: Main_Page(
        index: 1,
      ),
      getPages: [
        GetPage(
          name: '/request_estimage/:param',
          page: () => Request_Estimate(),
        ),
        GetPage(
          name: '/request_estimate2/:param',
          page: () => Request_Estimate2(),
        ),
        GetPage(
          name: '/request_form/:param',
          page: () => RequestForm(),
        ),
        GetPage(
          name: '/estimate/:param',
          page: () => Estimate_Page(),
        ),
      ],
    );
  }
}

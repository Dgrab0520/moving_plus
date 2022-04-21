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
  print(Firebase.apps);
  try {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyClCpPqST0evY-ENorxI2T5O0tMeSKGe_w",
            appId: "1:145519627490:ios:eb33c3626f6ba231f1e2bb",
            messagingSenderId: "145519627490",
            projectId:
                "moving-plus-ed05f"), //DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      print("firebase");
      await Firebase.initializeApp(
        name: "androidFirebase",
        options: FirebaseOptions(
            apiKey: "AIzaSyAgx4AKRJsX_oxkRfUgfokD-uPu3mH1FH4",
            appId: "1:145519627490:android:4b415c526e0e7c53f1e2bb",
            messagingSenderId: "145519627490",
            projectId: "moving-plus-ed05f"),
      );
    }
  } catch (e) {
    Firebase.app();
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

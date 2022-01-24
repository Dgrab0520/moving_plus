import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/estimate_page.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:moving_plus/pages/request_estimate2.dart';
import 'package:moving_plus/pages/request_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NanumSquareR',
      ),
      home: Main_Page(index: 1,),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

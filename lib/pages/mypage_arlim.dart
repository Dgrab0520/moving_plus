import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class MyPage_Arlim extends StatefulWidget {
  const MyPage_Arlim({Key? key}) : super(key: key);

  @override
  _MyPage_ArlimState createState() => _MyPage_ArlimState();
}

class _MyPage_ArlimState extends State<MyPage_Arlim> {
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('알림',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15.0,right:15,top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('앱푸시',
                        style:TextStyle(
                          fontSize:15,
                          fontFamily: 'NanumSquareB',
                        )
                      ),
                      FlutterSwitch(
                        activeColor: Color(0xFF025595),
                        width: 38.0,
                        height: 25.0,
                        valueFontSize: 12.0,
                        toggleSize: 17.0,
                        value: status4,
                        onToggle: (val) {
                          setState(() {
                            status4 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15.0,right:15,top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('소식 알리미',
                              style:TextStyle(
                                fontSize:15,
                                fontFamily: 'NanumSquareB',
                              )
                          ),
                          SizedBox(height:5),
                          Text('프로모션, 업데이트 등 소식을 받아보세요.',
                            style:TextStyle(
                              color:Color(0xFF777777),
                              fontSize:12,
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
                        value: status5,
                        onToggle: (val) {
                          setState(() {
                            status5 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15.0,right:15,top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('방해 금지 모드',
                              style:TextStyle(
                                fontSize:15,
                                fontFamily: 'NanumSquareB',
                              )
                          ),
                          SizedBox(height:5),
                          Text('특정시간 동안 알림이 울리지 않아요.',
                            style:TextStyle(
                              color:Color(0xFF777777),
                              fontSize:12,
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
                        value: status6,
                        onToggle: (val) {
                          setState(() {
                            status6 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

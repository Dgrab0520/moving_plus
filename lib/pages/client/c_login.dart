import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../arlim_checkbox.dart';
import '../main_page.dart';
import '../p_signup.dart';

class C_Login extends StatefulWidget {
  const C_Login({Key? key}) : super(key: key);

  @override
  _C_LoginState createState() => _C_LoginState();
}

class _C_LoginState extends State<C_Login> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          )
      ),
      backgroundColor: Colors.white,
      content:Container(
        width:MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child: Container(child: Icon(Icons.close))),
              ],
            ),
            SizedBox(height:10),
            Text('로그인',
              style:TextStyle(
                color:Color(0xFF444444),
                fontSize:23,
                fontFamily: 'NanumSquareB',
              ),
            ),
            SizedBox(height:7),
            Text('로그인 후 입주 플러스를 이용해 주세요.',
              style:TextStyle(
                color:Color(0xFF444444),
                fontSize:12,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height:28),
            Container(
              padding: EdgeInsets.only(left:8,right:8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                   width:MediaQuery.of(context).size.width,
                   height:40,
                   decoration:BoxDecoration(
                     color:Color(0xFFFFD800),
                   ),
                   child: Row(
                     children: [
                       SizedBox(width:15),
                       Container(
                           child: Image.asset("assets/kakao_b.png", width:17, height:17)),
                       SizedBox(width:10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(width:30),
                           Text('카카오로 시작하기',
                              style:TextStyle(
                                color:Color(0xFF3E2723),
                                fontSize: 14,
                                fontFamily: 'NanumSquareR',
                              ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                ],
              ),
            ),

            SizedBox(height:50),

            Container(
              child:
                  InkWell(
                    onTap:(){
                      Get.back();
                      Get.dialog(P_Signup());
                    },
                    child: Container(
                      child: Center(
                        child: Text('파트너로 회원가입하기',
                          style: TextStyle(
                            fontSize:11,
                            fontFamily:'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}

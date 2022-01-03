import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/client/c_login.dart';
import 'package:moving_plus/pages/p_signup.dart';

import 'arlim_checkbox.dart';
import 'main_page.dart';

class P_Login extends StatefulWidget {
  const P_Login({Key? key}) : super(key: key);

  @override
  _P_LoginState createState() => _P_LoginState();
}

class _P_LoginState extends State<P_Login> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                InkWell(
                    onTap:(){
                      Get.back();
                      Get.dialog(C_Login());
                    },
                    child: Container(child: Icon(Icons.arrow_back))),
                InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child: Container(child: Icon(Icons.close))),
              ],
            ),
            SizedBox(height:10),
            Text('파트너 로그인',
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
                  Text('아이디',
                    style:TextStyle(
                      color:Color(0xFF444444),
                      fontSize:12,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  SizedBox(height:7),
                  Container(
                      width:double.infinity,
                      height:45,
                      child: TextField(
                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            fontSize:10,
                          ),
                          hintStyle: TextStyle(
                            fontSize:10,
                          ),
                          hintText: '아이디 이메일을 입력해주세요.',
                          labelStyle: TextStyle(color: Color(0xFFACACAC)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      )
                  ),
                  SizedBox(height:20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('비밀번호',
                        style:TextStyle(
                          color:Color(0xFF444444),
                          fontSize:12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height:7),
                      Container(
                          width:double.infinity,
                          height:45,
                          child: TextField(
                            decoration: InputDecoration(
                              counterStyle: TextStyle(
                                fontSize:10,
                              ),
                              hintStyle: TextStyle(
                                fontSize:10,
                              ),
                              hintText: '비밀번호를 입력해주세요.',
                              labelStyle: TextStyle(color: Color(0xFFACACAC)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          )
                      ),
                    ],
                  ),
                  SizedBox(height:20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('업체명',
                        style:TextStyle(
                          color:Color(0xFF444444),
                          fontSize:12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height:7),
                      Container(
                          width:double.infinity,
                          height:45,
                          child: TextField(
                            decoration: InputDecoration(
                              counterStyle: TextStyle(
                                fontSize:10,
                              ),
                              hintStyle: TextStyle(
                                fontSize:10,
                              ),
                              hintText: '업체명을 입력해주세요.',
                              labelStyle: TextStyle(color: Color(0xFFACACAC)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Arlim_checkbox(),
                    InkWell(
                      onTap:(){},
                      child: Container(
                        child: Text('자동 로그인',
                          style:TextStyle(
                            color:Color(0xFF444444),
                            fontSize:10,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap:(){

                      },
                      child: Container(
                        child: Text('아이디 찾기',
                          style: TextStyle(
                            fontFamily: 'NanumSquareB',
                            fontSize:10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:10),
                    InkWell(
                      onTap:(){

                      },
                      child: Container(
                        child: Text('비밀번호 찾기',
                          style: TextStyle(
                            fontFamily: 'NanumSquareB',
                            fontSize:10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:7),
                  ],
                ),
              ],
            ),
            SizedBox(height:20),
            InkWell(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main_Page()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left:8,right:8),
                width: double.infinity,
                height:50,
                decoration:BoxDecoration(
                  color:Color(0xFF025595),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('로그인',
                    style: TextStyle(
                      fontSize:15,
                      color:Colors.white,
                      fontFamily:'NanumSquareB',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:25),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('아직 임주 플러스 회원이 아니신가요?',
                    style: TextStyle(
                      fontSize:10,
                      fontFamily:'NanumSquareR',
                    ),
                  ),
                  SizedBox(width:10),
                  InkWell(
                    onTap:(){
                      Get.back();
                      Get.dialog(P_Signup());
                    },
                    child: Container(
                      child: Text('회원가입 하기',
                        style: TextStyle(
                          fontSize:10,
                          fontFamily:'NanumSquareB',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/main_page.dart';



class New_Page extends StatefulWidget{
  @override
  _New_PageState createState() => _New_PageState();
}

class _New_PageState extends State<New_Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('회원가입',
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
        child: Container(
          width:MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height:30.0),
              Text('고객 회원가입',
                style:TextStyle(
                  color:Color(0xFF444444),
                  fontSize:23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              SizedBox(height:20.0),
              Text('회원가입 후 입주 플러스를 이용해 주세요.',
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
                            contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
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
                                contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
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
                        Text('비밀번호 확인',
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
                                contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                counterStyle: TextStyle(
                                  fontSize:10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize:10,
                                ),
                                hintText: '비밀번호를 한번 더 입력해주세요.',
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
                                contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
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
              SizedBox(height:30),
              InkWell(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main_Page(index: 1,)),
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
                    child: Text('가입하기',
                      style: TextStyle(
                        fontSize:15,
                        color:Colors.white,
                        fontFamily:'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:30),
            ],
          ),
        ),
      ),
    );
  }
}
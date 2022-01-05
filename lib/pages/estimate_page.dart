import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_estimate.dart';

class Estimate_Page extends StatefulWidget{
  @override
  _Estimate_PageState createState() => _Estimate_PageState();
}

class _Estimate_PageState extends State<Estimate_Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:0,
          title: Text('견적서 작성', style:
          TextStyle(
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
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height*0.97-AppBar().preferredSize.height,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0,),
                  Text('요청서를 보고 예상 견적 비용을 적어주세요', style:
                  TextStyle(
                    color:Colors.black87,
                    fontSize:16,
                    fontFamily: 'NanumSquareB',
                  ),
                  ),
                  SizedBox(height: 15.0,),
                  Text('입력하신 견적 비용은\n고객님에게 채팅으로 전달 됩니다', style:
                  TextStyle(
                    color:Colors.black87,
                    fontSize:15,
                    fontFamily: 'NanumSquareL',
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    width: Get.width*0.6,
                    height: 35.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1.5, color: Color(0xFF025595))
                    ),
                    child: Center(
                      child: Text('총 비용', style:
                      TextStyle(
                        color:Color(0xFF025595),
                        fontSize:18,
                        fontFamily: 'NanumSquareB',
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0,),
                  Container(
                    width: Get.width*0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF025595)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF025595)),
                        ),
                        suffixText: '원  ',
                        suffixStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        ),
                        hintText: '   견적 금액을 입력해주세요',
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.0),
                    width: Get.width*0.71,
                    height: 90.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "견적 정보에 대해 입력해주세요",
                          hintStyle: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black87
                          )
                      ),
                      maxLines: 3,
                      maxLength: 150,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: Get.width,
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF025595),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('견적서 보내기', style:
                          TextStyle(
                            color:Colors.white,
                            fontSize:17,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Get.to(Chat_Estimate());
                          },
                          child: Container(
                            width: 100.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child: Center(
                                child: Text('보내기', style:
                                TextStyle(
                                    color:Color(0xFF025595),
                                    fontSize:16.0,
                                    fontWeight: FontWeight.bold
                                ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_estimate.dart';
import 'p_profile_edit_page.dart';

class P_Detail_Estimate extends StatefulWidget {
  const P_Detail_Estimate({Key? key}) : super(key: key);

  @override
  _P_Detail_EstimateState createState() => _P_Detail_EstimateState();
}

class _P_Detail_EstimateState extends State<P_Detail_Estimate> {
  TextEditingController downController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('김이박',
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
            Container(
              width:Get.width,
              padding: EdgeInsets.only(left:15, right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:30),
                  Text('2021년 12월 16일 목요일',
                    style: TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:30),
                  Container(
                    padding: EdgeInsets.all(15),
                    height:470,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.white,
                        border:Border.all(
                          width:1,
                          color:Color(0xFFcccccc),
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/won_g.png',width:23,height:23),
                            SizedBox(width:7),
                            Text('견적서',
                              style:TextStyle(
                                fontSize:16,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
                        Text('안녕하세요 \n인테리어 작업대 입니다 \n요청 해주신 견적서 보내드립니다.',
                          style:TextStyle(
                            fontSize:12,
                            height:1.5,
                          ),
                        ),
                        SizedBox(height:10),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width:Get.width,
                          height:315,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('서비스',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,

                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          hintText: '인테리어 시공 | 올 인테리어',
                                          hintStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('최종 금액',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      padding: EdgeInsets.only(top:10,left:10,right:10),
                                      height:27,
                                      decoration:BoxDecoration(
                                        color: Color(0xFFeeeeee),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF025595)),
                                          ),

                                          suffixText: '원  ',
                                          suffixStyle: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                          ),
                                          hintText: '최종 금액을 입력해주세요',
                                          hintStyle: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('계약금',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,
                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '5,270,000원',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('작업 기간',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,
                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '2021.12.25~2022.2월 (예정)',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('공간 유형',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,

                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '거주',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('공간 선택',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,
                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '전체 공간',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('지역',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,

                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '서울 양천구',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('예상 견적',
                                        style:TextStyle(
                                          fontSize:14,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex:3,
                                    child: Container(
                                      margin: EdgeInsets.only(right:30),
                                      padding: EdgeInsets.only(right:10, left:10),
                                      height:30,

                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        onChanged: (text){
                                        },
                                        decoration: InputDecoration(
                                          labelText: '5000~6000만원',
                                          labelStyle: TextStyle(
                                            fontSize:12,
                                            color:Colors.black,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:5),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text('*최종 금액의 10%를 계약금으로 받고 있습니다.',
                            style: TextStyle(
                              color:Color(0xFF025595),
                              fontSize:11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20),
                  InkWell(
                    onTap:(){
                      Get.back();
                      Get.to(Chat_Estimate());
                    },
                    child: Container(
                      margin: EdgeInsets.only(left:35, right:35),
                      width:Get.width,
                      height:45,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:Color(0xFF025595),
                      ),
                      child: Center(
                        child: Text('보내기',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

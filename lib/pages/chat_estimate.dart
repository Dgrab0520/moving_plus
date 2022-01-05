import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/estimate_page.dart';

import 'p_detail_estimate.dart';
import 'p_portfolio_page.dart';
import 'p_profile_edit_page.dart';

class Chat_Estimate extends StatefulWidget {
  const Chat_Estimate({Key? key}) : super(key: key);

  @override
  _Chat_EstimateState createState() => _Chat_EstimateState();
}

class _Chat_EstimateState extends State<Chat_Estimate> {
  bool isSelect = false;
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
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
                    Row(
                      children: [
                        Expanded(
                          child:Container(),
                        ),
                        Expanded(
                          flex:3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('오후 4:20',
                                style:TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width:10),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  height:240,
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
                                        height:60,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFD8E3EB),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('서비스',
                                                  style:TextStyle(
                                                    fontSize:13,
                                                  )
                                                ),
                                                Text('인테리어 시공',
                                                    style:TextStyle(
                                                      fontSize:13,
                                                      fontFamily: 'NanumSquareB'
                                                    )
                                                ),
                                              ],
                                            ),
                                            SizedBox(height:10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('예상 금액',
                                                    style:TextStyle(
                                                      fontSize:13,
                                                    )
                                                ),
                                                Text('100,000원~',
                                                    style:TextStyle(
                                                        fontSize:13,
                                                        color:Color(0xFF025595),
                                                        fontFamily: 'NanumSquareB'
                                                    )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:13),
                                      InkWell(
                                        onTap:(){
                                          Get.to(PortfolioEdit_Page());
                                        },
                                        child: Container(
                                          width:Get.width,
                                          height:28,
                                          decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            color:Color(0xFF025595),
                                          ),
                                          child: Center(
                                            child: Text('파트너 프로필 보기',
                                              style:TextStyle(
                                                fontSize:12,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:15,right:15),
            width:Get.width,
            height:60,
            decoration:BoxDecoration(
              color:Colors.white,
              border:Border.all(
                width:1,
                color:Color(0xFFcccccc),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                    onTap:(){
                      setState(() {
                        isSelect = !isSelect;
                      });
                    },
                    child: Icon(Icons.menu,size:25, color:Color(0xFF444444)),
                ),
                SizedBox(width:10),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left:10,bottom:7),
                        height:42,
                        decoration:BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFcccccc),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (text){
                            },
                            decoration: InputDecoration(
                              hintText: '고객이 응답 할 경우 채팅이 활성화 됩니다.',
                              hintStyle: TextStyle(
                                fontSize:12,
                              ),
                              labelStyle: TextStyle(
                                fontSize:12,
                              ),

                                border: InputBorder.none,
                                ),
                          ),
                      ),
                      Positioned(
                          right:3,
                          top:3,
                          child: InkWell(
                              onTap:(){

                              },
                              child: Image.asset('assets/uparrow.png',width:35,height:35)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          isSelect? Container(
            width:Get.width,
            height:150,
            color:Color(0xFFf9f9f9),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:10,left:10,right:10,bottom:3),
                      padding: EdgeInsets.all(6),
                      width:45,
                      height:45,
                      decoration:BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border:Border.all(
                          width:1,
                          color:Color(0xFFcccccc),
                        ),
                      ),
                      child: Image.asset('assets/gg.png'),
                    ),
                    Text('이미지',
                      style:TextStyle(
                        fontSize:11,
                        fontFamily: 'NanumSquareB'
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap:(){
                    Get.to(P_Detail_Estimate());
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:10,left:10,right:10,bottom:3),
                        padding: EdgeInsets.all(8),
                        width:45,
                        height:45,
                        decoration:BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border:Border.all(
                            width:1,
                            color:Color(0xFFcccccc),
                          ),
                        ),
                        child: Image.asset('assets/list.png'),
                      ),
                      Text('견적 신청',
                        style:TextStyle(
                            fontSize:11,
                            fontFamily: 'NanumSquareB'
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ):Container(),
        ],
      ),
    );
  }
}

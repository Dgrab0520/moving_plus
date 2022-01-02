import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_arlim.dart';

class C_ChatList extends StatefulWidget {
  const C_ChatList({Key? key}) : super(key: key);

  @override
  _C_ChatListState createState() => _C_ChatListState();
}

class _C_ChatListState extends State<C_ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left:5,right:5),
                  width:MediaQuery.of(context).size.width,
                  height:58,
                  decoration: BoxDecoration(
                    color:Color(0xFF025595),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Expanded(
                        flex:8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('채팅',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize:17,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),),
                      ),
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.dialog(Main_Arlim());
                            },
                            child: Icon(Icons.notifications,color: Colors.white,size: 22,)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  width:MediaQuery.of(context).size.width,
                  height:96,
                  decoration:BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/chat_banner.png"),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:45),
                      Text('인테리어',
                        style:TextStyle(
                          color:Colors.white,
                          fontSize:16,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                      SizedBox(height:5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('올 인테리어 | 서울',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          Text('2021.12.05',
                            style:TextStyle(
                              color:Colors.white,
                              fontFamily: 'NanumSquareB',
                              fontSize:12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left:15,right:15),
                  width:MediaQuery.of(context).size.width,
                  height:45,
                  decoration:BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFcccccc),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (text){
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Icon(Icons.search))),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left:15,right:15),
                  padding: EdgeInsets.all(10),
                  width:MediaQuery.of(context).size.width,
                  height:145,
                  decoration:BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFcccccc),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/arlim2.png',width:50,height:50),
                          SizedBox(width:10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('인테리어 작업대',
                                      style:TextStyle(
                                        fontSize:15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    Text('어제',
                                      style:TextStyle(
                                        fontSize:12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:5),
                                Text('필름 시공 | 서울 양천구',
                                  style:TextStyle(
                                    fontSize:14,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                      Container(
                        padding: EdgeInsets.only(bottom:10),
                        width:MediaQuery.of(context).size.width,
                        decoration:BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.5, color:Color(0xFFcccccc) ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('안녕하세요! 인테리어 작업대 입니다. 요청해주신 ...',
                              style:TextStyle(
                                fontSize:12,
                              ),
                            ),
                            Container(
                              width:22,
                              height:15,
                              decoration:BoxDecoration(
                                color:Color(0xFF025595),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text('5',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Row(
                              children: [

                                Text('예상 견적 금액 |',
                                  style:TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                                Text('총 200,000~원',
                                  style:TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                    color:Color(0xFF025595),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

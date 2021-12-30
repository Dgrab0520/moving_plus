import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';
import 'main_arlim.dart';

class Receive_Estimate extends StatefulWidget {
  const Receive_Estimate({Key? key}) : super(key: key);

  @override
  _Receive_EstimateState createState() => _Receive_EstimateState();
}

class _Receive_EstimateState extends State<Receive_Estimate> {

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
                          child: Text('받은 견적서',
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
                  height:175,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('인테리어 서비스',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                width:40,
                                height:16,
                                decoration:BoxDecoration(
                                  color:Color(0xFF025595),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text('진행중',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize:10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('2021.12.06',
                            style:TextStyle(
                              fontFamily: 'NanumSquareR',
                              fontSize:11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:2),
                      Row(
                        children: [
                          Text('올 인테리어 | 서울',
                            style:TextStyle(
                              fontSize: 11,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(top:5),
                                child: Image.asset("assets/re_1.png", width:50,height:50)),
                            SizedBox(width:3),
                            Stack(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left:5,top:5),
                                    child: Image.asset('assets/re_2.png',width:50,height:50)),
                                Positioned(
                                    child:
                                    Container(
                                      width:5,
                                      height:5,
                                      decoration: BoxDecoration(
                                        color:Color(0xFF025595),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(''),
                                    ))
                              ],
                            ),
                            SizedBox(width:3),
                            Container(
                                padding: EdgeInsets.only(left:5,top:5),
                                child: Image.asset("assets/re_4.png", width:50,height:50)),
                            SizedBox(width:3),
                            Stack(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left:5,top:5),
                                    child: Image.asset('assets/re_5.png',width:50,height:50)),
                                Positioned(
                                    child:
                                    Container(
                                      width:5,
                                      height:5,
                                      decoration: BoxDecoration(
                                        color:Color(0xFF025595),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(''),
                                    ))
                              ],
                            ),
                            SizedBox(width:3),
                            Container(
                                padding: EdgeInsets.only(left:5,top:5),
                                child: Image.asset("assets/re_6.png", width:50,height:50)),
                            SizedBox(width:3),
                            Container(
                              margin: EdgeInsets.only(left:5,top:5),
                              width:50,
                              height:50,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/re_3.png"),
                                  )
                              ),
                              child: Center(
                                child: Text('+5',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:17,
                                    fontFamily: 'NanumSquareB',
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height:20),
                      InkWell(
                        onTap:(){

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:30,
                          decoration:BoxDecoration(
                            color:Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('받은 견적 보기',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left:15,right:15),
                  padding: EdgeInsets.all(10),
                  width:MediaQuery.of(context).size.width,
                  height:175,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('인테리어 서비스',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                width:40,
                                height:16,
                                decoration:BoxDecoration(
                                  color:Color(0xFF025595),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text('진행중',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize:10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('2021.12.06',
                            style:TextStyle(
                              fontFamily: 'NanumSquareR',
                              fontSize:11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:2),
                      Row(
                        children: [
                          Text('올 인테리어 | 서울',
                            style:TextStyle(
                              fontSize: 11,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top:5),
                              child: Image.asset("assets/re_1.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_2.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_4.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_5.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_6.png", width:50,height:50)),
                          SizedBox(width:3),
                          Container(
                            margin: EdgeInsets.only(left:5,top:5),
                            width:50,
                            height:50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/re_3.png"),
                                )
                            ),
                            child: Center(
                              child: Text('+5',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:17,
                                    fontFamily: 'NanumSquareB',
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                      InkWell(
                        onTap:(){

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:30,
                          decoration:BoxDecoration(
                            color:Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('받은 견적 보기',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left:15,right:15),
                  padding: EdgeInsets.all(10),
                  width:MediaQuery.of(context).size.width,
                  height:175,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('인테리어 서비스',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                width:40,
                                height:16,
                                decoration:BoxDecoration(
                                  color:Color(0xFF025595),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text('진행중',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize:10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('2021.12.06',
                            style:TextStyle(
                              fontFamily: 'NanumSquareR',
                              fontSize:11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:2),
                      Row(
                        children: [
                          Text('올 인테리어 | 서울',
                            style:TextStyle(
                              fontSize: 11,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top:5),
                              child: Image.asset("assets/re_1.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_2.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_4.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_5.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_6.png", width:50,height:50)),
                          SizedBox(width:3),
                          Container(
                            margin: EdgeInsets.only(left:5,top:5),
                            width:50,
                            height:50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/re_3.png"),
                                )
                            ),
                            child: Center(
                              child: Text('+5',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:17,
                                    fontFamily: 'NanumSquareB',
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                      InkWell(
                        onTap:(){

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:30,
                          decoration:BoxDecoration(
                            color:Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('받은 견적 보기',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left:15,right:15),
                  padding: EdgeInsets.all(10),
                  width:MediaQuery.of(context).size.width,
                  height:175,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('인테리어 서비스',
                                style:TextStyle(
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                width:40,
                                height:16,
                                decoration:BoxDecoration(
                                  color:Color(0xFF025595),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text('진행중',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize:10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('2021.12.06',
                            style:TextStyle(
                              fontFamily: 'NanumSquareR',
                              fontSize:11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:2),
                      Row(
                        children: [
                          Text('올 인테리어 | 서울',
                            style:TextStyle(
                              fontSize: 11,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top:5),
                              child: Image.asset("assets/re_1.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_2.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_4.png", width:50,height:50)),
                          SizedBox(width:3),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left:5,top:5),
                                  child: Image.asset('assets/re_5.png',width:50,height:50)),
                              Positioned(
                                  child:
                                  Container(
                                    width:5,
                                    height:5,
                                    decoration: BoxDecoration(
                                      color:Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(''),
                                  ))
                            ],
                          ),
                          SizedBox(width:3),
                          Container(
                              padding: EdgeInsets.only(left:5,top:5),
                              child: Image.asset("assets/re_6.png", width:50,height:50)),
                          SizedBox(width:3),
                          Container(
                            margin: EdgeInsets.only(left:5,top:5),
                            width:50,
                            height:50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/re_3.png"),
                                )
                            ),
                            child: Center(
                              child: Text('+5',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize:17,
                                    fontFamily: 'NanumSquareB',
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                      InkWell(
                        onTap:(){

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:30,
                          decoration:BoxDecoration(
                            color:Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('받은 견적 보기',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

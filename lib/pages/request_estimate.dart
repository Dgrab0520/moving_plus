import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/request_estimate2.dart';
import 'package:progress_indicator/progress_indicator.dart';


class Request_Estimate extends StatefulWidget {
  const Request_Estimate({Key? key}) : super(key: key);

  @override
  _Request_EstimateState createState() => _Request_EstimateState();
}

class _Request_EstimateState extends State<Request_Estimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left:15,right:15,top:20,bottom:20),
              width:Get.width,
              decoration:BoxDecoration(
                border:Border(
                  bottom:BorderSide(width:1, color:Color(0xFFcccccc)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('100% 완료 시 최소 4명 이상의 파트너를 추천 해드립니다.',
                    style:TextStyle(
                      fontFamily: 'NanumSquareR',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height:5),
                  Row(
                    children: [
                      Expanded(
                        flex:9,
                        child: Container(
                          height: 20,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: BarProgress(
                            percentage: 50.0,
                            backColor: Color(0xFFCCCCCC),
                            gradient: LinearGradient(colors: [ Color(0xFF5D91B9), Color(0xFF025595)]),
                            showPercentage: false,
                            stroke: 10,
                            round: true,
                          ),
                        ),
                      ),
                      Expanded(
                        flex:1,
                        child: Container(
                          child: Text('50%',
                            style: TextStyle(
                              color:Color(0xFF025595),
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('공간 유형',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFF025595),
                              ),
                            ),
                            child: Center(
                              child: Text('거주',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                color:Color(0xFFCCCCCC),
                              ),
                            ),
                            child: Center(
                              child: Text('상업',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize:16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('평수 ( 공급면적 )',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '0 평',
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: Container(
                          height:35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Color(0xFF025595),
                          ),
                          child: Center(
                            child: Text('평',
                              style: TextStyle(
                                fontFamily: 'NanumSquareB',
                                fontSize:16,
                                color:Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: Container(
                          height:35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Color(0xFFCCCCCC),
                          ),
                          child: Center(
                            child: Text('㎡',
                              style: TextStyle(
                                fontFamily: 'NanumSquareB',
                                fontSize:16,
                                color:Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height:30),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left:15,right:15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('공간 선택',
                    style:TextStyle(
                      fontSize:14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFFcccccc),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_1.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('주방',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFF025595),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_2.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('욕실',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFFcccccc),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_3.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('거실',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFFcccccc),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_4.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('현관',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFF025595),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_5.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('벽 / 도배',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height:90,
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(
                                width:1,
                                color:Color(0xFFcccccc),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/gong_6.png", width:45 ,height:45),
                                const SizedBox(height:10),
                                const Text('바닥',
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize:12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height:40),
            InkWell(
              onTap: (){
                Get.to(Request_Estimate2());
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  width: 260,
                  height:50,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:Color(0xFF025595),
                  ),
                  child: Center(
                    child: Text('다음 단계',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:100),
          ],
        ),
      ),
    );
  }
}

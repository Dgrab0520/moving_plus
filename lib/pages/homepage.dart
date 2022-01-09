import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/models/pro_model.dart';
import 'package:moving_plus/pages/interior_page.dart';
import 'package:moving_plus/pages/partner_search.dart';
import 'package:moving_plus/pages/partner_sub.dart';
import 'package:moving_plus/pages/partner_sub2.dart';
import 'package:moving_plus/pages/subpage_ex.dart';
import 'package:moving_plus/widgets/carousel_main.dart';
import 'package:moving_plus/widgets/carousel_sub.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Pro> _pro = [];

  getPro(){
    Pro_Data.getPro('pro_id').then((value){
      setState(() {
        _pro = value;
      });
    });
  }


  void initState(){
    super.initState();
    getPro();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(height: 10.0,),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Carousel_Main(),
          ),
          Container(
            color:Colors.white,
            padding: EdgeInsets.only(top:50,left:10.0,right:10),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width:25),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                          Get.to(Interior_Page());
                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon1-1.png", width:40 ,height:40),
                              const SizedBox(height:10),
                              Text('클린',
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
                    SizedBox(width:15),
                    Expanded(
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),  // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon2-1.png", width:40 ,height:40),
                              const SizedBox(height:10),
                              const Text('인테리어',
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
                    SizedBox(width:15),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),  // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon3-1.png",  width:40 ,height:40),
                              const SizedBox(height:10),
                              const Text('홈 스타일링',
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
                    SizedBox(width:25),
                  ],
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width:25),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),  // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon4-1.png", width:40 ,height:40),
                              const SizedBox(height:10),
                              const Text('가전/가구 케어',
                                style: TextStyle(
                                  fontSize:12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:15),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),  // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon5-1.png", width:40 ,height:40),
                              const SizedBox(height:10),
                              const Text('렌탈',
                                style: TextStyle(
                                  fontSize:12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width:15),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:70,
                          height:90,
                          decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),  // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon6-1.png", width:40 ,height:40),
                              const SizedBox(height:10),
                              const Text('기타',
                                style: TextStyle(
                                  fontSize:12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:25),
                  ],
                ),
                SizedBox(height:50),
                Container(

                  padding: EdgeInsets.only(left:10.0,right:10),
                  child: Column(
                    children:  [
                      Row(
                        children: const [
                          Text('자주 찾는 서비스',
                              style:TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize:15,
                              )
                          ),
                          SizedBox(height:30),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                alignment:Alignment.bottomLeft,
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_1.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:70,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#클린 서비스',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment:Alignment.bottomLeft,
                                      margin: EdgeInsets.only(left:3.0,bottom:13),
                                      width:75,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#인테리어 청소',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width:10),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_2.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:80,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#인테리어 서비스',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left:3.0,bottom:13),
                                      width:65,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#올 인테리어',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_3.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:90,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#홈스타일링 서비스',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left:3.0,bottom:13),
                                      width:55,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#정리정돈',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width:10),

                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_4.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:95,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#가전/가구 케어서비스',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left:5.0,bottom:13),
                                      width:55,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#조명설치',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_5.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:65,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#렌탈 서비스',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left:3.0,bottom:13),
                                      width:35,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#TV',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          SizedBox(width:10),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                print('success');
                              },
                              child: Container(
                                width:171,
                                height:120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_6.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:8.0,bottom:13),
                                      width:40,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#기타',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left:5.0,bottom:13),
                                      width:55,
                                      height:15,
                                      decoration:BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#소독/방역',
                                            style:TextStyle(
                                              color:Color(0xFF444444),
                                              fontSize:9,
                                              fontFamily: 'NanumSquareR',
                                            )
                                        ),
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
                SizedBox(height:50),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Carousel_Sub(),
          ),


          Container(
            color:Colors.white,
            padding: EdgeInsets.only(top:50,left:20.0,right:20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text('파트너 추천',
                        style:TextStyle(
                          fontFamily: 'NanumSquareEB',
                          fontSize:15,
                        )
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(Partner_Search());
                      },
                      child: Text('더 보기',
                        style:TextStyle(
                          color:Color(0xFF444444),
                          fontFamily:'NanumSquareR',
                          fontSize:15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:15),
                Partner_Sub(),
                SizedBox(height:15),
                Partner_Sub(),
                SizedBox(height:15),
                Partner_Sub2(),
                SizedBox(height:15),
                Partner_Sub2(),
                SizedBox(height:15),
                Partner_Sub2(),
                SizedBox(height:50),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          //   width:Get.width,
          //   height:250.0,
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
          //   ),
          //
          //   child: Text('사업자 정보'),
          // ),
        ],
      ),
    );
  }
}

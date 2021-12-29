import 'package:flutter/material.dart';
import 'package:moving_plus/partner_sub.dart';
import 'package:moving_plus/partner_sub2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/main_banner.png"),
                )
            ),
            child: Container(
              padding: EdgeInsets.only(top:75.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("쾌적하고 아름다운 공간을 만드는",
                    style:TextStyle(
                      fontFamily: 'NanumSquareR',
                      fontSize:12,
                    ),
                  ),
                  SizedBox(height:5),
                  Text("토탈 홈케어 올인원 서비스",
                    style:TextStyle(
                      fontFamily: 'NanumSquareR',
                      fontSize:12,
                    ),
                  ),
                  SizedBox(height:15),
                  Text("입주 플러스 +",
                    style:TextStyle(
                      fontFamily: 'Jalnan',
                      fontSize:21,
                      color:Color(0xFF025595),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:10.0,right:10),
            child: Column(
              children: [
                SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width:10),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon1-1.png", width:60 ,height:60),
                              const SizedBox(height:10),
                              const Text('클린',
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
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon2-1.png", width:60 ,height:60),
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
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon3-1.png", width:60 ,height:60),
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
                    SizedBox(width:10),
                  ],
                ),
                SizedBox(height:15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width:10),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          print('success');
                        },
                        child: Container(
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon4-1.png", width:60 ,height:60),
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
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon5-1.png", width:60 ,height:60),
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
                          width:105,
                          height:105,
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
                              Image.asset("assets/main_icon6-1.png", width:60 ,height:60),
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
                    SizedBox(width:10),
                  ],
                ),
                SizedBox(height:30),
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
                          SizedBox(height:10),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
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
                          SizedBox(width:10),
                          InkWell(
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
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
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
                          SizedBox(width:10),
                          InkWell(
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
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
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
                          SizedBox(width:10),
                          InkWell(
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
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:30),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 95,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/sub_banner.jpg"),
                )
            ),
          ),

          SizedBox(height:30),

          Container(
            padding: EdgeInsets.only(left:20.0,right:20),
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
                        print('success');
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
                SizedBox(height:10),
                Partner_Sub(),
                SizedBox(height:10),
                Partner_Sub(),
                SizedBox(height:10),
                Partner_Sub2(),
                SizedBox(height:10),
                Partner_Sub2(),
                SizedBox(height:10),
                Partner_Sub2(),
                SizedBox(height:30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

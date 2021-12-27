import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Expanded(child:
                Align(
                  alignment: Alignment.centerLeft,
                    child: Icon(Icons.menu,color:Color(0xFF025595))),),
                Expanded(child: Image.asset("assets/logo_3.jpg",width:65,height:35)),
                Expanded(child:
                  Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            padding: EdgeInsets.only(top:4.0,bottom:4,left:4,right:4),
                            decoration: BoxDecoration(
                              color:Color(0xFF025595),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('파트너 로그인',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize:12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              child: Icon(Icons.notifications,color:Color(0xFF025595))),
                        ),
                      ),
                    ],
                   ),
                ),
              ],
            ),
          ),
        body: ListView(
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
                        SizedBox(width:15),
                        Expanded(
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
                        SizedBox(width:15),
                        Expanded(
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
                        SizedBox(width:15),
                        Expanded(
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
                        const SizedBox(width:15),
                        Expanded(
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
                                Container(
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
                                SizedBox(width:10),
                                Container(
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
                              ],
                            ),
                            Row(
                              children: [
                                Container(
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
                                SizedBox(width:10),
                                Container(
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
                              ],
                            ),
                            Row(
                              children: [
                                Container(
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
                                SizedBox(width:10),
                                Container(
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
                    children: const [
                      Text('파트너 추천',
                          style:TextStyle(
                            fontFamily: 'NanumSquareEB',
                            fontSize:15,
                          )
                      ),
                      Text('더 보기',
                        style:TextStyle(
                          color:Color(0xFF444444),
                          fontFamily:'NanumSquareR',
                          fontSize:15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),

                  Container(
                    padding: EdgeInsets.only(left:10,right:10),
                    width:double.infinity,
                    height:100,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/p_img-1.png", width:60,height:60),
                        SizedBox(width:10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('인테리어 작업대',
                                  style:TextStyle(
                                    color:Color(0xFF444444),
                                    fontFamily: 'NanumSquareEB',
                                    fontSize:14,
                                  ),
                                ),
                                SizedBox(width:5),
                                Container(
                                  width:30,
                                  height:15,
                                  decoration:BoxDecoration(
                                    color:Color(0xFF025595),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text('인기',
                                      style:TextStyle(
                                        color:Colors.white,
                                        fontSize:10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text('총 공사 20건',
                                      style:TextStyle(
                                       fontSize:12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width:20),
                                Row(
                                  children: [
                                    Image.asset("assets/star1.png",width:13,height:13),
                                    Text('4.7',
                                      style:TextStyle(
                                        fontSize:12,
                                      )
                                    ),
                                    Text('(10개)',
                                      style:TextStyle(
                                        fontSize:8,
                                      )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:10),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left:7,right:7),
                                  height:17,
                                  decoration:BoxDecoration(
                                    color:Color(0xFF444444),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text('인테리어 서비스',
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontSize:7,
                                          fontFamily: 'NanumSquareR',
                                        )
                                    ),
                                  ),
                                ),

                                SizedBox(width:3),

                                Container(
                                  padding: EdgeInsets.only(left:7,right:7),
                                  height:17,
                                  decoration:BoxDecoration(
                                    color:Color(0xFF444444),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text('카드결제',
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontSize:7,
                                          fontFamily: 'NanumSquareR',
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(width:3),
                                Container(
                                  padding: EdgeInsets.only(left:7,right:7),
                                  height:17,
                                  decoration:BoxDecoration(
                                    color:Color(0xFF444444),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text('일반도면',
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontSize:7,
                                          fontFamily: 'NanumSquareR',
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(width:3),
                                Container(
                                  padding: EdgeInsets.only(left:7,right:7),
                                  height:17,
                                  decoration:BoxDecoration(
                                    color:Color(0xFF444444),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text('보증보험',
                                        style:TextStyle(
                                          color:Colors.white,
                                          fontSize:7,
                                          fontFamily: 'NanumSquareR',
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Image.asset("assets/p_img2-1.png")
                      ],
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

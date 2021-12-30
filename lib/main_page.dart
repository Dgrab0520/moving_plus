import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/c_mypage.dart';
import 'package:moving_plus/main_arlim.dart';
import 'package:moving_plus/p_login.dart';
import 'package:moving_plus/partner_search.dart';
import 'package:moving_plus/receive_estimate.dart';
import 'homepage.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  bool _isChecked = false;
  int _selectedIndex = 1;
  DateTime currentBackPressTime = DateTime.now();

  void moveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _widgetOptions = [
      Container(),
      HomePage(),
      Container(),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF025595)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/logo_3.jpg",width:65,height:35),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Get.dialog(P_Login()
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:15.0,bottom:15,left:2,right:5),
              padding: EdgeInsets.only(left:10.0,right:10),
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
          InkWell(
            onTap:(){
              Get.dialog(Main_Arlim());
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  child: Icon(Icons.notifications,color:Color(0xFF025595), size:22)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color:Color(0xFF025595),
              height:150,
              child: DrawerHeader(
                child: Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: Image.asset("assets/avatar_c.png",width:70,height:70)),
                    SizedBox(width:10),
                    Expanded(
                      flex:4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('김이박',
                            style:TextStyle(
                              fontSize:15,
                              color:Colors.white,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          SizedBox(height:5),
                          Row(
                            children: [
                              Text('kep123@naver.com',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  )
                              ),
                              SizedBox(width:7),
                              Image.asset("assets/kakao_w.png", width:13,height:13),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex:1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap:(){
                                  Navigator.pop(context);
                                  print('ss');
                                },
                                child: Container(child: Image.asset("assets/close.png"))),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.dialog(Receive_Estimate());
              },
              child: Container(
                padding: EdgeInsets.only(top:25,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/list_g.png",width:18,height:18),
                    SizedBox(width:15),
                    Text('받은 견적서',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.only(top:10,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/chat_g.png",width:18,height:18),
                    // Icon(Icons.speaker_notes_rounded,
                    //   color: Color(0xFf444444),
                    // ),
                    SizedBox(width:15),
                    Text('채팅',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                    SizedBox(width:5),
                    Container(
                      width:20,
                      height:15,
                      decoration:BoxDecoration(
                        color:Color(0xFF025595),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Text('5',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize:12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.dialog(Partner_Search());
              },
              child: Container(
                padding: EdgeInsets.only(top:10,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/search_g"".png",width:18,height:18),
                    SizedBox(width:15),
                    Text('파트너 찾기',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.dialog(C_Mypage());
              },
              child: Container(
                padding: EdgeInsets.only(top:10,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/user_g.png",width:18,height:18),
                    SizedBox(width:14),
                    Text('마이페이지',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( // POINT
                    color: Color(0xFFf1f1f1),
                    width: 3.0,
                  ),
                ),
              ),
            ),
            SizedBox(height:5),
            InkWell(
              onTap: (){
                print('ss');
              },
              child: Container(
                padding: EdgeInsets.only(top:10,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/setting_g.png",width:18,height:18),
                    SizedBox(width:15),
                    Text('설정',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print('ss');
              },
              child: Container(
                padding: EdgeInsets.only(top:10,left:25.0,bottom:15),
                child: Row(
                  children: [
                    Image.asset("assets/logout-(1)_g@2x.png",width:18,height:18),
                    SizedBox(width:15),
                    Text('로그아웃',
                        style:TextStyle(
                          fontFamily: 'NanumSquareB',
                          fontSize:14,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF025595),
          unselectedFontSize: 12,
          currentIndex: _selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              title: Text('견적신청',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 11,
                ),
              ),
              icon: new Image.asset(
                "assets/notice.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/notice.png",
                width: 22,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('홈',
                  style:TextStyle(
                    color:Colors.white,
                    fontSize:11,
                  )
              ),
              icon: new Image.asset(
                "assets/home.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/home.png",
                width: 22,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('채팅',
                  style:TextStyle(
                    color:Colors.white,
                    fontSize:11,
                  )
              ),
              icon: new Image.asset(
                "assets/chat.png",
                width: 22,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/chat.png",
                width: 22,
                height: 20,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF616CA1),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

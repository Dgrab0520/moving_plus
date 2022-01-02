import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/pages/partner_sub.dart';
import 'package:moving_plus/pages/partner_sub2.dart';


import 'api.dart';
import 'homepage.dart';
import 'main_arlim.dart';
import 'p_login.dart';

class Interior_Page extends StatefulWidget {
  const Interior_Page({Key? key}) : super(key: key);

  @override
  _Interior_PageState createState() => _Interior_PageState();
}

class _Interior_PageState extends State<Interior_Page> with SingleTickerProviderStateMixin {
  final Api api = Api();
  List<Category> categories = [];

  late TabController _tabController;

  fetchAllCategories() {
    // _tabController?.dispose();
    api.getCategories().then((value) {
      setState(() {
        categories.addAll(value);
        _tabController = TabController(length: value.length, vsync: this);
      });
    });
  }

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
          Container(
            padding: EdgeInsets.only(left:15,right:15),
            child: InkWell(
              onTap:(){
                Get.dialog(Main_Arlim());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child: Icon(Icons.notifications,color:Color(0xFF025595), size:22)),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/chat_banner.png'),
            DefaultTabController(
              length: 6,
              child: TabBar(
                  labelPadding: EdgeInsets.only(left:11, right:11, top:3, bottom:3),
                isScrollable: true,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize:12,
                ),
                indicatorColor: Color(0xFF025595),
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      text: "클린",
                    ),
                    Tab(
                      text: "인테리어",
                    ),
                    Tab(
                      text: "홈 스타일링",
                    ),
                    Tab(
                      text: "가전/가구 케어",
                    ),
                    Tab(
                      text: "렌탈",
                    ),
                    Tab(
                      text: "기타",
                    ),

              ]),
            ),
            SizedBox(height:15),

            Container(
              child: Column(
                children: [
                  Text('인테리어 서비스',
                    style:TextStyle(
                      fontSize:18,
                      fontFamily:'NanumSquareB',
                    ),
                  ),
                  SizedBox(height:7),
                  Text('건축물의 구조 및 시설의 개/보수 및 변경 서비스',
                    style:TextStyle(
                      fontSize:11,
                      fontFamily:'NanumSquareR',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:10),
            Container(
              padding: EdgeInsets.only(left:15,right:15,),
              child: Column(
               children: [
                 Container(
                     width:MediaQuery.of(context).size.width,
                     height:120,
                     child: Image.asset('assets/sub2_2_img1.jpg', fit: BoxFit.cover,
                   )
                 ),
                 SizedBox(height:10),

               ],
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
    );
  }
}

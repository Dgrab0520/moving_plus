import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/customer_data.dart';
import 'package:moving_plus/models/customer_model.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/pages/receive_estimate.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:moving_plus/widgets/c_login.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import 'api.dart';
import 'homepage.dart';
import 'main_arlim.dart';
import 'main_page.dart';


final controller = Get.put(ReactiveController());

class Interior_Page extends StatefulWidget {
  const Interior_Page({Key? key, required this.Categorytitle}) : super(key: key);
  final int Categorytitle;

  @override
  _Interior_PageState createState() => _Interior_PageState();
}

class _Interior_PageState extends State<Interior_Page>

    with SingleTickerProviderStateMixin {

  final Api api = Api();
  List<Category> categories = [];

  late TabController _tabController;

  fetchAllCategories() {
    // _tabController?.dispose();
    api.getCategories().then((value) {
      setState(() {
        categories.addAll(value);
        _tabController = TabController(length: value.length, vsync: this, initialIndex:widget.Categorytitle);
      });
    });
  }

  int _selectedIndex = 1;
  DateTime currentBackPressTime = DateTime.now();

  List<String> img = [];
  List<String> title = [];
  List<String> content = [];

  void moveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [];

  bool isLoading = false;



  @override
  void initState() {
    _widgetOptions = [
      Request_Estimate(),
      HomePage(),
      Receive_Estimate(isMain: true,),
    ];
    api.getCategories().then((value) {
      categories.addAll(value);
      _tabController = TabController(
        length: value.length,
        vsync: this,
      );
      isLoading = true;
      setState(() {
        VerticalScrollableTabBarStatus.setIndex(widget.Categorytitle);
        _tabController.animateTo(widget.Categorytitle);
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF025595)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/logo_3.jpg", width: 65, height: 35),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){Get.offAll(Main_Page(index: 1));},
            icon: Icon(Icons.arrow_back,color: Color(0xFF025595),)
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () {
                Get.to(Main_Arlim());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child: Icon(Icons.notifications,
                        color: Color(0xFF025595), size: 22)),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: isLoading ? Column(
        children: [
          Image.asset('assets/chat_banner.png'),
          TabBar(
              onTap: (index) {
                VerticalScrollableTabBarStatus.setIndex(index);
              },
              controller: _tabController,
              labelPadding:
              EdgeInsets.only(left: 11, right: 11, top: 3, bottom: 0),
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 12,
              ),
              unselectedLabelColor: Colors.black,
              indicatorColor: Color(0xFF025595),
              indicatorWeight: 4,
              tabs: [
                for (Category category in categories) Tab(text: category.name)
              ]),
          SizedBox(height: 25),
          Expanded(
            child: _tabController == null
                ? const Center(child: CircularProgressIndicator())
                : VerticalScrollableTabView(
              tabController: _tabController,
              listItemData: categories,
              verticalScrollPosition: VerticalScrollPosition.begin,
              //Change this to your preferred scroll direction
              scrollDirection: Axis.vertical,
              eachItemChild: (object, Category) =>
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,),
                    child: TabView(
                      category: object,
                    ),
                  ),

            ),
          ),
        ],
      ) : CircularProgressIndicator(),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF025595),
          unselectedFontSize: 12,
          currentIndex: _selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            Get.off(Main_Page(index: index,));
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                '견적신청',
                style: TextStyle(
                  color: Colors.white,
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  )),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  )),
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

class TabView extends StatefulWidget {
  const TabView({
    Key? key, required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  void initState() {
    print('dsa${widget.category.name}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          child: Column(
            children: [
              Text(
                widget.category.name + " 서비스",
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.category.description,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        for (CategorySub category in widget.category.sub)
          Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child:
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          if(controller.pro.value.type == 'cus'){
                            Get.toNamed('/request_estimage/true?serviceType=${category.title}');
                          }else if(controller.pro.value.type == 'None'){
                            Get.dialog(C_Login(index: 1,));
                          }else{
                            Get.snackbar('견적신청 실패', '고객으로 로그인 후 이용해주세요', backgroundColor: Colors.white);
                          }

                        },
                        child: category.image == '' ? Container() : Container(
                          margin: EdgeInsets.only(left: 5.0, right: 15.0),
                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
                          height: 120.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  category.image,
                                ),
                                fit: BoxFit.fill,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            height: 50.0,
                            color: Colors.black87.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                category.title,
                                style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize: 15,
                                    color: Colors.white
                                ),
                              ),
                            ),


                          ),
                        )

                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          if(controller.pro.value.type == 'cus'){
                            Get.toNamed('/request_estimage/true?serviceType=${category.title2}');
                          }else if(controller.pro.value.type == 'None'){
                            Get.dialog(C_Login(index: 1,));
                          }else{
                            Get.snackbar('견적신청 실패', '고객으로 로그인 후 이용해주세요', backgroundColor: Colors.white);
                          }

                        },
                        child: category.image2 == '' ? Container() : Container(
                          margin: EdgeInsets.only(left: 5.0, right: 15.0),
                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
                          height: 120.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  category.image2,
                                ),
                                fit: BoxFit.fill,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            height: 50.0,
                            color: Colors.black87.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                category.title2,
                                style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                    fontSize: 15,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              )
          ),
        // for (int i = 0; i < 20; i++)
        //   ListTile(
        //     title: Text('Product title $i'),
        //   )
      ],
    );
  }
}
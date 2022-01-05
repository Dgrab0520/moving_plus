import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import 'api.dart';
import 'homepage.dart';
import 'main_arlim.dart';

class Interior_Page extends StatefulWidget {
  const Interior_Page({Key? key}) : super(key: key);

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
        _tabController = TabController(length: value.length, vsync: this);
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

  @override
  void initState() {
    _widgetOptions = [
      Container(),
      HomePage(),
      Container(),
    ];
    fetchAllCategories();
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
        actions: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () {
                Get.dialog(Main_Arlim());
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
      body: Column(
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
                verticalScrollPosition: VerticalScrollPosition.middle,
                //Change this to your preferred scroll direction
                scrollDirection: Axis.vertical,
                eachItemChild: (object, index) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: TabView(
                        category: object,
                      ),
                    )),
          ),
        ],
      ),
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
            setState(() {
              _selectedIndex = index;
            });
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
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final Api api = Api();
  final List<CategorySub> _category = [];
  ScrollController scrollController = ScrollController();
  bool isend = false;

  fetchProducts(String category) {
    api.getProductsByCategory(category).then((value) {
      setState(() {
        _category.addAll(value);
      });
    });
  }

  @override
  void initState() {
    fetchProducts(widget.category.name);
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isend = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      shrinkWrap: true,
      physics: isend ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
      children: [
        SizedBox(height: 30),
        Container(
          child: Column(
            children: [
              Text(
                widget.category.name+" 서비스",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              SizedBox(height: 7),
              Text(
                widget.category.description,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'NanumSquareR',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        for (CategorySub category in _category)
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Color(0xFFcccccc),
                ),
              ),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Image.asset(
                        category.image,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 10),
                  Text(
                    category.title,
                    style: TextStyle(
                      fontFamily: 'NanumSquareB',
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    category.content,
                    style: TextStyle(
                      fontSize: 11,
                      height:1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        // for (int i = 0; i < 20; i++)
        //   ListTile(
        //     title: Text('Product title $i'),
        //   )
      ],
    );
  }
}

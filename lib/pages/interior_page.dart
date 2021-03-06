import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/models/customer_model.dart';
import 'package:moving_plus/widgets/c_login.dart';
import 'package:moving_plus/widgets/p_login.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

import 'api.dart';
import 'main_arlim.dart';
import 'main_page.dart';

final controller = Get.put(ReactiveController());

class Interior_Page extends StatefulWidget {
  const Interior_Page({Key? key, required this.categoryTitle})
      : super(key: key);
  final int categoryTitle;

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
        _tabController = TabController(
            length: value.length,
            vsync: this,
            initialIndex: widget.categoryTitle);
      });
    });
  }

  DateTime currentBackPressTime = DateTime.now();

  List<String> img = [];
  List<String> title = [];
  List<String> content = [];
  List<Customer> customer = [];
  bool isLoading2 = false;

  bool isLoading = false;

  @override
  void initState() {
    api.getCategories().then((value) {
      categories.addAll(value);
      _tabController = TabController(
        length: value.length,
        vsync: this,
      );
      isLoading = true;
      setState(() {
        if (widget.categoryTitle != 0) {
          VerticalScrollableTabBarStatus.setIndex(widget.categoryTitle);
          _tabController.animateTo(widget.categoryTitle);
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF025595)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/logo_3.jpg", width: 65, height: 35),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(const Main_Page(index: 1));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF025595),
            )),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () {
                Get.to(() => MainAlarm());
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.notifications,
                    color: Color(0xFF025595), size: 22),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? Column(
              children: [
                Image.asset('assets/chat_banner.png'),
                TabBar(
                    onTap: (index) {
                      VerticalScrollableTabBarStatus.setIndex(index);
                    },
                    controller: _tabController,
                    labelPadding: const EdgeInsets.only(
                        left: 11, right: 11, top: 3, bottom: 0),
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    unselectedLabelColor: Colors.black,
                    indicatorColor: const Color(0xFF025595),
                    indicatorWeight: 4,
                    tabs: [
                      for (Category category in categories)
                        Tab(text: category.name)
                    ]),
                const SizedBox(height: 25),
                Expanded(
                  child: _tabController == null
                      ? const Center(child: CircularProgressIndicator())
                      : VerticalScrollableTabView(
                          tabController: _tabController,
                          listItemData: categories,
                          verticalScrollPosition: VerticalScrollPosition.begin,
                          //Change this to your preferred scroll direction
                          scrollDirection: Axis.vertical,
                          eachItemChild: (object, Category) => Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: TabView(
                              category: object,
                            ),
                          ),
                        ),
                ),
              ],
            )
          : const CircularProgressIndicator(),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF025595),
          unselectedFontSize: 12,
          currentIndex: 1, //?????? ????????? Index
          onTap: (int index) {
            if (index == 2 && controller.pro.value.pro_id == "None") {
              Get.dialog(const P_Login());
            } else if (index == 0) {
            } else {
              Get.offAll(Main_Page(
                index: index,
              ));
            }
          },
          selectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              label: '????????????',
              icon: Image.asset(
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
              label: '???',
              icon: Image.asset(
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
              label: '??????',
              icon: Image.asset(
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
  @override
  void initState() {
    print('dsa${widget.category.name}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Column(
          children: [
            Text(
              widget.category.name + " ?????????",
              style: const TextStyle(
                fontSize: 23,
                fontFamily: 'NanumSquareB',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.category.description,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'NanumSquareR',
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        for (CategorySub category in widget.category.sub)
          Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          if (controller.pro.value.type == 'cus') {
                            Get.toNamed(
                                '/request_estimage/true?serviceType=${category.title}');
                          } else if (controller.pro.value.type == 'None') {
                            Get.dialog(const C_Login(
                              index: 1,
                            ));
                          } else {
                            Get.snackbar('???????????? ??????', '???????????? ????????? ??? ??????????????????',
                                backgroundColor: Colors.white);
                          }
                        },
                        child: category.image == ''
                            ? Container()
                            : Container(
                                margin: const EdgeInsets.only(
                                    left: 5.0, right: 15.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 25.0),
                                height: 120.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    category.image,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  height: 50.0,
                                  color: Colors.black87.withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      category.title,
                                      style: const TextStyle(
                                          fontFamily: 'NanumSquareB',
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          if (controller.pro.value.type == 'cus') {
                            Get.toNamed(
                                '/request_estimage/true?serviceType=${category.title2}');
                          } else if (controller.pro.value.type == 'None') {
                            Get.dialog(const C_Login(
                              index: 1,
                            ));
                          } else {
                            Get.snackbar('???????????? ??????', '???????????? ????????? ??? ??????????????????',
                                backgroundColor: Colors.white);
                          }
                        },
                        child: category.image2 == ''
                            ? Container()
                            : Container(
                                margin: const EdgeInsets.only(
                                    left: 5.0, right: 15.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 25.0),
                                height: 120.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    category.image2,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  height: 50.0,
                                  color: Colors.black87.withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      category.title2,
                                      style: const TextStyle(
                                          fontFamily: 'NanumSquareB',
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                  ),
                ],
              )),
      ],
    );
  }
}

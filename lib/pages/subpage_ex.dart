
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import 'api.dart';
import 'main_arlim.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Api api = Api();
  List<Category> categories = [];

  TabController? _tabController;

  fetchAllCategories() {
    // _tabController?.dispose();
    api.getCategories().then((value) {
      setState(() {
        categories.addAll(value);
        _tabController = TabController(length: value.length, vsync: this);
      });
    });
  }

  @override
  void initState() {
    fetchAllCategories();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
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
        bottom: _tabController == null
            ? null
            : TabBar(
          controller: _tabController,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: [
            for (Category category in categories) Tab(text: category.name)
          ],
        ),
      ),
      body: _tabController == null
          ? Center(child: CircularProgressIndicator())
          : VerticalTabBarView(
        controller: _tabController,
        children: [
          for (Category category in categories)
            TabView(category: category)
        ],
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

  }

  @override
  void initState() {
    fetchProducts(widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.category.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
          ),
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
          // for (int i = 0; i < 20; i++)
          //   ListTile(
          //     title: Text('Product title $i'),
          //   )
        ],
      ),
    );
  }
}
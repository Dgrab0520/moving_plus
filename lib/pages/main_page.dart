import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/pages/c_chatlist.dart';
import 'package:moving_plus/pages/c_mypage.dart';
import 'package:moving_plus/pages/c_partner_info.dart';
import 'package:moving_plus/pages/main_arlim.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/widgets/p_login.dart';
import 'package:moving_plus/pages/p_mypage.dart';
import 'package:moving_plus/pages/partner_search_page.dart';
import 'package:moving_plus/pages/receive_estimate.dart';
import 'package:moving_plus/pages/request_estimate.dart';
import 'package:moving_plus/pages/request_received..dart';
import 'homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final controller = Get.put(ReactiveController());

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  bool _isChecked = false;
  int _selectedIndex = 1;
  static final storage = FlutterSecureStorage();
  DateTime currentBackPressTime = DateTime.now();

  void moveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _selectedIndex = widget.index;
    _widgetOptions = [
      Request_Estimate(),
      HomePage(),
      Receive_Estimate(isMain: true,),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1 ? AppBar(
        iconTheme: IconThemeData(color: Color(0xFF025595)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/logo_3.jpg",width:65,height:35),
        centerTitle: true,
        actions: [
          controller.pro.value.type == 'None' ?
          InkWell(
            onTap: (){
              Get.dialog(P_Login()
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:15.0,bottom:15,left:2,right:5),
              padding: EdgeInsets.only(left:20.0,right:20.0),
              decoration: BoxDecoration(
                color:Color(0xFF025595),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('로그인',
                style: TextStyle(
                  color:Colors.white,
                  fontSize:11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
              :
          InkWell(
            onTap: (){
              storage.delete(key: "login");
              setState(() {
                controller.change(
                  type: 'None',
                  pro_id: 'None',
                  pro_name: 'None',
                  pro_phone: 'None',
                  pro_email: 'None',
                  com_name: 'None',
                  profile_img: 'None',
                  pro_token: 'None',
                );
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:15.0,bottom:15,left:2,right:5),
              padding: EdgeInsets.only(left:20.0,right:20.0),
              decoration: BoxDecoration(
                color:Color(0xFF025595),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('로그아웃',
                style: TextStyle(
                  color:Colors.white,
                  fontSize:11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),


          SizedBox(width:8),

          Container(
            padding: EdgeInsets.only(right:15),
            child: InkWell(
              onTap:(){
                Get.to(Main_Arlim());
              },
              child: Container(
                  child: Icon(Icons.notifications,color:Color(0xFF025595), size:22)),
            ),
          ),
        ],
      ) : _selectedIndex == 0 ? AppBar(
        elevation: 0,
        title: Text('견적 신청',
          style: TextStyle(
            color:Colors.white,
            fontSize:17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF025595),
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)
        ),
      ):null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              width:Get.width,
              color:Color(0xFF025595),
              height:150,
              child: DrawerHeader(
                child: controller.pro.value.type == 'None'
                    ?
                Container(
                  child: Center(
                    child: Text('로그인 후 이용해주세요', style:
                      TextStyle(
                        color:Colors.white,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                )
                    :
                Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: controller.pro.value.type == 'cus'
                            ?
                        controller.pro.value.profile_img == 'default_image'
                            ?
                        Image.asset('assets/defaultImage.png', width:70,height:70)
                            :
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(controller.pro.value.profile_img,),
                              fit: BoxFit.fill,
                            )
                          ),
                        )
                        // Image.network(controller.pro.value.profile_img, width:70,height:70)
                            :
                        Image.network("http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}",width:70,height:70)),


                    SizedBox(width:10),
                    Expanded(
                      flex:5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.pro.value.type == 'cus' ? controller.pro.value.pro_name : controller.pro.value.com_name,
                            style:TextStyle(
                              fontSize:14,
                              color:Colors.white,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          SizedBox(height:5),

                          Row(
                            children: [
                              Text(controller.pro.value.pro_id,
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  )
                              ),
                              SizedBox(width:7),
                              Image.asset("assets/i_partner.png", width:13,height:13),
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
                )
              ),
            ),


            controller.pro.value.type == 'None'
                ?
            GestureDetector(
              onTap: (){
                print('로그인');
                Get.dialog(P_Login());

              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 80.0),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(width: 1.0, color: Color(0xFF025595))
                ),
                child: Center(
                  child: Text('로그인', style:
                  TextStyle(
                    color:Colors.black,
                    fontFamily: 'NanumSquareB',
                  ),
                  ),
                ),
              ),
            )
                :
            Column(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Get.to(Request_Received());
                  },
                  child: Container(
                    padding: EdgeInsets.only(top:25,left:25.0,bottom:15),
                    child: Row(
                      children: [
                        Image.asset("assets/list_g.png",width:18,height:18),
                        SizedBox(width:15),
                        Text('받은 요청서',
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
                    Get.to(Receive_Estimate(isMain: false,));
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
                    Get.to(P_Mypage());
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
              ],
            ),



            Divider(
              thickness: 3.0,
              height: 1.0,
              color: Color(0xFFf1f1f1),
            ),
            SizedBox(height:10.0),


            controller.pro.value.type == 'None'
                ?
            Container()
                :
            InkWell(
              onTap: (){
                print('로그아웃');
                setState(() {
                  controller.change(
                    type: 'None',
                    pro_id: 'None',
                    pro_name: 'None',
                    pro_phone: 'None',
                    pro_email: 'None',
                    com_name: 'None',
                    profile_img: 'None',
                    pro_token: 'None',
                  );
                });
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
          unselectedFontSize: 11,
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

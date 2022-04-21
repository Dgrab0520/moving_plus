import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/controllers/alarm_settings_controller.dart';
import 'package:moving_plus/controllers/main_alarm_controller.dart';
import 'package:moving_plus/datas/alarm_data.dart';
import 'package:moving_plus/datas/banner_data.dart';
import 'package:moving_plus/datas/popular_data.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/datas/pro_login_data.dart';
import 'package:moving_plus/models/pro_login_model.dart';
import 'package:moving_plus/pages/c_mypage.dart';
import 'package:moving_plus/pages/main_arlim.dart';
import 'package:moving_plus/pages/p_chat.dart';
import 'package:moving_plus/pages/p_mypage.dart';
import 'package:moving_plus/pages/receive_estimate.dart';
import 'package:moving_plus/pages/request_received..dart';
import 'package:moving_plus/widgets/c_login.dart';

import 'homepage.dart';
import 'interior_page.dart';

final controller = Get.put(ReactiveController());
// Notification Channel을 디바이스에 생성
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> backgroundHandler(RemoteMessage message) async {
  final alarmSettingController = Get.put(AlarmSettings());
  await alarmSettingController.getAlarmSettings();
  print(alarmSettingController.isPush);

  if (alarmSettingController.isPush) {
    var format = DateFormat("HH:mm");
    var from = format.parse(
        "${alarmSettingController.selectedTimeFrom.hour}:${alarmSettingController.selectedTimeFrom.minute}");
    var to = format.parse(
        "${alarmSettingController.selectedTimeTo.hour}:${alarmSettingController.selectedTimeTo.minute}");
    var now = format.parse("${DateTime.now().hour}:${DateTime.now().minute}");

    if ((!alarmSettingController.isDisturb) ||
        (alarmSettingController.isDisturb &&
            !(now.isAfter(from) && now.isBefore(to)))) {
      flutterLocalNotificationsPlugin.show(
        0,
        message.data['title'],
        message.data['body'],
        const NotificationDetails(
          android: AndroidNotificationDetails('새로운 메세지', '새로운 메세지가 도착했습니다',
              priority: Priority.high, importance: Importance.max),
        ),
      );
    }
  }
}

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  bool _isChecked = false;
  int _selectedIndex = 1;
  String? user_id;
  String? profile_image = 'None';

  static const storage = FlutterSecureStorage();
  DateTime currentBackPressTime = DateTime.now();

  void moveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [];

  _initTexts() async {
    final User user = await UserApi.instance.me();
    setState(() {
      user_id = user.kakaoAccount!.email!;
      profile_image = user.kakaoAccount!.profile!.profileImageUrl!;
    });
  }

  final bannerController = Get.put(Banner_Data());
  final proController = Get.put(Pro_Data());
  final mainController = Get.put(MainController());
  final popularController = Get.put(PopularData());

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    String? value = await storage.read(key: "login");
    print('proInfo?? $value');

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (value != null) {
      print(value.split(" ")[1] + value.split(" ")[3]);
      List<Pro_Info> pro_info = [];
      Pro_Login_Data.getPro_Login(value.split(" ")[1], value.split(" ")[3])
          .then((value) {
        setState(() {
          pro_info = value;
        });
        if (value.length == 1) {
          setState(() {
            AlarmData().alarmCount(pro_info[0].pro_id);
            FirebaseMessaging.instance.getToken().then((value) =>
                Pro_Data.updateToken_Pro(pro_info[0].pro_id, value!)
                    .then((value) {
                  if (value == 'success') {
                    print('update token success');
                  } else {
                    print('update token fail');
                  }
                }));
          });
          controller.change(
            type: 'pro',
            id: pro_info[0].id,
            pro_id: pro_info[0].pro_id,
            pro_pw: pro_info[0].pro_pw,
            pro_name: pro_info[0].pro_name,
            pro_phone: pro_info[0].pro_phone,
            pro_email: pro_info[0].pro_email,
            com_name: pro_info[0].com_name,
            profile_img: pro_info[0].profile_img,
            pro_token: pro_info[0].pro_token,
            recom: pro_info[0].pro_recom,
          );
          setState(() {});
        } else {
          Get.snackbar("로그인 실패", "아이디 또는 비밀번호가 틀렸습니다",
              backgroundColor: Colors.white, colorText: Colors.black);
        }
      });
    } else {
      print('false & Again');
    }
  }

  channelInit() async {
    // Android용 새 Notification Channel
    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      'Moving Plus Notification', // 임의의 id
      '입주플러스', // 설정에 보일 채널명
      description: '입주플러스의 Notification 채널', // 설정에 보일 채널 설명
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  firebaseSetting() async {
    //region

    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.instance.getToken().then((value) => print(value));
//firebase message 초기화

    FirebaseMessaging.onMessage.listen((message) {
      print(message.data['title']);
      if (_selectedIndex == 1) {
        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }
        if (message.data['title'] == "Alarm") {
          setState(() {
            mainController.isAlarm = true;
          });
          Get.snackbar("알림", "알림이 도착했습니다");
        } else {
          if (_selectedIndex != 2) {
            setState(() {
              mainController.isChat = true;
            });
            Get.snackbar("알림", "채팅이 도착했습니다");
          }
        }
      }
    });
//앱 실행중일때
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
//알람을 클릭했을때

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//앱이 백그라운드에서 실행중일때

    //endregion
    /////////firebase
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
    bannerController.getBanner_Main();
    bannerController.getBanner_Sub();
    proController.getPro_Alli();
    proController.getPro_Best();
    popularController.getPopular();

    channelInit();

    firebaseSetting();

    _selectedIndex = widget.index;
    user_id = controller.pro.value.pro_id;
    _initTexts();
    print('user_idd : $user_id');
    if (controller.pro.value.type == "pro") {
      _widgetOptions = [
        Interior_Page(categoryTitle: 0),
        HomePage(),
        P_Chat(),
      ];
    } else {
      _widgetOptions = [
        Interior_Page(categoryTitle: 0),
        HomePage(),
        Receive_Estimate(
          isMain: true,
        ),
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_selectedIndex == 2) {
          moveIndex(1);
        } else if (_selectedIndex == 1) {
          DateTime now = DateTime.now();
          if (now.difference(currentBackPressTime) >
              const Duration(milliseconds: 1500)) {
            currentBackPressTime = now;
            Fluttertoast.showToast(
                msg: "뒤로가기 버튼을 한번 더 누르면 종료됩니다",
                toastLength: Toast.LENGTH_SHORT);
            //////////////////////////////////////뒤로가기 텍스트
            return Future.value(false);
          }
          return Future.value(true);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: _selectedIndex == 1
            ? AppBar(
                iconTheme: IconThemeData(color: Color(0xFF025595)),
                elevation: 0,
                backgroundColor: Colors.white,
                title: InkWell(
                    onTap: () {
                      homeScrollController.animateTo(0.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Image.asset("assets/logo_3.jpg",
                        width: 65, height: 35)),
                centerTitle: true,
                actions: [
                  controller.pro.value.type == 'None'
                      ? InkWell(
                          onTap: () {
                            Get.dialog(C_Login(index: 0));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 15.0, bottom: 15, left: 2, right: 5),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF025595),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '로그인',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            storage.delete(key: "login");
                            setState(() {
                              controller.change(
                                type: 'None',
                                id: 'None',
                                pro_id: 'None',
                                pro_pw: 'None',
                                pro_name: 'None',
                                pro_phone: 'None',
                                pro_email: 'None',
                                com_name: 'None',
                                profile_img: 'None',
                                pro_token: 'None',
                                recom: "None",
                              );
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 15.0, bottom: 15, left: 2, right: 5),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF025595),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '로그아웃',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: InkWell(
                        onTap: () {
                          if (controller.pro.value.type != "None") {
                            mainController.isAlarm = false;
                            Get.to(() => MainAlarm());
                          } else {
                            Get.snackbar("로그인", "로그인을 해주세요");
                          }
                        },
                        child: Stack(
                          children: [
                            Obx(
                              () => Positioned(
                                  top: 15,
                                  child: CircleAvatar(
                                    radius: mainController.isAlarm ? 3 : 0,
                                    backgroundColor: Color(0xFF025595),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.notifications,
                                  color: Color(0xFF025595), size: 22),
                            ),
                          ],
                        )),
                  ),
                ],
              )
            : _selectedIndex == 0
                ? AppBar(
                    elevation: 0,
                    title: Text(
                      '견적 신청',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Color(0xFF025595),
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )
                : null,
        drawer: _selectedIndex == 1
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      width: Get.width,
                      color: Color(0xFF025595),
                      height: 150,
                      child: DrawerHeader(
                          child: controller.pro.value.type == 'None'
                              ? Container(
                                  child: Center(
                                    child: Text(
                                      '로그인 후 이용해주세요',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: controller.pro.value.type ==
                                                'cus'
                                            ? controller.pro.value
                                                        .profile_img ==
                                                    'default_image'
                                                ? Image.asset(
                                                    'assets/defaultImage.png',
                                                    width: 70,
                                                    height: 70)
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            controller.pro.value
                                                                .profile_img,
                                                          ),
                                                          fit: BoxFit.fill,
                                                        )),
                                                  )
                                            // Image.network(controller.pro.value.profile_img, width:70,height:70)
                                            : CircleAvatar(
                                                radius: 35,
                                                backgroundColor: Colors.white,
                                                foregroundImage: NetworkImage(
                                                    "http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}"),
                                              )),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.pro.value.type == 'cus'
                                                ? controller.pro.value.pro_name
                                                : controller.pro.value.com_name,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: FittedBox(
                                                  child: Text(
                                                      controller
                                                          .pro.value.pro_id,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'NanumSquareR',
                                                      )),
                                                ),
                                              ),
                                              SizedBox(width: 7),
                                              controller.pro.value.type == 'cus'
                                                  ? Image.asset(
                                                      'assets/kakao.png',
                                                      width: 13,
                                                      height: 13)
                                                  : Image.asset(
                                                      "assets/i_partner.png",
                                                      width: 13,
                                                      height: 13),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  print('ss');
                                                },
                                                child: Icon(
                                                  CupertinoIcons.clear,
                                                  size: 18.0,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        )),
                                  ],
                                )),
                    ),
                    controller.pro.value.type == 'None'
                        ? GestureDetector(
                            onTap: () {
                              print('로그인');
                              Get.dialog(C_Login(
                                index: 0,
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 100.0, horizontal: 80.0),
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      width: 1.0, color: Color(0xFF025595))),
                              child: Center(
                                child: Text(
                                  '로그인',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Get.to(Request_Received());
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 25, left: 25.0, bottom: 15),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/list_g.png",
                                          width: 18, height: 18),
                                      SizedBox(width: 15),
                                      Text(
                                          controller.pro.value.type == 'cus'
                                              ? '보낸 요청서'
                                              : '받은 요청서', //
                                          style: TextStyle(
                                            fontFamily: 'NanumSquareB',
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (controller.pro.value.type == "pro") {
                                    Get.to(P_Chat());
                                  } else {
                                    Get.to(Receive_Estimate(
                                      isMain: false,
                                    ));
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 25.0, bottom: 15),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/chat_g.png",
                                          width: 18, height: 18),
                                      // Icon(Icons.speaker_notes_rounded,
                                      //   color: Color(0xFf444444),
                                      // ),
                                      SizedBox(width: 15),
                                      Text('채팅',
                                          style: TextStyle(
                                            fontFamily: 'NanumSquareB',
                                            fontSize: 14,
                                          )),
                                      SizedBox(width: 5),
                                      // Container(
                                      //   width: 20,
                                      //   height: 15,
                                      //   decoration: BoxDecoration(
                                      //     color: Color(0xFF025595),
                                      //     borderRadius: BorderRadius.circular(3),
                                      //   ),
                                      //   child: Center(
                                      //     child: Text(
                                      //       'N',
                                      //       style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 12,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (controller.pro.value.type == "pro") {
                                    await Get.to(P_Mypage());
                                    setState(() {});
                                  } else {
                                    Get.to(C_Mypage());
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 25.0, bottom: 15),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/user_g.png",
                                          width: 18, height: 18),
                                      SizedBox(width: 14),
                                      Text('마이페이지',
                                          style: TextStyle(
                                            fontFamily: 'NanumSquareB',
                                            fontSize: 14,
                                          )),
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
                    SizedBox(height: 10.0),
                    controller.pro.value.type == 'None'
                        ? Container()
                        : InkWell(
                            onTap: () {
                              print('로그아웃');
                              setState(() {
                                controller.change(
                                  type: 'None',
                                  id: 'None',
                                  pro_id: 'None',
                                  pro_pw: 'None',
                                  pro_name: 'None',
                                  pro_phone: 'None',
                                  pro_email: 'None',
                                  com_name: 'None',
                                  profile_img: 'None',
                                  pro_token: 'None',
                                  recom: "None",
                                );
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 25.0, bottom: 15),
                              child: Row(
                                children: [
                                  Image.asset("assets/logout-(1)_g@2x.png",
                                      width: 18, height: 18),
                                  SizedBox(width: 15),
                                  Text('로그아웃',
                                      style: TextStyle(
                                        fontFamily: 'NanumSquareB',
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              )
            : null,
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF025595),
            unselectedFontSize: 11,
            currentIndex: _selectedIndex, //현재 선택된 Index
            onTap: (int index) {
              if (index == 2) {
                mainController.isChat = false;
                if (controller.pro.value.pro_id == "None") {
                  Get.dialog(const C_Login(index: 0));
                } else if (controller.pro.value.type == "pro") {
                  _widgetOptions = [
                    const Interior_Page(categoryTitle: 0),
                    const HomePage(),
                    const P_Chat(),
                  ];
                  setState(() {
                    _selectedIndex = index;
                  });
                } else {
                  _widgetOptions = [
                    const Interior_Page(categoryTitle: 0),
                    const HomePage(),
                    const Receive_Estimate(
                      isMain: true,
                    ),
                  ];
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              } else if (index == 0) {
                Get.to(
                  const Interior_Page(categoryTitle: 0),
                );
              } else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },

            selectedLabelStyle: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                label: '견적신청',
                icon: Image.asset(
                  "assets/notice.png",
                  width: 22,
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: '홈',
                icon: Image.asset(
                  "assets/home.png",
                  width: 22,
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                  label: '채팅',
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Stack(
                      children: [
                        Obx(
                          () => Positioned(
                            child: CircleAvatar(
                              radius: mainController.isChat ? 2 : 0,
                              backgroundColor: Colors.white,
                            ),
                            top: 0,
                            right: 0,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/chat.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        backgroundColor: Color(0xFF616CA1),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}

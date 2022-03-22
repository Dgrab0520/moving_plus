import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cloud_functions/cloud_functions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/alarm_data.dart';
import 'package:moving_plus/datas/chat_data.dart';
import 'package:moving_plus/models/chat_model.dart';
import 'package:moving_plus/pages/detailscreen.dart';
import 'package:moving_plus/pages/payment_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'p_detail_estimate.dart';
import 'p_portfolio_edit_page.dart';

final controller = Get.put(ReactiveController());

class Chat_Estimate extends StatefulWidget {
  const Chat_Estimate({
    Key? key,
    required this.estimateId,
    required this.chatRoomIndex,
    required this.serviceType,
    required this.token,
    required this.otherName,
    required this.proId,
  }) : super(key: key);
  final String estimateId;
  final int chatRoomIndex;
  final String serviceType;
  final String token;
  final String otherName;
  final String proId;

  @override
  _Chat_EstimateState createState() => _Chat_EstimateState();
}

class _Chat_EstimateState extends State<Chat_Estimate> {
  bool isSelect = false;
  bool isTextChange = false;
  bool isLoading = false;

  int isPro = 1;
  int textLines = 1;

  List<Chat> chatting = [];

  String token = "";

  TextEditingController chatTextController = TextEditingController();
  ScrollController scrollController = ScrollController();

  FocusNode focusNode = FocusNode();

  HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendFCM',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 5)));

  getChat() {
    ChatData.getChat(widget.estimateId).then((value) {
      print(value);
      setState(() {
        chatting = value;
      });
      for (int index = 0; index < chatting.length; index++) {
        DateTime currentDate = DateTime(1);
        DateTime pastDate = DateTime(1);
        if (index != 0) {
          currentDate = DateTime.parse(chatting[index - 1].createAt);
          pastDate = DateTime.parse(chatting[index].createAt);
        }

        if ((currentDate.difference(pastDate).inHours / 24).round() > 0) {
          print(currentDate);
          print(pastDate);
          chatting.insert(
              index,
              Chat(
                  id: 0,
                  estimateId: "0",
                  text: "",
                  image: "",
                  estimatePrice: 0,
                  finalPrice: 0,
                  isPro: 3,
                  createAt: chatting[index].createAt,
                  chatType: ''));
        }
      }
    });
    Timer(
        Duration(milliseconds: 300),
        () => scrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut));
  }

  setCheckedChatNumber(int i) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("checkedChatNumber", i);
  }

  @override
  void initState() {
    print(widget.serviceType);
    getChat();
    FirebaseMessaging.onMessage.listen((message) {
      getChat();
    });
    //firebase 실시간 채팅 받아오기

    token = widget.token;
    print(token);
    if (controller.pro.value.type == "pro") {
      isPro = 1;
    } else {
      isPro = 0;
    }
    print(isPro);

    super.initState();
  }

  @override
  void dispose() {
    chatTextController.dispose();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.otherName,
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
        // actions: [
        //   isPro == 0
        //       ? Container()
        //       : widget.serviceType == "개인 문의"
        //           ? Container()
        //           : InkWell(
        //               onTap: () async {
        //                 var result =
        //                     await Get.to(P_Detail_Estimate(), arguments: {
        //                   "estimateId": widget.estimateId,
        //                   "serviceType": widget.serviceType,
        //                 });
        //                 print(result);
        //                 setState(() {
        //                   isSelect = false;
        //
        //                   Chat chat = Chat(
        //                       id: 0,
        //                       estimateId: widget.estimateId,
        //                       text: "",
        //                       image: "",
        //                       estimatePrice: 0,
        //                       finalPrice: result,
        //                       isPro: isPro,
        //                       createAt: "");
        //                   ChatData.putChat(chat, "final").then((value) async {
        //                     if (value.isNotEmpty) {
        //                       print(value);
        //                       chat.createAt = value[0];
        //
        //                       if (isPro == 1) {
        //                         chatRoom[widget.chatRoomIndex].lastChat =
        //                             chat.finalPrice.toString();
        //                         chatRoom[widget.chatRoomIndex].chatType =
        //                             "final";
        //                         chatRoom[widget.chatRoomIndex].createAt =
        //                             chat.createAt;
        //                       } else {
        //                         userChatRooms[widget.chatRoomIndex].lastChat =
        //                             chat.finalPrice.toString();
        //                         userChatRooms[widget.chatRoomIndex].chatType =
        //                             "final";
        //                         userChatRooms[widget.chatRoomIndex].createAt =
        //                             chat.createAt;
        //                       }
        //
        //                       setState(() {
        //                         chatting.insert(0, chat);
        //                         isSelect = false;
        //                         Timer(
        //                             Duration(milliseconds: 200),
        //                             () => scrollController.animateTo(0.0,
        //                                 duration: Duration(milliseconds: 300),
        //                                 curve: Curves.easeInOut));
        //                       });
        //                       final HttpsCallableResult result =
        //                           await callable.call(
        //                         <String, dynamic>{
        //                           "token": token,
        //                           "title": controller.pro.value.pro_name,
        //                           "body": "최종 견적",
        //                         },
        //                       );
        //                     }
        //                   });
        //                   Timer(
        //                       Duration(milliseconds: 200),
        //                       () => scrollController.animateTo(0.0,
        //                           duration: Duration(milliseconds: 300),
        //                           curve: Curves.easeInOut));
        //                 });
        //               },
        //               child: Container(
        //                 padding: EdgeInsets.only(right: 8),
        //                 width: 29,
        //                 height: 29,
        //                 child: Image.asset(
        //                   'assets/write_fill.png',
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),  //최종견적
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isSelect = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: chatting.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (chatting[index].isPro == 3) {
                          return CenterDate(
                            currentDate:
                                DateTime.parse(chatting[index - 1].createAt),
                          );
                        } else {
                          if (chatting[index].chatType == "final_end") {
                            return FinalChat(
                                currentDate:
                                    DateTime.parse(chatting[index].createAt));
                          } else if (chatting[index].chatType == "final") {
                            return FinalPrice(
                                price: chatting[index].finalPrice,
                                estimateId: chatting[index].estimateId,
                                createAt: chatting[index].createAt,
                                detail: chatting[index].text,
                                isPro: isPro == 1 ? true : false,
                                serviceType: widget.serviceType);
                          } else if (chatting[index].image != "") {
                            return ImageChat(
                              image:
                                  "$homeURL/plus/chat_image/${chatting[index].image}",
                              createAt: chatting[index].createAt,
                              isPro:
                                  isPro == chatting[index].isPro ? true : false,
                            );
                          } else if (chatting[index].estimatePrice != 0) {
                            return EstimatePrice(
                              price: chatting[index].estimatePrice,
                              createAt: chatting[index].createAt,
                              isPro: isPro == 1 ? true : false,
                              detail: chatting[index].text,
                              proId: widget.proId,
                              serviceType: widget.serviceType,
                            );
                          } else {
                            if (chatting[index].isPro == 1) {
                              return MyChat(
                                text: chatting[index].text,
                                createAt: chatting[index].createAt,
                                isPro: isPro == 1 ? true : false,
                              );
                            } else {
                              return OtherChat(
                                text: chatting[index].text,
                                createAt: chatting[index].createAt,
                                isPro: isPro == 1 ? true : false,
                              );
                            }
                          }
                        }
                      }),
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: Get.width,
            // height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Color(0xFFcccccc),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    if (!(isPro == 1 &&
                        chatting.length == 1 &&
                        !widget.estimateId.contains("/"))) {
                      getFile();
                    }
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    child: Image.asset(
                      'assets/gg.png',
                      color: Colors.black54,
                    ),
                  ),
                ),
                //채팅창
                SizedBox(width: 10),
                isPro == 0 ||
                        chatting
                            .where((element) => element.chatType == "final_end")
                            .isNotEmpty
                    ? Container()
                    : InkWell(
                        onTap: () async {
                          if (!(isPro == 1 &&
                              chatting.length == 1 &&
                              !widget.estimateId.contains("/"))) {
                            var result =
                                await Get.to(P_Detail_Estimate(), arguments: {
                              "estimateId": widget.estimateId,
                              "serviceType": widget.serviceType,
                            });
                            print(result);
                            setState(() {
                              isSelect = false;

                              Chat chat = Chat(
                                  id: 0,
                                  estimateId: widget.estimateId,
                                  text: "",
                                  image: "",
                                  estimatePrice: 0,
                                  finalPrice: result,
                                  isPro: isPro,
                                  createAt: "",
                                  chatType: 'final');
                              ChatData.putChat(chat, "final")
                                  .then((value) async {
                                if (value.isNotEmpty) {
                                  print(value);
                                  chat.createAt = value[0];

                                  if (isPro == 1) {
                                    chatRoom[widget.chatRoomIndex].lastChat =
                                        chat.finalPrice.toString();
                                    chatRoom[widget.chatRoomIndex].chatType =
                                        "final";
                                    chatRoom[widget.chatRoomIndex].createAt =
                                        chat.createAt;
                                  } else {
                                    userChatRooms[widget.chatRoomIndex]
                                        .lastChat = chat.finalPrice.toString();
                                    userChatRooms[widget.chatRoomIndex]
                                        .chatType = "final";
                                    userChatRooms[widget.chatRoomIndex]
                                        .createAt = chat.createAt;
                                  }

                                  setState(() {
                                    chatting.insert(0, chat);
                                    isSelect = false;
                                    Timer(
                                        Duration(milliseconds: 200),
                                        () => scrollController.animateTo(0.0,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut));
                                  });
                                  final HttpsCallableResult result =
                                      await callable.call(
                                    <String, dynamic>{
                                      "token": token,
                                      "title": controller.pro.value.pro_name,
                                      "body": "최종 견적",
                                    },
                                  );
                                }
                              });
                              Timer(
                                  Duration(milliseconds: 200),
                                  () => scrollController.animateTo(0.0,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut));
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          width: 29,
                          height: 29,
                          child: Image.asset(
                            'assets/write_fill.png',
                            color: Colors.black54,
                          ),
                        ),
                      ),
                SizedBox(width: 1),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    // height: 42,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xFFcccccc),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      enabled: (isPro == 1 &&
                              chatting.length == 1 &&
                              !widget.estimateId.contains("/"))
                          ? false
                          : true,
                      controller: chatTextController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      focusNode: focusNode,

                      onTap: () {
                        isSelect = false;
                        print(0.0);
                        Timer(
                            Duration(milliseconds: 200),
                            () => scrollController.animateTo(0.0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut));
                      },
                      onChanged: (text) {
                        if (text == "") {
                          setState(() {
                            isTextChange = false;
                          });
                        } else {
                          setState(() {
                            isTextChange = true;
                          });
                        }
                      },
                      // style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 2, top: 2),
                        hintText: (isPro == 1 &&
                                chatting.length == 1 &&
                                !widget.estimateId.contains("/"))
                            ? '고객이 응답 할 경우 채팅이 활성화 됩니다.'
                            : '',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      if (!isSelect) {
                        if (chatting.length == 1 &&
                            controller.pro.value.type == 'pro' &&
                            !widget.estimateId.contains("/")) {
                          Get.snackbar('전송 실패', '고객이 응답 후 메시지 전송이 가능합니다',
                              backgroundColor: Colors.white);
                        } else {
                          if (chatting.length == 1 &&
                              !widget.estimateId.contains("/")) {
                            AlarmData.putChat(
                                controller.pro.value.pro_id,
                                [userChatRooms[widget.chatRoomIndex].proId],
                                "first chat",
                                order_id: "",
                                mainType: widget.serviceType);
                          }
                          if (chatTextController.text != "") {
                            Chat chat = Chat(
                                id: 0,
                                estimateId: widget.estimateId,
                                text: chatTextController.text,
                                image: "",
                                estimatePrice: 0,
                                finalPrice: 0,
                                isPro: isPro,
                                createAt: "",
                                chatType: 'text');
                            ChatData.putChat(chat, "text").then((value) async {
                              if (value.isNotEmpty) {
                                print(value);
                                chat.createAt = value[0];
                                if (isPro == 1) {
                                  chatRoom[widget.chatRoomIndex].lastChat =
                                      chat.text;
                                  chatRoom[widget.chatRoomIndex].chatType =
                                      "text";
                                  chatRoom[widget.chatRoomIndex].createAt =
                                      value[0];
                                } else {
                                  userChatRooms[widget.chatRoomIndex].lastChat =
                                      chat.text;
                                  userChatRooms[widget.chatRoomIndex].chatType =
                                      "text";
                                  userChatRooms[widget.chatRoomIndex].createAt =
                                      value[0];
                                }

                                setState(() {
                                  DateTime currentDate = DateTime.now();
                                  DateTime pastDate =
                                      DateTime.parse(chatting[0].createAt);

                                  if ((currentDate
                                                  .difference(pastDate)
                                                  .inHours /
                                              24)
                                          .round() >
                                      0) {
                                    print(currentDate);
                                    print(pastDate);
                                    chatting.insert(
                                        0,
                                        Chat(
                                            id: 0,
                                            estimateId: "0",
                                            text: "",
                                            image: "",
                                            estimatePrice: 0,
                                            finalPrice: 0,
                                            isPro: 3,
                                            createAt: DateTime.now().toString(),
                                            chatType: ''));
                                  }
                                  chatting.insert(0, chat);

                                  chatTextController.text = "";
                                  isTextChange = false;
                                  isSelect = false;
                                  Timer(
                                      Duration(milliseconds: 200),
                                      () => scrollController.animateTo(0.0,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut));
                                });
                                print(token);
                                final HttpsCallableResult result =
                                    await callable.call(
                                  <String, dynamic>{
                                    "token": token,
                                    "title": controller.pro.value.pro_name,
                                    "body": chat.text,
                                  },
                                );
                                print(result.data);
                              }
                            });
                          } else {
                            if (focusNode.hasFocus) {
                              FocusScope.of(context).unfocus();
                            } else {
                              focusNode.requestFocus();
                            }
                          }
                        }
                      } else {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      }
                    },
                    child: Image.asset(
                        isTextChange
                            ? 'assets/rightarrow.png'
                            : focusNode.hasFocus || isSelect
                                ? 'assets/downarrow.png'
                                : 'assets/uparrow.png',
                        width: 35,
                        height: 35)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        onFileLoading: (value) {
          debugPrint(value.toString());
        });
    if (result != null) {
      File file = File(result.files.single.path!);

      Chat chat = Chat(
          id: 0,
          estimateId: widget.estimateId,
          text: "",
          image: "true",
          estimatePrice: 0,
          finalPrice: 0,
          isPro: isPro,
          createAt: "",
          chatType: 'image');
      print(isPro);
      ChatData.putChat(chat, "image", file: file).then((value) async {
        if (value.isNotEmpty) {
          print(value);
          chat.createAt = value[0];
          chat.image = value[1];

          if (isPro == 1) {
            chatRoom[widget.chatRoomIndex].lastChat = chat.image;
            chatRoom[widget.chatRoomIndex].chatType = "image";
            chatRoom[widget.chatRoomIndex].createAt = chat.createAt;
          } else {
            userChatRooms[widget.chatRoomIndex].lastChat = chat.image;
            userChatRooms[widget.chatRoomIndex].chatType = "image";
            userChatRooms[widget.chatRoomIndex].createAt = chat.createAt;
            print(userChatRooms[widget.chatRoomIndex].lastChat);
            print(userChatRooms[widget.chatRoomIndex].chatType);
            print(userChatRooms[widget.chatRoomIndex].createAt);
          }

          setState(() {
            DateTime currentDate = DateTime.now();
            DateTime pastDate = DateTime.parse(chatting[0].createAt);

            if ((currentDate.difference(pastDate).inHours / 24).round() > 0) {
              print(currentDate);
              print(pastDate);
              chatting.insert(
                  0,
                  Chat(
                      id: 0,
                      estimateId: "0",
                      text: "",
                      image: "",
                      estimatePrice: 0,
                      finalPrice: 0,
                      isPro: 3,
                      createAt: DateTime.now().toString(),
                      chatType: ''));
            }
            chatting.insert(0, chat);
            isSelect = false;
            Timer(
                Duration(milliseconds: 200),
                () => scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut));
          });
          final HttpsCallableResult result = await callable.call(
            <String, dynamic>{
              "token": token,
              "title": controller.pro.value.pro_name,
              "body": "사진을 보냈습니다",
            },
          );
        }
      });
    } else {
      // User canceled the picker
    }
  }
}

class FinalChat extends StatelessWidget {
  const FinalChat({
    Key? key,
    required this.currentDate,
  }) : super(key: key);
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    List<String> weekDay = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Text(
        '${currentDate.year}년 ${currentDate.month}월 ${currentDate.day}일 ${weekDay[currentDate.weekday - 1]}\n결제가 완료되었습니다',
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'NanumSquareB',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CenterDate extends StatelessWidget {
  const CenterDate({
    Key? key,
    required this.currentDate,
  }) : super(key: key);
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    List<String> weekDay = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Text(
        '${currentDate.year}년 ${currentDate.month}월 ${currentDate.day}일 ${weekDay[currentDate.weekday - 1]}',
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'NanumSquareB',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ImageChat extends StatelessWidget {
  const ImageChat({
    Key? key,
    required this.image,
    required this.createAt,
    required this.isPro,
  }) : super(key: key);

  final String image;
  final String createAt;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    DateTime createAtTime = DateTime.parse(createAt);
    String time = DateFormat("HH:mm").format(createAtTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
        children: [
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Get.to(DetailScreen(path: image));
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: Get.width / 2),
                  //padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.network(image),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyChat extends StatelessWidget {
  const MyChat({
    Key? key,
    required this.text,
    required this.createAt,
    required this.isPro,
  }) : super(key: key);

  final String text;
  final String createAt;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    DateTime createAtTime = DateTime.parse(createAt);
    String time = DateFormat("HH:mm").format(createAtTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
        children: [
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 10),
              Container(
                constraints: BoxConstraints(maxWidth: Get.width / 2),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFcccccc),
                    )),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OtherChat extends StatelessWidget {
  const OtherChat({
    Key? key,
    required this.text,
    required this.createAt,
    required this.isPro,
  }) : super(key: key);

  final String text;
  final String createAt;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    DateTime createAtTime = DateTime.parse(createAt);
    String time = DateFormat("HH:mm").format(createAtTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Get.width / 2),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFd8e3eb),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFcccccc),
                    )),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class FinalPrice extends StatelessWidget {
  const FinalPrice({
    Key? key,
    required this.price,
    required this.estimateId,
    required this.createAt,
    required this.isPro,
    required this.serviceType,
    required this.detail,
  }) : super(key: key);
  final int price;
  final String estimateId;
  final String createAt;
  final bool isPro;
  final String serviceType;
  final String detail;

  @override
  Widget build(BuildContext context) {
    var finalPriceController = MoneyMaskedTextController(
        decimalSeparator: '', thousandSeparator: ',', precision: 0);
    finalPriceController.updateValue(price.toDouble());
    var finalPriceController2 = MoneyMaskedTextController(
        decimalSeparator: '', thousandSeparator: ',', precision: 0);

    if (price <= 150000) {
      finalPriceController2.updateValue(15000);
    } else if (price > 150000 && price < 500000) {
      finalPriceController2.updateValue(price / 10);
    } else if (price >= 500000 && price <= 1000000) {
      finalPriceController2.updateValue(50000);
    } else if (price >= 1000001 && price <= 1500000) {
      finalPriceController2.updateValue(60000);
    } else if (price >= 1500001 && price <= 2000000) {
      finalPriceController2.updateValue(70000);
    } else if (price >= 2000001 && price <= 2500000) {
      finalPriceController2.updateValue(80000);
    } else if (price >= 2500001 && price <= 3000000) {
      finalPriceController2.updateValue(90000);
    } else if (price >= 3000001) {
      finalPriceController2.updateValue(100000);
    }

    // finalPriceController2.updateValue((price / 10));
    DateTime createAtTime = DateTime.parse(createAt);
    String time = DateFormat("HH:mm").format(createAtTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection:
                  isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFcccccc),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/won_g.png',
                                    width: 23, height: 23),
                                SizedBox(width: 7),
                                Text(
                                  '최종 견적서',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    radius: 5.0,
                                    title: '계약금',
                                    titleStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                    content: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '전체 비용',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '계약 수수료',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '1~150,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '15,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '150,001~499,999 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '전체 비용 10%',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '500,000~1,000,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '50,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '1,000,001~1,500,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '60,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '1,500,001~2,000,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '70,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '2,000,001~2,500,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '80,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '2,500,000~3,000,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '90,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '3,000,001~ 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color: Colors
                                                                    .black54)),
                                                        child: Center(
                                                          child: Text(
                                                            '100,000 원',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'NanumSquareB',
                                                                color: Colors
                                                                    .deepOrange),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 35.0,
                                                      color: Color(0xFF025595),
                                                      child: Center(
                                                          child: Text(
                                                        '확인',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '계약금 요율표',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(CupertinoIcons.question_circle,
                                      size: 17.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          detail,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color(0xFFD8E3EB),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('서비스',
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                  Text(serviceType,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB')),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('최종 금액',
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                  Text('${finalPriceController.text}원',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF025595),
                                          fontFamily: 'NanumSquareB')),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('계약금',
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                  Text('${finalPriceController2.text}원',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF025595),
                                          fontFamily: 'NanumSquareB')),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 13),
                        InkWell(
                          onTap: () {
                            Get.to(Payment_Page(), arguments: estimateId);
                          },
                          child: Container(
                            width: Get.width,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFF025595),
                            ),
                            child: Center(
                              child: Text(
                                '안전 결제 하기',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'NanumSquareB',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EstimatePrice extends StatelessWidget {
  const EstimatePrice(
      {Key? key,
      required this.price,
      required this.createAt,
      required this.isPro,
      required this.detail,
      required this.proId,
      required this.serviceType})
      : super(key: key);
  final int price;
  final String createAt;
  final bool isPro;
  final String detail;
  final String proId;
  final String serviceType;
  @override
  Widget build(BuildContext context) {
    var finalPriceController = MoneyMaskedTextController(
        decimalSeparator: '', thousandSeparator: ',', precision: 0);
    finalPriceController.updateValue(price.toDouble());
    DateTime createAtTime = DateTime.parse(createAt);
    String time = DateFormat("HH:mm").format(createAtTime);
    return Column(
      children: [
        CenterDate(currentDate: createAtTime),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            textDirection: isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection:
                      isPro ? ui.TextDirection.ltr : ui.TextDirection.rtl,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFcccccc),
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/won_g.png',
                                        width: 23, height: 23),
                                    SizedBox(width: 7),
                                    Text(
                                      '견적서',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                        radius: 5.0,
                                        title: '계약금',
                                        titleStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                        content: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: Get.width,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '전체 비용',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '계약 수수료',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '1~150,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '15,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '150,001~499,999 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '전체 비용 10%',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '500,000~1,000,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '50,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '1,000,001~1,500,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '60,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '1,500,001~2,000,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '70,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '2,000,001~2,500,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '80,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '2,500,000~3,000,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '90,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '3,000,001~ 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Center(
                                                              child: Text(
                                                                '100,000 원',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'NanumSquareB',
                                                                    color: Colors
                                                                        .deepOrange),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 35.0,
                                                          color:
                                                              Color(0xFF025595),
                                                          child: Center(
                                                              child: Text(
                                                            '확인',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          )),
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '계약금 요율표',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(CupertinoIcons.question_circle,
                                          size: 17.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              detail,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 10),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                width: Get.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD8E3EB),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('서비스',
                                              style: TextStyle(
                                                fontSize: 13,
                                              )),
                                          Text(serviceType,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'NanumSquareB')),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('예상 금액',
                                              style: TextStyle(
                                                fontSize: 13,
                                              )),
                                          Text('${finalPriceController.text}원~',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF025595),
                                                  fontFamily: 'NanumSquareB')),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 13),
                            InkWell(
                              onTap: () {
                                Get.to(PortfolioEdit_Page(), arguments: proId);
                              },
                              child: Container(
                                width: Get.width,
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Color(0xFF025595),
                                ),
                                child: Center(
                                  child: Text(
                                    '파트너 프로필 보기',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NanumSquareB',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

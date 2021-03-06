import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/chat_data.dart';
import 'package:moving_plus/models/chat_room_model.dart';
import 'package:moving_plus/pages/chat_estimate.dart';

import 'main_page.dart';

final controller = Get.put(ReactiveController());

class P_Chat extends StatefulWidget {
  const P_Chat({Key? key}) : super(key: key);
  @override
  _P_ChatState createState() => _P_ChatState();
}

class _P_ChatState extends State<P_Chat> {
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  List<ChatRoom> searchEstimate = [];
  bool isSearch = false;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      isLoading = false;
      ChatData.getChatList(controller.pro.value.pro_id, "").then((value) {
        // controller.pro.value.pro_id
        print(value);
        chatRoom = value;
        ChatData.getPersonalChatList(controller.pro.value.pro_id).then((value) {
          if (value.isNotEmpty) {
            chatRoom.addAll(value);
          }
          chatRoom.sort((a, b) =>
              DateTime.parse(b.createAt).compareTo(DateTime.parse(a.createAt)));
          setState(() {
            isLoading = true;
          });
        });
      });
    });
    ChatData.getChatList(controller.pro.value.pro_id, "").then((value) {
      // controller.pro.value.pro_id
      print("value : $value");
      chatRoom = value;
      ChatData.getPersonalChatList(controller.pro.value.pro_id).then((value) {
        if (value.isNotEmpty) {
          chatRoom.addAll(value);
        }
        chatRoom.sort((a, b) =>
            DateTime.parse(b.createAt).compareTo(DateTime.parse(a.createAt)));
        setState(() {
          isLoading = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            '??????',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'NanumSquareB',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF025595),
          leading: IconButton(
              onPressed: () {
                if (controller.pro.value.type == "pro") {
                  Get.offAll(const Main_Page(index: 1));
                } else {
                  Get.back();
                }
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/chat_banner.png"),
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                controller.pro.value.com_name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'NanumSquareB',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFcccccc),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  searchEstimate = [];
                  if (text != "") {
                    searchEstimate.addAll(chatRoom.where((element) =>
                        element.serviceType.contains(text) ||
                        element.userName.contains(text) ||
                        element.area.contains(text)));
                    setState(() {
                      isSearch = true;
                    });
                  } else {
                    setState(() {
                      isSearch = false;
                    });
                  }
                },
                onSubmitted: (text) {
                  searchController.text = "";
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                        padding: EdgeInsets.only(top: 10, left: 13),
                        child: Icon(Icons.search))),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? chatRoom.isEmpty
                      ? const Text("????????? ????????????.")
                      : ListView.builder(
                          itemCount: isSearch
                              ? searchEstimate.length
                              : chatRoom.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () async {
                                var chatRoomElement = isSearch
                                    ? searchEstimate[index]
                                    : chatRoom[index];
                                var result = await Get.to(Chat_Estimate(
                                  estimateId: chatRoomElement.estimateId,
                                  chatRoomIndex: index,
                                  serviceType: chatRoomElement.serviceType,
                                  token: chatRoomElement.token,
                                  otherName: chatRoomElement.userName,
                                  proId: chatRoomElement.proId,
                                ));
                                print(result);
                                ChatData.getChatList(
                                        controller.pro.value.pro_id, "")
                                    .then((value) {
                                  // controller.pro.value.pro_id
                                  print("value : $value");
                                  chatRoom = value;
                                  ChatData.getPersonalChatList(
                                          controller.pro.value.pro_id)
                                      .then((value) {
                                    if (value.isNotEmpty) {
                                      chatRoom.addAll(value);
                                    }
                                    chatRoom.sort((a, b) =>
                                        DateTime.parse(b.createAt).compareTo(
                                            DateTime.parse(a.createAt)));
                                    setState(() {
                                      isLoading = true;
                                    });
                                  });
                                });
                              },
                              child: ChatRoomBox(
                                chatRoomElement: isSearch
                                    ? searchEstimate[index]
                                    : chatRoom[index],
                                chatRoomIndex: index,
                              ),
                            );
                          })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatRoomBox extends StatelessWidget {
  const ChatRoomBox(
      {Key? key, required this.chatRoomElement, required this.chatRoomIndex})
      : super(key: key);

  final ChatRoom chatRoomElement;
  final int chatRoomIndex;

  @override
  Widget build(BuildContext context) {
    print(chatRoomElement.area);
    String area = chatRoomElement.area.split(" ").length < 2
        ? chatRoomElement.area
        : chatRoomElement.area.split(" ")[0] +
            " " +
            chatRoomElement.area.split(" ")[1];
    DateTime createAt = DateTime.parse(chatRoomElement.createAt);
    DateTime now = DateTime.now();
    print(chatRoomElement.estimateId);
    print(now);
    print(createAt);
    print(now.difference(createAt).inMinutes);
    int timeDifference = now.difference(createAt).inMinutes;
    String time = "";
    if (timeDifference < 60) {
      time = "$timeDifference ??????";
    } else {
      if (timeDifference / 60 < 24) {
        time = "${timeDifference ~/ 60} ?????????";
      } else {
        if (timeDifference / 60 / 24 < 2) {
          time = "??????";
        } else {
          time = "${timeDifference / 60 ~/ 24} ??????";
        }
      }
    }

    String lasChat = chatRoomElement.lastChat;
    if (chatRoomElement.chatType == "image") {
      lasChat = "????????? ???????????????";
    } else if (chatRoomElement.chatType == "estimate") {
      lasChat = "????????? ???????????????";
    } else if (chatRoomElement.chatType == "final") {
      lasChat = "?????? ????????? ???????????????";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFcccccc),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatRoomElement.userName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    chatRoomElement.serviceType == '?????? ??????'
                        ? chatRoomElement.serviceType
                        : '${chatRoomElement.serviceType} | $area',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                lasChat,
                style: const TextStyle(
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

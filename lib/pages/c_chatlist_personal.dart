import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/chat_data.dart';
import 'package:moving_plus/models/user_chat_room_model.dart';
import 'package:moving_plus/pages/chat_estimate.dart';

class ChatListPersonal extends StatefulWidget {
  const ChatListPersonal({Key? key}) : super(key: key);

  @override
  _ChatListPersonalState createState() => _ChatListPersonalState();
}

class _ChatListPersonalState extends State<ChatListPersonal> {
  List<UserChatRoom> searchEstimate = [];
  bool isSearch = false;

  final proController = Get.put(ReactiveController());

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      ChatData.getUserPersonalChatList(proController.pro.value.pro_id)
          .then((value) {
        print(value);
        if (value.isNotEmpty) {
          setState(() {
            userChatRooms = value;
          });
        }
      });
    });
    ChatData.getUserPersonalChatList(proController.pro.value.pro_id)
        .then((value) {
      print(value);
      if (value.isNotEmpty) {
        setState(() {
          userChatRooms = value;
        });
      }
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
            '채팅',
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
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 95,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/chat_banner.png"),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 45),
                    Text(
                      "개인 문의",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
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
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    searchEstimate = [];
                    if (text != "") {
                      searchEstimate.addAll(userChatRooms
                          .where((element) => element.proName.contains(text)));
                      setState(() {
                        isSearch = true;
                      });
                    } else {
                      setState(() {
                        isSearch = false;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: userChatRooms.isEmpty
                      ? const Text("받은 견적이 없습니다")
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: isSearch
                              ? searchEstimate.length
                              : userChatRooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ChatRoomBox(
                                chatRoom: isSearch
                                    ? searchEstimate[index]
                                    : userChatRooms[index],
                                chatRoomIndex: index,
                                serviceType: "개인 문의",
                                address: "");
                          }))
            ],
          ),
        ),
      ),
    );
  }
}

class ChatRoomBox extends StatelessWidget {
  const ChatRoomBox(
      {Key? key,
      required this.chatRoom,
      required this.chatRoomIndex,
      required this.serviceType,
      required this.address})
      : super(key: key);

  final UserChatRoom chatRoom;
  final int chatRoomIndex;
  final String serviceType;
  final String address;

  @override
  Widget build(BuildContext context) {
    DateTime createAt = chatRoom.createAt == ""
        ? DateTime.now()
        : DateTime.parse(chatRoom.createAt);
    DateTime now = DateTime.now();
    print(chatRoom.estimateId);
    print(now);
    print(createAt);
    print(now.difference(createAt).inMinutes);
    int timeDifference = now.difference(createAt).inMinutes;
    String time = "";
    if (timeDifference < 60) {
      time = "$timeDifference 분전";
    } else {
      if (timeDifference / 60 < 24) {
        time = "${timeDifference ~/ 60} 시간전";
      } else {
        if (timeDifference / 60 / 24 < 2) {
          time = "어제";
        } else {
          time = "${timeDifference / 60 ~/ 24} 일전";
        }
      }
    }
    var finalPriceController = MoneyMaskedTextController(
        decimalSeparator: '', thousandSeparator: ',', precision: 0);
    print("estimatePrcie : ${chatRoom.estimatePrice}");
    if (chatRoom.estimatePrice != 0) {
      finalPriceController.updateValue(chatRoom.estimatePrice);
    }

    String lasChat = chatRoom.lastChat;
    if (chatRoom.chatType == "image") {
      lasChat = "사진을 보냈습니다";
    } else if (chatRoom.chatType == "estimate") {
      lasChat = "견적을 보냈습니다";
    } else if (chatRoom.chatType == "final") {
      lasChat = "최종 견적을 보냈습니다";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () async {
          var result = await Get.to(Chat_Estimate(
            estimateId: chatRoom.estimateId,
            chatRoomIndex: chatRoomIndex,
            serviceType: serviceType,
            token: chatRoom.token,
            otherName: chatRoom.proName,
            proId: chatRoom.proId,
          ));
          print(result);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: const Color(0xFFcccccc),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        "http://211.110.44.91/plus/pro_profile/${chatRoom.profileImage}"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chatRoom.proName,
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
                          '$serviceType | $address',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
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
                    // Container(
                    //   width: 22,
                    //   height: 15,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF025595),
                    //     borderRadius: BorderRadius.circular(3),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       '5',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 11,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

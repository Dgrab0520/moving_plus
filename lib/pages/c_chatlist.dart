import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/chat_data.dart';
import 'package:moving_plus/main.dart';
import 'package:moving_plus/models/order_chat_model.dart';
import 'package:moving_plus/models/user_chat_room_model.dart';
import 'package:moving_plus/pages/chat_estimate.dart';

class C_ChatList extends StatefulWidget {
  const C_ChatList({Key? key, required this.mainType, required this.orderChat})
      : super(key: key);
  final String mainType;
  final OrderChat orderChat;

  @override
  _C_ChatListState createState() => _C_ChatListState();
}

class _C_ChatListState extends State<C_ChatList> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      ChatData.getUserChatList(widget.orderChat.order_id).then((value) {
        print(value);
        setState(() {
          userChatRooms = value;
        });
      });
    });
    ChatData.getUserChatList(widget.orderChat.order_id).then((value) {
      print(value);
      setState(() {
        userChatRooms = value;
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
          title: Text(
            '채팅',
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
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 95,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/chat_banner.png"),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45),
                    Text(
                      widget.mainType,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.orderChat.service_type} | ${widget.orderChat.address.substring(0, 2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                        Text(
                          widget.orderChat.order_date,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NanumSquareB',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFcccccc),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: userChatRooms.isEmpty
                      ? Text("받은 견적이 없습니다")
                      : ListView.builder(
                          itemCount: userChatRooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ChatRoomBox(
                                chatRoom: userChatRooms[index],
                                chatRoomIndex: index,
                                serviceType: widget.orderChat.service_type,
                                address:
                                    widget.orderChat.address.substring(0, 2));
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
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 145,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Color(0xFFcccccc),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                      '$homeURL/plus/pro_profile/${chatRoom.profileImage}',
                      width: 50,
                      height: 50),
                  SizedBox(width: 10),
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
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$serviceType | $address',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareR',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFcccccc)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        lasChat,
                        style: TextStyle(
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '예상 견적 금액 |',
                          style: TextStyle(
                            fontFamily: 'NanumSquareB',
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '총 ${finalPriceController.numberValue.toInt()}~원',
                          style: TextStyle(
                            fontFamily: 'NanumSquareB',
                            fontSize: 12,
                            color: Color(0xFF025595),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/chat_data.dart';
import 'package:moving_plus/models/chat_room_model.dart';
import 'package:moving_plus/pages/chat_estimate.dart';

final controller = Get.put(ReactiveController());

class P_Chat extends StatefulWidget {
  const P_Chat({Key? key}) : super(key: key);
  @override
  _P_ChatState createState() => _P_ChatState();
}

class _P_ChatState extends State<P_Chat> {
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  List<String> category = ['전체', '실리콘 오염 방지', '입주 청소'];

  @override
  void initState() {
    ChatData.getChatList(controller.pro.value.pro_id, "").then((value) {
      // controller.pro.value.pro_id
      print(value);
      setState(() {
        chatRoom = value;
        isLoading = true;
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
          leading: controller.pro.value.type == "pro"
              ? null
              : IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/chat_banner.png"),
              )),
              alignment: Alignment.centerLeft,
              child: Text(
                '김성수',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'NanumSquareB',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isLoading = false;
                              });
                              ChatData.getChatList(
                                      controller.pro.value.pro_id, "")
                                  .then((value) {
                                // controller.pro.value.pro_id
                                print(value);
                                setState(() {
                                  chatRoom = value;
                                  isLoading = true;
                                });
                              });
                            },
                            child: Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFF9F9F9),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFcccccc),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  category[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isLoading = false;
                              });
                              ChatData.getChatList(controller.pro.value.pro_id,
                                      "AND b.service_type = '${category[index]}'")
                                  .then((value) {
                                // controller.pro.value.pro_id
                                print(value);
                                setState(() {
                                  chatRoom = value;
                                  isLoading = true;
                                });
                              });
                            },
                            child: Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFF9F9F9),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFcccccc),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  category[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(bottom: 10),
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
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (text) {},
                onSubmitted: (text) {
                  searchController.text = "";
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                        padding: EdgeInsets.only(top: 10, left: 13),
                        child: Icon(Icons.search))),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? chatRoom.isEmpty
                      ? Text("채팅이 없습니다.")
                      : ListView.builder(
                          itemCount: chatRoom.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ChatRoomBox(
                              chatRoom: chatRoom[index],
                              chatRoomIndex: index,
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
      {Key? key, required this.chatRoom, required this.chatRoomIndex})
      : super(key: key);

  final ChatRoom chatRoom;
  final int chatRoomIndex;

  @override
  Widget build(BuildContext context) {
    String area =
        chatRoom.area.split(" ")[0] + " " + chatRoom.area.split(" ")[1];
    DateTime createAt = DateTime.parse(chatRoom.createAt);
    DateTime now = DateTime.now().toUtc().add(Duration(hours: 9));
    print(chatRoom.estimateId);
    print(DateTime.now().toUtc().add(Duration(hours: 9)));
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

    String lasChat = chatRoom.lastChat;
    if (chatRoom.lastChat.lastIndexOf(".gif") != -1) lasChat = "사진을 보냈습니다";

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () async {
          var result = await Get.to(Chat_Estimate(
            estimateId: chatRoom.estimateId,
            chatRoomIndex: chatRoomIndex,
          ));
          print(result);
        },
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Color(0xFFcccccc),
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
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chatRoom.userName,
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
                      '${chatRoom.serviceType} | $area',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
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
            ],
          ),
        ),
      ),
    );
  }
}

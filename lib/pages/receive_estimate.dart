import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/order_list_data.dart';
import 'package:moving_plus/models/order_chat_model.dart';
import 'package:moving_plus/pages/api.dart';
import 'package:moving_plus/pages/c_chatlist.dart';

import '../main.dart';
import 'main_page.dart';

class Receive_Estimate extends StatefulWidget {
  const Receive_Estimate({Key? key, required this.isMain}) : super(key: key);
  final bool isMain;

  @override
  _Receive_EstimateState createState() => _Receive_EstimateState();
}

class _Receive_EstimateState extends State<Receive_Estimate> {
  TextEditingController searchController = TextEditingController();
  List<OrderChat> orders = [];

  @override
  void initState() {
    OrderList_Data.getUserOrder(controller.pro.value.pro_id).then((value) {
      print(value);
      setState(() {
        orders = value;
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
          leading: widget.isMain
              ? Icon(Icons.menu, color: Color(0xFF025595))
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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              padding: EdgeInsets.only(bottom: 8),
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
                        padding: EdgeInsets.only(left: 13, top: 8),
                        child: Icon(Icons.search))),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomerEstimate(
                        orderChat: orders[index],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

class CustomerEstimate extends StatefulWidget {
  const CustomerEstimate({
    Key? key,
    required this.orderChat,
  }) : super(key: key);
  final OrderChat orderChat;
  @override
  _CustomerEstimateState createState() => _CustomerEstimateState();
}

class _CustomerEstimateState extends State<CustomerEstimate> {
  String mainType = "";
  List<dynamic> profile = [];
  late OrderChat orderChat;
  @override
  void initState() {
    orderChat = widget.orderChat;
    mainType = Api().findMainCategory(orderChat.service_type);
    OrderList_Data.getUserOrderEstimate(orderChat.order_id).then((value) {
      print(value);
      setState(() {
        profile = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 175,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      mainType,
                      style: TextStyle(
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 16,
                      decoration: BoxDecoration(
                        color: orderChat.order_status == "finish"
                            ? Colors.red
                            : Color(0xFF025595),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          orderChat.order_status == "finish" ? "종료" : '진행중',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  orderChat.order_date,
                  style: TextStyle(
                    fontFamily: 'NanumSquareR',
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Text(
                  '${orderChat.service_type} | ${orderChat.address.substring(0, 2)}',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'NanumSquareR',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: profile.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Text("받은 견적서가 없습니다"),
                    )
                  : ListView.builder(
                      itemCount: profile.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(top: 5),
                          margin: EdgeInsets.only(right: 8),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                "$homeURL/plus/pro_profile/${profile[index]}"),
                          )),
                          child: index < 5
                              ? null
                              : Center(
                                  child: Text('+5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'NanumSquareB',
                                      )),
                                ),
                        );
                      }),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(C_ChatList(
                  mainType: mainType,
                  orderChat: orderChat,
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF025595),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '받은 견적 보기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

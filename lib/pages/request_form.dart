import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/estimate_data.dart';
import 'package:moving_plus/datas/order_list_data.dart';
import 'package:moving_plus/models/estimate_model.dart';
import 'package:moving_plus/models/order_chat_model.dart';
import 'package:moving_plus/models/order_model.dart';
import 'package:moving_plus/pages/api.dart';
import 'package:moving_plus/pages/c_chatlist.dart';

import '../main.dart';
import 'detailscreen.dart';

final controller = Get.put(ReactiveController());

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  List<Order> order = [];
  List<Estimate> estimate = [];
  bool _isLoading = false;
  bool _isLoading2 = false;
  int _countEstimate = 0;
  int? index;
  String? order_id = Get.parameters['order_id'];

  getOrder() {
    OrderList_Data.getEach_Order(order_id!).then((value) {
      setState(() {
        order = value;
      });
      print(order);
      if (value.isEmpty) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
          index = int.parse('${order[0].index}');
        });
        print('index : ${index}');
      }
    });
  }

  updateIndex() {
    getOrder();
    OrderList_Data.updateIndex(
            order_id!, '${int.parse('${order[0].index}') + 1}')
        .then((value) {
      print('${index! + 1}');
      if (value == 'success') {
        print('Update Index Success');
        Get.back();
      } else {
        print('Update Index Fail');
      }
    });
  }

  getEstimate() {
    EstimateData.getEstimate(order_id!).then((value) {
      setState(() {
        estimate = value;
      });
      if (value.isEmpty) {
        setState(() {
          _isLoading2 = false;
        });
      } else {
        setState(() {
          _isLoading2 = true;
          _countEstimate = value.length;
        });
      }
    });
  }

  @override
  void initState() {
    getOrder();
    getEstimate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            '?????????',
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
          actions: [
            controller.pro.value.type == 'cus'
                ? IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          radius: 5.0,
                          title: '?????? ?????? ??????',
                          titleStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: 'NanumSquareB',
                          ),
                          content: Container(
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      '10?????? ?????? ???????????? ??????',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Center(
                                    child: Text(
                                      '?????? ????????? ??????????????????????',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          width: Get.width * 0.3,
                                          height: 40.0,
                                          color: Colors.grey,
                                          child: Center(
                                              child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          updateIndex();
                                        },
                                        child: Container(
                                          width: Get.width * 0.3,
                                          height: 40.0,
                                          color: Color(0xFF025595),
                                          child: Center(
                                              child: Text(
                                            'Ok',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          )),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ))
                : SizedBox(),
          ]),
      body: _isLoading
          ? Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 15,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: 25.0, bottom: 25, left: 15, right: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Color(0xFFcccccc)),
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${order[0].user_name}',
                                          style: TextStyle(
                                            fontFamily: 'NanumSquareEB',
                                            fontSize: 15,
                                          ),
                                        ),
                                        order[0].order_status == "disable"
                                            ? Row(
                                                children: [
                                                  const Text(
                                                    "   ??????????????? ??????",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 10,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 20,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF025595),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: const Center(
                                                        child: FittedBox(
                                                          child: Text(
                                                            '?????????',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '${order[0].address}'.split(" ")[0] +
                                          ' ' +
                                          '${order[0].address}'.split(" ")[1],
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '?????? ?????????',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (controller.pro.value.type ==
                                                "cus") {
                                              var orderChat = OrderChat(
                                                  order_id: order[0].order_id,
                                                  address: order[0].address,
                                                  service_type:
                                                      order[0].service_type,
                                                  order_status: "",
                                                  order_date: DateFormat(
                                                          "yyyy.MM.dd")
                                                      .format(DateTime.parse(
                                                          order[0]
                                                              .order_date)));
                                              Get.to(C_ChatList(
                                                  mainType: Api()
                                                      .findMainCategory(order[0]
                                                          .service_type),
                                                  orderChat: orderChat));
                                            }
                                          },
                                          child: Text(
                                            _isLoading2
                                                ? ' $_countEstimate???'
                                                : ' 0???',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF025595)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //?????????
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Color(0xFFcccccc)),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 25, bottom: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '?????????',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'NanumSquareEB',
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      '${order[0].request_detail}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.6,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //????????? ?????????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '????????? ?????????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].service_type}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                )
                              ],
                            ),
                          ),

                          //??????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].date_start}'.substring(0, 10) +
                                      ' ~ ' +
                                      '${order[0].date_end}'.substring(0, 10),
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                )
                              ],
                            ),
                          ),

                          //?????? ?????? ??????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '?????? ?????? ??????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].time}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                )
                              ],
                            ),
                          ),

                          //??????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].address}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),

                          //????????????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '?????? ??????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].space_type}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                )
                              ],
                            ),
                          ),

                          //?????? ??????
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '?????? ??????',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareEB',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  '${order[0].space_size}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Divider(
                            height: 0.1,
                            thickness: 0.6,
                            color: Color(0xFFCCCCCC),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Text('????????????'),

                          //item1
                          order[0].item1 != ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order[0].item1.split(" |  ")[0],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        order[0].item1.split(" |  ")[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),

                          //item2
                          order[0].item2 != ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order[0].item2.split(" |  ")[0],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        order[0].item2.split(" |  ")[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),

                          //item3
                          order[0].item3 != ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order[0].item3.split(" |  ")[0],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        order[0].item3.split(" |  ")[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),

                          //item4
                          order[0].item4 != ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order[0].item4.split(" |  ")[0],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        order[0].item4.split(" |  ")[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),

                          //item5
                          order[0].item5 != ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order[0].item5.split(" |  ")[0],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        order[0].item5.split(" |  ")[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),

                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            width: Get.width,
                            height: 80.0,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: order[0].request_img1 != ""
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(DetailScreen(
                                                path:
                                                    "$homeURL/plus/order_image/${order[0].request_img1}"));
                                          },
                                          child: Image.network(
                                            "$homeURL/plus/order_image/${order[0].request_img1}",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: order[0].request_img2 != ""
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(DetailScreen(
                                                path:
                                                    "$homeURL/plus/order_image/${order[0].request_img2}"));
                                          },
                                          child: Image.network(
                                            "$homeURL/plus/order_image/${order[0].request_img2}",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: order[0].request_img3 != ""
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(DetailScreen(
                                                path:
                                                    "$homeURL/plus/order_image/${order[0].request_img3}"));
                                          },
                                          child: Image.network(
                                            "$homeURL/plus/order_image/${order[0].request_img3}",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  controller.pro.value.type == 'cus'
                      ? Container()
                      : Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              if (index! * 10 > _countEstimate) {
                                print('multiple = ${index! * 10}');
                                Get.offNamed(
                                    '/estimate/true?order_id=$order_id&customer_id=${order[0].user_id}&&service_type=${order[0].service_type}');
                              } else {
                                Get.snackbar(
                                    '?????? ??????', '?????? ?????? ????????? ???????????? ????????? ?????? ??? ????????????',
                                    backgroundColor: Colors.white);
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF025595),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '????????? ?????????',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NanumSquareB',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 30),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/estimate_data.dart';
import 'package:moving_plus/datas/order_list_data.dart';
import 'package:moving_plus/models/estimate_model.dart';
import 'package:moving_plus/models/order_model.dart';

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
  int index = 1;
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
          '요청서',
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
                                    Text(
                                      '${order[0].user_name}',
                                      style: TextStyle(
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 15,
                                      ),
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
                                          '받은 견적서',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          _isLoading2
                                              ? ' $_countEstimate개'
                                              : ' 0개',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF025595)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //요청글
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
                                      '요청글',
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

                          //원하는 서비스
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '원하는 서비스',
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

                          //날짜
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '날짜',
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

                          //방문 가능 시간
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '방문 가능 시간',
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

                          //지역
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '지역',
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

                          //공간유형
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '공간 유형',
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

                          //공간 크기
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '공간 크기',
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

                          Text('상세정보'),

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
                              if (index * 10 > _countEstimate) {
                                Get.offNamed(
                                    '/estimate/true?order_id=$order_id&customer_id=${order[0].user_id}&&service_type=${order[0].service_type}');
                              } else {
                                Get.snackbar(
                                    '견적 만료', '견적 가능 개수가 초과되어 견적을 보낼 수 없습니다',
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
                                  '견적서 보내기',
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

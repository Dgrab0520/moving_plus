import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/order_data.dart';
import 'package:moving_plus/datas/order_list_data.dart';
import 'package:moving_plus/models/order_model.dart';

final controller = Get.put(ReactiveController());

class Request_Received extends StatefulWidget {
  const Request_Received({Key? key}) : super(key: key);

  @override
  _Request_ReceivedState createState() => _Request_ReceivedState();
}

class _Request_ReceivedState extends State<Request_Received> {
  List<Order> order = [];
  bool _isLoading = false;

  //Pro Order List 불러오기
  getOrder() {
    OrderList_Data.getOrder(controller.pro.value.pro_id).then((value) {
      setState(() {
        order = value;
      });
      print(order);
      if (value.length == 0) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  //Customer Order List 불러오기
  getCusOrder() {
    OrderList_Data.get_CusOrder(controller.pro.value.pro_id).then((value) {
      setState(() {
        order = value;
      });
      if (value.length == 0) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  //Customer OrderList Delete
  deleteOrder(String orderId) {
    OrderData.deleteOrder(orderId).then((value) {
      if (value == "success") {
        Get.snackbar("성공", "보낸 요청을 삭제했습니다");
        print("Delete Success");
      } else {
        print("Delete Fail");
      }
    });
  }

  @override
  void initState() {
    if (controller.pro.value.type == 'cus') {
      getCusOrder();
    } else {
      getOrder();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            controller.pro.value.type == 'cus' ? '보낸 요청서' : '받은 요청서',
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
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: order.length,
                itemBuilder: (_, int index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xFFcccccc),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF025595),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  order[index].service_type,
                                  style: TextStyle(
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                                controller.pro.value.type == 'pro'
                                    ? order[index].isOrder != "None"
                                        ? const Text(
                                            "   이미 보낸 견적",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          )
                                        : Container()
                                    : order[index].order_status == "disable"
                                        ? const Text(
                                            "   비활성화된 견적",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 10,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          )
                                        : Container(),
                              ],
                            ),
                            Text(
                              '${order[index].order_date}'.substring(0, 10),
                              style: TextStyle(
                                fontFamily: 'NanumSquareR',
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${order[index].user_name}',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'NanumSquareR',
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${order[index].address}',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'NanumSquareR',
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  order[index].service_type,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  order[index].space_type,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  order[index].space_size,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  '전체',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 20,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFFE9E9E9),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  order[index].address.split(" ")[0],
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.pro.value.type == 'cus'
                                ? Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        print(order[index].order_id);
                                        deleteOrder(order[index].order_id);

                                        getCusOrder();
                                      },
                                      child: Container(
                                        width: 165,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE9E9E9),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 0.5,
                                              color: Color(0xFFCCCCCC),
                                            )),
                                        child: Center(
                                          child: Text(
                                            '삭제',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            controller.pro.value.type == 'cus'
                                ? SizedBox(width: 10)
                                : SizedBox(width: 0),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      '/request_form/true?order_id=${order[index].order_id}');
                                },
                                child: Container(
                                  width: 165,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF025595),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '자세히 보기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })
            : Container(
                margin: EdgeInsets.only(bottom: 200.0),
                child: Center(
                  child: Text(controller.pro.value.type == 'cus'
                      ? '보낸 요청서가 없습니다'
                      : '받은 요청서가 없습니다'),
                ),
              ));
  }
}

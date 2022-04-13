import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/final_order_data.dart';
import 'package:moving_plus/models/final_order_model.dart';

import 'api.dart';

final controller = Get.put(ReactiveController());

class P_Transaction_Breakdown extends StatefulWidget {
  const P_Transaction_Breakdown({Key? key}) : super(key: key);

  @override
  _P_Transaction_BreakdownState createState() =>
      _P_Transaction_BreakdownState();
}

class _P_Transaction_BreakdownState extends State<P_Transaction_Breakdown> {
  List<Finals> fin = [];
  bool _isLoading = false;

  finalOrder() {
    FinalOrder_Data.selectFinals(controller.pro.value.pro_id).then((value) {
      setState(() {
        fin = value;
      });
      print(fin);
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

  @override
  void initState() {
    finalOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '거래 내역',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '거래 내역',
                        style:
                            TextStyle(fontFamily: 'NanumSquareB', fontSize: 15),
                      ),
                      SizedBox(width: 8),
                      Text('| 총 ${fin.length} 건',
                          style: TextStyle(
                            fontSize: 13,
                          )),
                    ],
                  ),
                  SizedBox(height: 3),
                  SizedBox(height: 20),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.89,
                    child: ListView.builder(
                      itemCount: fin.length,
                      itemBuilder: (_, int index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: 5.0, bottom: 15.0, right: 3.0, left: 3.0),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F5F8),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: Color(0xFF444444),
                                          fontFamily: 'NanumSquareEB',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        '${fin[index].status}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFf777777),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            fin[index].service_type == ""
                                                ? "개인문의"
                                                : '${Api().findMainCategory(fin[index].service_type)} | ${fin[index].service_type}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xfF777777),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${fin[index].final_price}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xfF025595),
                                                  fontFamily: 'NanumSquareB',
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Color(0xFF025595),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'C',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontFamily: 'Jalnan',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    '${fin[index].final_date}',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

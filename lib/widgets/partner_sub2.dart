import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/pages/p_portfolio_edit_page.dart';

class Partner_Sub2 extends StatelessWidget {
  Partner_Sub2({Key? key}) : super(key: key);
  final controller = Get.put(Pro_Data());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isBestLoading
        ? SizedBox(
            width: Get.width,
            height: 330,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: controller.proBest.length,
              itemBuilder: (_, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(PortfolioEdit_Page(),
                        arguments: controller.proBest[index].pro_id);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(bottom: 10.0),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.network(
                                "http://211.110.44.91/plus/pro_profile/${controller.proBest[index].profile_img}",
                                width: 60,
                                height: 60),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${controller.proBest[index].com_name}',
                                    style: TextStyle(
                                      color: Color(0xFF444444),
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '총 공사 20건',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Row(
                                    children: [
                                      Image.asset("assets/star1.png",
                                          width: 13, height: 13),
                                      Text('4.7',
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      Text('(10개)',
                                          style: TextStyle(
                                            fontSize: 8,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    controller.proBest[index].pro_service1 != ""
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 7, right: 7),
                                            height: 17,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF444444),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  '${controller.proBest[index].pro_service3}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    controller.proBest[index].pro_service1 != ""
                                        ? SizedBox(width: 3)
                                        : SizedBox(width: 0),
                                    controller.proBest[index].pro_service2 != ""
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 7, right: 7),
                                            height: 17,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF444444),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  '${controller.proBest[index].pro_service3}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    controller.proBest[index].pro_service2 != ""
                                        ? SizedBox(width: 3)
                                        : SizedBox(width: 0),
                                    controller.proBest[index].pro_service3 != ""
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 7, right: 7),
                                            height: 17,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF444444),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  '${controller.proBest[index].pro_service3}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    controller.proBest[index].pro_service3 != ""
                                        ? SizedBox(width: 3)
                                        : SizedBox(width: 0),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 7, right: 7),
                                      height: 17,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF031D63),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('카드결제',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 7,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 7, right: 7),
                                      height: 17,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF031D63),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('현금영수증',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 7,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.asset("assets/p_img2-1.png",
                                width: 60, height: 60),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          ));
  }
}

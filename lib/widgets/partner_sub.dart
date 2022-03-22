import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/pages/p_portfolio_edit_page.dart';

class Partner_Sub extends StatelessWidget {
  Partner_Sub({Key? key}) : super(key: key);
  final controller = Get.put(Pro_Data());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isAlliLoading
        ? SizedBox(
            width: Get.width,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: controller.proAlli.length,
              itemBuilder: (_, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(PortfolioEdit_Page(),
                        arguments: controller.proAlli[index].pro_id);
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
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            foregroundImage: NetworkImage(
                                "http://211.110.44.91/plus/pro_profile/${controller.proAlli[index].profile_img}"),
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
                                    controller.proAlli[index].com_name,
                                    style: TextStyle(
                                      color: Color(0xFF444444),
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 30,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF025595),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '인기',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    '총 공사 ${controller.proAlli[index].finalCount}건',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Row(
                                    children: [
                                      Image.asset("assets/star1.png",
                                          width: 13, height: 13),
                                      Text(controller.proAlli[index].reviewAvg,
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      Text(
                                          '(${controller.proAlli[index].reviewCount}개)',
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
                                    controller.proAlli[index].pro_service1 != ""
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
                                                  controller.proAlli[index]
                                                      .pro_service1,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    controller.proAlli[index].pro_service1 != ""
                                        ? SizedBox(width: 3)
                                        : SizedBox(width: 0),
                                    controller.proAlli[index].pro_service2 != ""
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
                                                  controller.proAlli[index]
                                                      .pro_service2,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    controller.proAlli[index].pro_service2 != ""
                                        ? SizedBox(width: 3)
                                        : SizedBox(width: 0),
                                    controller.proAlli[index].pro_service3 != ""
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
                                                  controller.proAlli[index]
                                                      .pro_service3,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7,
                                                    fontFamily: 'NanumSquareR',
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                    // controller.proAlli[index].pro_service3 != ""
                                    //     ? SizedBox(width: 3)
                                    //     : SizedBox(width: 0),
                                    // Container(
                                    //   padding:
                                    //       EdgeInsets.only(left: 7, right: 7),
                                    //   height: 17,
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xFF031D63),
                                    //     borderRadius: BorderRadius.circular(15),
                                    //   ),
                                    //   child: Center(
                                    //     child: Text('카드결제',
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 7,
                                    //           fontFamily: 'NanumSquareR',
                                    //         )),
                                    //   ),
                                    // ),
                                    // SizedBox(width: 3),
                                    // Container(
                                    //   padding:
                                    //       EdgeInsets.only(left: 7, right: 7),
                                    //   height: 17,
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xFF031D63),
                                    //     borderRadius: BorderRadius.circular(15),
                                    //   ),
                                    //   child: Center(
                                    //     child: Text('현금영수증',
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 7,
                                    //           fontFamily: 'NanumSquareR',
                                    //         )),
                                    //   ),
                                    // ),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "http://211.110.44.91/plus/portfolio_file/${controller.proAlli[index].portfolioFileName}${controller.proAlli[index].portfolioFileType}",
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE6E5E5),
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 60,
                                  height: 60,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(child: const CircularProgressIndicator()));
  }
}

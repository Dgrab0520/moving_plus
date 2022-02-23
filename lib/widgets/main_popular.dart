import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/popular_data.dart';
import 'package:moving_plus/pages/api.dart';

import 'p_login.dart';

class MainPopular extends StatelessWidget {
  MainPopular({Key? key}) : super(key: key);

  final popularController = Get.put(PopularData());

  @override
  Widget build(BuildContext context) {
    return Obx(() => popularController.isPopularLoading
        ? popularController.popular.isNotEmpty
            ? SizedBox(
                height: (110 * (popularController.popular.length / 2).round())
                    .toDouble(),
                child: GridView.builder(
                    itemCount: popularController.popular.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 16 / 9,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if (controller.pro.value.type == "cus") {
                            Get.toNamed(
                                '/request_estimage/true?serviceType=${popularController.popular[index]}');
                          }
                        },
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Api().findCategoryImage(
                                    popularController.popular[index])),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                width: Get.width,
                                padding:
                                    const EdgeInsets.only(top: 7, bottom: 7),
                                decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 8.0),
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 7),
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF444444),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                              '#${Api().findMainCategory(popularController.popular[index])}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontFamily: 'NanumSquareR',
                                              )),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: const EdgeInsets.only(
                                            left: 3.0, right: 8),
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 7),
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                              '#${popularController.popular[index]}',
                                              style: const TextStyle(
                                                color: Color(0xFF444444),
                                                fontSize: 9,
                                                fontFamily: 'NanumSquareR',
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('입주플러스의 첫번째 이용자가 되보세요.',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'NanumSquareB',
                      )),
                ),
              )
        : const Center(
            child: CircularProgressIndicator(),
          ));
  }
}

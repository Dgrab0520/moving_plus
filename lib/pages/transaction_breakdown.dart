import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/transaction_data.dart';

import 'api.dart';

class TransactionBreakdown extends StatelessWidget {
  TransactionBreakdown({Key? key}) : super(key: key);
  final transactionController = Get.put(TransActionData());
  @override
  Widget build(BuildContext context) {
    transactionController.getTransaction();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '거래 내역',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF025595),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '거래 내역',
                    style: TextStyle(fontFamily: 'NanumSquareB', fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      print('xx');
                    },
                    child: Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF025595),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '필터',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF025595),
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Obx(
                    () => Text('총 ${transactionController.transAction.length}건',
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                  ),
                  const SizedBox(width: 8),
                  const Text('12.1-12.31',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF777777),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => transactionController.isTransActionLoading
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: transactionController.transAction.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.network(
                                            "http://211.110.44.91/plus/pro_profile/${transactionController.transAction[index].profileImg}",
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 250,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    transactionController
                                                        .transAction[index]
                                                        .proName,
                                                    style: const TextStyle(
                                                      color: Color(0xFF444444),
                                                      fontFamily:
                                                          'NanumSquareEB',
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    transactionController
                                                        .transAction[index]
                                                        .finalDate,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFf777777),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${Api().findMainCategory(transactionController.transAction[index].proServiceType)} | ${transactionController.transAction[index].proServiceType}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xfF777777),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      '계약금',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'NanumSquareR',
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${transactionController.transAction[index].finalFee}원',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    transactionController.transAction[index]
                                                .reviewRating !=
                                            0.0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/star1.png',
                                                      width: 12,
                                                      height: 12),
                                                  SizedBox(width: 3),
                                                  Image.asset(
                                                      'assets/star1.png',
                                                      width: 12,
                                                      height: 12),
                                                  SizedBox(width: 3),
                                                  Image.asset(
                                                      'assets/star1.png',
                                                      width: 12,
                                                      height: 12),
                                                  SizedBox(width: 3),
                                                  Image.asset(
                                                      'assets/star1.png',
                                                      width: 12,
                                                      height: 12),
                                                  SizedBox(width: 3),
                                                  Image.asset(
                                                      'assets/star1.png',
                                                      width: 12,
                                                      height: 12),
                                                  SizedBox(width: 7),
                                                  Text(
                                                    '5.00 ',
                                                    style: TextStyle(
                                                      color: Color(0xFF025595),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    '/ 5.00',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 100,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color:
                                                      const Color(0xFF929292),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '후기 작성 완료',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                '후기를 작성해주세요.',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF777777),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  print('xx');
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color:
                                                        const Color(0xFF025595),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '후기 작성 하기',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'NanumSquareB',
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
                            }))
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

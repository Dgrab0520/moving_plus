import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/datas/review_data.dart';
import 'package:moving_plus/datas/transaction_data.dart';

import '../controllers/Getx_ProController.dart';
import 'api.dart';

class TransactionBreakdown extends StatelessWidget {
  TransactionBreakdown({Key? key}) : super(key: key);
  final transactionController = Get.put(TransActionData());
  final userController = Get.put(ReactiveController());

  @override
  Widget build(BuildContext context) {
    transactionController.selectedDate = DateTime.now();
    transactionController.selectedDate2 = DateTime.now();
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
                      Get.defaultDialog(
                        title: "필터",
                        titleStyle:
                            TextStyle(fontFamily: 'NanumSquareB', fontSize: 15),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () =>
                                  transactionController.selectDate(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xFF025595),
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Obx(
                                    () => Text(
                                      DateFormat("MM.dd").format(
                                          transactionController.selectedDate),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8),
                              child: Text('-'),
                            ),
                            InkWell(
                              onTap: () =>
                                  transactionController.selectDate2(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xFF025595),
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Obx(
                                    () => Text(
                                      DateFormat("MM.dd").format(
                                          transactionController.selectedDate2),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        confirm: ElevatedButton(
                          onPressed: () {
                            transactionController.getTransactionRange(
                                transactionController.selectedDate,
                                transactionController.selectedDate2);
                            Get.back();
                          },
                          child: const Text(
                            "필터 적용",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF025595),
                          ),
                        ),
                      );
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
              Obx(
                () => Row(
                  children: [
                    Text('총 ${transactionController.transAction.length}건',
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                    const SizedBox(width: 8),
                    transactionController.isAll
                        ? const Text("전체 기간",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF777777),
                            ))
                        : Text(
                            '${DateFormat("MM.dd").format(transactionController.selectedDate)}-${DateFormat("MM.dd").format(transactionController.selectedDate2)}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF777777),
                            )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => transactionController.isTransActionLoading
                    ? transactionController.transAction.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount:
                                    transactionController.transAction.length,
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
                                          offset: const Offset(0,
                                              3), // changes position of shadow
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
                                                          color:
                                                              Color(0xFF444444),
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
                                                          color:
                                                              Color(0xFf777777),
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
                                                        color:
                                                            Color(0xfF777777),
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
                                                        const SizedBox(
                                                            width: 5),
                                                        Text(
                                                          '${transactionController.transAction[index].finalFee}원',
                                                          style:
                                                              const TextStyle(
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          RatingBar.builder(
                                                            initialRating:
                                                                transactionController
                                                                    .transAction[
                                                                        index]
                                                                    .reviewRating,
                                                            minRating: 1,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemSize: 14,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2.0),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                            updateOnDrag: false,
                                                            ignoreGestures:
                                                                true,
                                                          ),
                                                          SizedBox(width: 7),
                                                          Text(
                                                            '${transactionController.transAction[index].reviewRating} ',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF025595),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                          Text(
                                                            '/ 5.0',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      color: const Color(
                                                          0xFF929292),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                      TextEditingController
                                                          review =
                                                          TextEditingController();
                                                      double ratingStars = 0.0;
                                                      Get.defaultDialog(
                                                          radius: 5.0,
                                                          title: "후기",
                                                          titleStyle: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'NanumSquareB',
                                                          ),
                                                          content: Container(
                                                            width: Get.width,
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  TextField(
                                                                    controller:
                                                                        review,
                                                                    maxLines: 7,
                                                                    maxLength:
                                                                        500,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                      color: Colors
                                                                          .black87,
                                                                      fontFamily:
                                                                          'NanumSquareB',
                                                                    ),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          '후기를 작성해주세요',
                                                                      hintStyle: TextStyle(
                                                                          fontSize:
                                                                              13.0,
                                                                          color:
                                                                              Colors.black54),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            width:
                                                                                0.8,
                                                                            color:
                                                                                Colors.grey),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                1.0,
                                                                            color:
                                                                                Color(0xFF025595)),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  RatingBar
                                                                      .builder(
                                                                    initialRating:
                                                                        3,
                                                                    minRating:
                                                                        1,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    allowHalfRating:
                                                                        true,
                                                                    itemCount:
                                                                        5,
                                                                    itemPadding:
                                                                        EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                4.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                                _) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber,
                                                                    ),
                                                                    glow: false,
                                                                    onRatingUpdate:
                                                                        (rating) {
                                                                      ratingStars =
                                                                          rating;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        20.0,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              Get.width * 0.3,
                                                                          height:
                                                                              40.0,
                                                                          color:
                                                                              Colors.grey,
                                                                          child: const Center(
                                                                              child: Text(
                                                                            '취소',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 13,
                                                                              fontFamily: 'NanumSquareB',
                                                                            ),
                                                                          )),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10.0,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          print(review.text +
                                                                              ratingStars.toString());
                                                                          var trans =
                                                                              transactionController.transAction[index];
                                                                          Review_Data.putReview(trans.estimateId, trans.proId, userController.pro.value.pro_id, ratingStars.toString(), review.text)
                                                                              .then((value) {
                                                                            if (value ==
                                                                                "success") {
                                                                              Get.back();
                                                                            } else {
                                                                              Get.snackbar("실패", "리뷰 작성을 실패했습니다");
                                                                            }
                                                                          });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              Get.width * 0.3,
                                                                          height:
                                                                              40.0,
                                                                          color:
                                                                              Color(0xFF025595),
                                                                          child: const Center(
                                                                              child: Text(
                                                                            '작성하기',
                                                                            style:
                                                                                TextStyle(
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
                                                    child: Container(
                                                      width: 100,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color: const Color(
                                                            0xFF025595),
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
                            child: Text(
                              "거래 내역이 없습니다",
                              style: TextStyle(
                                  fontFamily: 'NanumSquareB', fontSize: 15),
                            ),
                          )
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

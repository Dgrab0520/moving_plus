import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moving_plus/pages/api.dart';

import '../datas/cus_transaction_data.dart';

class CReview extends StatelessWidget {
  CReview({Key? key}) : super(key: key);

  final cusReviewController = Get.put(CusTransActionData());

  @override
  Widget build(BuildContext context) {
    cusReviewController.selectedDate = DateTime.now();
    cusReviewController.selectedDate2 = DateTime.now();
    cusReviewController.getTransaction();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '후기 내역',
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '후기 내역',
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
                                  cusReviewController.selectDate(context),
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
                                          cusReviewController.selectedDate),
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
                                  cusReviewController.selectDate2(context),
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
                                          cusReviewController.selectedDate2),
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
                            cusReviewController.getTransactionRange(
                                cusReviewController.selectedDate,
                                cusReviewController.selectedDate2);
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
              SizedBox(height: 3),
              Obx(
                () => Row(
                  children: [
                    Text('총 ${cusReviewController.transAction.length}건',
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                    const SizedBox(width: 8),
                    cusReviewController.isAll
                        ? const Text("전체 기간",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF777777),
                            ))
                        : Text(
                            '${DateFormat("MM.dd").format(cusReviewController.selectedDate)}-${DateFormat("MM.dd").format(cusReviewController.selectedDate2)}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF777777),
                            )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => cusReviewController.isTransActionLoading
                    ? cusReviewController.transAction.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount:
                                    cusReviewController.transAction.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ReviewBox(index: index);
                                }))
                        : const Center(
                            child: Text(
                              "후기 내역이 없습니다",
                              style: TextStyle(
                                  fontFamily: 'NanumSquareB', fontSize: 15),
                            ),
                          )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewBox extends StatefulWidget {
  const ReviewBox({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  bool isOpen = false;
  int index = 0;
  final cusReviewController = Get.put(CusTransActionData());

  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        //height: 167,
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
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    "http://211.110.44.91/plus/pro_profile/${cusReviewController.transAction[index].profileImg}",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cusReviewController.transAction[index].comName,
                            style: const TextStyle(
                              color: Color(0xFF444444),
                              fontFamily: 'NanumSquareEB',
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            DateFormat("yyyy.MM.dd").format(cusReviewController
                                .transAction[index].registerDate),
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFf777777),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${Api().findMainCategory(cusReviewController.transAction[index].proServiceType)} | ${cusReviewController.transAction[index].proServiceType}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xfF777777),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating:
                          cusReviewController.transAction[index].reviewPoint,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 14,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      updateOnDrag: false,
                      ignoreGestures: true,
                    ),
                    SizedBox(width: 7),
                    Text(
                      '${cusReviewController.transAction[index].reviewPoint} ',
                      style: TextStyle(
                        color: Color(0xFF025595),
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
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      cusReviewController.transAction[index].reviewContent,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      softWrap: true,
                      maxLines: isOpen ? null : 2,
                    ),
                  ),
                  Transform.rotate(
                    angle: isOpen ? math.pi / 2 : 0,
                    child: const Icon(Icons.arrow_forward_ios,
                        size: 20, color: Color(0xFF7A7A7A)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

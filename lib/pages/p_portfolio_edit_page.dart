import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/pro_data_portfolio_file.dart';
import 'package:moving_plus/datas/pro_intro_data.dart';
import 'package:moving_plus/datas/review_data.dart';
import 'package:moving_plus/models/portfolio_file_model.dart';
import 'package:moving_plus/models/pro_intro_model.dart';
import 'package:moving_plus/models/review_model.dart';
import 'package:moving_plus/pages/chat_personal.dart';
import 'package:moving_plus/pages/detailscreen.dart';
import 'package:moving_plus/pages/p_portfolio_page.dart';

final controller = Get.put(ReactiveController());

class PortfolioEdit_Page extends StatefulWidget {
  const PortfolioEdit_Page({Key? key}) : super(key: key);

  @override
  _PortfolioEdit_PageState createState() => _PortfolioEdit_PageState();
}

class _PortfolioEdit_PageState extends State<PortfolioEdit_Page> {
  bool _isBtn = true; //파트너 정보
  List<Pro_Intro> pro = [];
  List<Review> review = [];
  bool _isLoading = false;
  bool _isLoading2 = false;

  List<PortfolioFile> files = [];

  TextEditingController Controller1 = TextEditingController();

  double average = 0.0;

  double width_star = 0.0;
  double width_user_star = 0.0;

  String proId = Get.arguments;

  @override
  void initState() {
    getPro_Detail();
    getReview();
    getProPhotos();
    super.initState();
  }

  getProPhotos() {
    ProDataPortfolioFile.getPortfolioFiles(proId).then((value) {
      print(value);
      if (value.isNotEmpty) {
        files = value;
      }
    });
  }

  getPro_Detail() {
    ProIntro_Data.getProIntro(proId).then((value) {
      setState(() {
        pro = value;
      });
      if (value.isEmpty) {
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

  getReview() {
    Review_Data.getReview(proId).then((value) {
      setState(() {
        review = value;
      });
      if (value.isEmpty) {
        _isLoading2 = false;
      } else {
        _isLoading2 = true;
        sum();
      }
    });
  }

  void sum() {
    for (int i = 0; i < review.length; i++) {
      print('aa');
      average += double.parse('${review[i].review_point}');
      print('aa$average');
    }
    average = average / review.length;
    width_star = average.toInt() * 20;
    print('final : $average');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '포트폴리오',
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
          ? SingleChildScrollView(
              child: Container(
                width: Get.width,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 30.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  'http://211.110.44.91/plus/pro_profile/${pro[0].profile_img}'),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '${pro[0].com_name}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              pro[0].pro_email,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            controller.pro.value.pro_id == pro[0].pro_id ||
                                    controller.pro.value.type == 'cus'
                                ? InkWell(
                                    onTap: () {
                                      if (controller.pro.value.type == "pro") {
                                        Get.to(ProFolio_Page(
                                          pro: pro[0],
                                        ));
                                      } else {
                                        Get.to(ChatPersonal(proId: proId));
                                      }
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF025595),
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Center(
                                        child: Text(
                                          controller.pro.value.type == "cus"
                                              ? '문의하기'
                                              : '수정하기',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${pro[0].estimateCount}개',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'NanumSquareEB',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      '받은 견적서',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${review.length}개',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'NanumSquareEB',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      '리뷰',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFFC107),
                                          size: 15.0,
                                        ),
                                        SizedBox(
                                          width: 1.0,
                                        ),
                                        Text(
                                          average.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      '고객 만족도',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )),

                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isBtn = true;
                                      });
                                    },
                                    child: Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(
                                            _isBtn ? 0xFF025595 : 0xFFe6e6e6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '파트너 정보',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: _isBtn
                                                  ? Colors.white
                                                  : Colors.black87),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isBtn = false;
                                      });
                                    },
                                    child: Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(
                                            _isBtn ? 0xFFe6e6e6 : 0xFF025595),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '파트너 후기',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: _isBtn
                                                  ? Colors.black87
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    _isBtn
                        ? Container(
                            child: Column(
                              children: [
                                Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '소개글',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Controller1.text =
                                                  pro[0].pro_intro;
                                              Get.defaultDialog(
                                                  radius: 5.0,
                                                  title: "수정하기",
                                                  titleStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                  content: Container(
                                                    width: Get.width,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                Controller1,
                                                            maxLines: 7,
                                                            maxLength: 500,
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colors
                                                                  .black87,
                                                              fontFamily:
                                                                  'NanumSquareB',
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  '파트너 소개를 해주세요',
                                                              hintStyle: TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  color: Colors
                                                                      .black54),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                        width:
                                                                            0.8,
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 1.0,
                                                                    color: Color(
                                                                        0xFF025595)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20.0,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.3,
                                                                  height: 40.0,
                                                                  color: Colors
                                                                      .grey,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Cancel',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          'NanumSquareB',
                                                                    ),
                                                                  )),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.3,
                                                                  height: 40.0,
                                                                  color: Color(
                                                                      0xFF025595),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Edit',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          'NanumSquareB',
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
                                            child: Text(
                                              '수정',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        pro[0].pro_intro,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.0,
                                        ),
                                        maxLines: 5,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      Text(
                                        '기본정보',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text('대표자'),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child:
                                                Text('|   ${pro[0].pro_name}'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text('시공지역'),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              '|   ${pro[0].pro_area1} / ${pro[0].pro_area2} / ${pro[0].pro_area3} / ${pro[0].pro_area4} / ${pro[0].pro_area5}',
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text('경력'),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              '|   ${pro[0].pro_career}',
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text('결제'),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              '|   ${pro[0].pro_pay}',
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      Text(
                                        '제공 서비스',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: <Widget>[
                                            pro[0].pro_service1 != ''
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Color(
                                                              0xffd4d4d4)),
                                                      color: Color(0xFFe6e6e6),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${pro[0].pro_service1}',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                        ),
                                                        softWrap: false,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            pro[0].pro_service2 != ''
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Color(
                                                              0xffd4d4d4)),
                                                      color: Color(0xFFe6e6e6),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${pro[0].pro_service2}',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                        ),
                                                        softWrap: false,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            pro[0].pro_service3 != ''
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Color(
                                                              0xffd4d4d4)),
                                                      color: Color(0xFFe6e6e6),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${pro[0].pro_service3}',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                        ),
                                                        softWrap: false,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            pro[0].pro_service4 != ''
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Color(
                                                              0xffd4d4d4)),
                                                      color: Color(0xFFe6e6e6),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${pro[0].pro_service4}',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                        ),
                                                        softWrap: false,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            pro[0].pro_service5 != ''
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Color(
                                                              0xffd4d4d4)),
                                                      color: Color(0xFFe6e6e6),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${pro[0].pro_service5}',
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                        ),
                                                        softWrap: false,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      Text(
                                        '사진 및 동영상',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 80,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: files.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(DetailScreen(
                                                      path:
                                                          "http://211.110.44.91/plus/portfolio_file/${files[index].fileName}${files[index].fileType}"));
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Image.network(
                                                    "http://211.110.44.91/plus/portfolio_file/${files[index].fileName}${files[index].fileType}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Divider(
                                  thickness: 1.5,
                                  height: 1.0,
                                  color: Color(0xFFe6e6e6),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      width: Get.width,
                                      height: 60.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: width_star,
                                            height: 50.0,
                                            child: ListView.builder(
                                              itemCount: average
                                                  .toInt(), //average.round(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (_, int index) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xFFFFC107),
                                                      size: 18.0,
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                              width: 120.0,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    '${average.toStringAsFixed(2)}',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    '( ${review.length}개 )',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      height: 1.0,
                                      color: Color(0xFFe6e6e6),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: 300.0,
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: review.length > 5
                                              ? 5
                                              : review.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              width: Get.width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25.0,
                                                  vertical: 10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        '${review[index].cus_id}'
                                                            .split('@')[0],
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Container(
                                                        width: double.parse(review[
                                                                        index]
                                                                    .review_point)
                                                                .toInt() *
                                                            15,
                                                        height: 20.0,
                                                        child: ListView.builder(
                                                          itemCount: double
                                                                  .parse(review[
                                                                          index]
                                                                      .review_point)
                                                              .toInt(),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (_, int index) {
                                                            return Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xFFFFC107),
                                                                  size: 14.0,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Text(
                                                        '${review[index].register_date}'
                                                            .split(" ")[0],
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    '${review[index].review_content}',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13,
                                                    ),
                                                    maxLines: 4,
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Divider(
                                                    thickness: 0.5,
                                                    height: 1.0,
                                                    color: Color(0xFFe6e6e6),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60.0,
                                ),
                                review.length > 5
                                    ? InkWell(
                                        onTap: () {
                                          print('후기 더보기');
                                          setState(() {
                                            _isBtn = false;
                                          });
                                        },
                                        child: Container(
                                          width: 120.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                  width: 0.8,
                                                  color: Color(0xFFCCCCCC)),
                                              color: Color(0xFFF9F9F9)),
                                          child: Center(
                                            child: Text(
                                              '후기 더보기',
                                              style: TextStyle(
                                                color: Color(0xFF025595),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 80.0,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: Get.height * 0.7,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: Get.width,
                                  height: 60.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: width_star,
                                        height: 50.0,
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: average
                                              .toInt(), //average.round(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (_, int index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFC107),
                                                  size: 18.0,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                          width: 120.0,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '${average.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '( ${review.length}개 )',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  height: 1.0,
                                  color: Color(0xFFe6e6e6),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * 0.5,
                                  child: ListView.builder(
                                      itemCount:
                                          review.length > 5 ? 5 : review.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          width: Get.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${review[index].cus_id}'
                                                        .split('@')[0],
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: double.parse(review[
                                                                    index]
                                                                .review_point)
                                                            .toInt() *
                                                        15,
                                                    height: 20.0,
                                                    child: ListView.builder(
                                                      itemCount: double.parse(
                                                              review[index]
                                                                  .review_point)
                                                          .toInt(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (_, int index) {
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xFFFFC107),
                                                              size: 14.0,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    '${review[index].register_date}'
                                                        .split(" ")[0],
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                '${review[index].review_content}',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13,
                                                ),
                                                maxLines: 4,
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Divider(
                                                thickness: 0.5,
                                                height: 1.0,
                                                color: Color(0xFFe6e6e6),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                    //         width: Get.width,
                    //         height: 60.0,
                    //         child: Row(
                    //           children: <Widget>[
                    //             Text('4.7',
                    //               style: TextStyle(
                    //                 color:Colors.black87,
                    //                 fontWeight: FontWeight.w600,
                    //                 fontSize: 25,
                    //               ),
                    //             ),
                    //
                    //             SizedBox(width: 10.0,),
                    //
                    //             Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Row(
                    //                   children: [
                    //                     Icon(Icons.star, color: Color(0xFFFFC107), size: 20.0,),
                    //                     Icon(Icons.star, color: Color(0xFFFFC107), size: 20.0,),
                    //                     Icon(Icons.star, color: Color(0xFFFFC107), size: 20.0,),
                    //                     Icon(Icons.star, color: Color(0xFFFFC107), size: 20.0,),
                    //                     Icon(Icons.star, color: Color(0xFFFFC107), size: 20.0,),
                    //                   ],
                    //                 ),
                    //                 SizedBox(height:3),
                    //                 Text('총 20개 리뷰',
                    //                   style: TextStyle(
                    //                     color:Colors.black87,
                    //                     fontSize: 12,
                    //                   ),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //             SizedBox(width: 10.0,),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //       Divider(
                    //         thickness: 0.5,
                    //         height: 1.0,
                    //         color: Color(0xFFe6e6e6),
                    //       ),
                    //       Container(
                    //         width: Get.width,
                    //         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    //         child: Column(
                    //           children: <Widget>[
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: <Widget>[
                    //                 Text('이도원', style:
                    //                 TextStyle(
                    //                   color:Colors.black87,
                    //                   fontSize: 16,
                    //                 ),
                    //                 ),
                    //                 SizedBox(width: 10.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 SizedBox(width: 10.0,),
                    //                 Text('2022.01.03', style:
                    //                 TextStyle(
                    //                   color:Colors.black54,
                    //                   fontSize: 15,
                    //                 ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(height: 5.0,),
                    //             Text('궁금했던 부분들든 자세히 설명해 주시고 말하지 않은 부분들도 센스있게 마감해 주시는 것 보고 완공시기가 될 수록 마음에 드는 정도가 더 커녔네요. 수고 많으셨습니다! 감사합니다.', style:
                    //             TextStyle(
                    //               color:Colors.black87,
                    //               fontSize: 14,
                    //             ),
                    //               maxLines: 4,
                    //               softWrap: false,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //
                    //       Divider(
                    //         thickness: 0.5,
                    //         height: 1.0,
                    //         color: Color(0xFFe6e6e6),
                    //       ),
                    //
                    //       Container(
                    //         width: Get.width,
                    //         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    //         child: Column(
                    //           children: <Widget>[
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: <Widget>[
                    //                 Text('이도원', style:
                    //                 TextStyle(
                    //                   color:Colors.black87,
                    //                   fontSize: 16,
                    //                 ),
                    //                 ),
                    //                 SizedBox(width: 10.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 SizedBox(width: 10.0,),
                    //                 Text('2022.01.03', style:
                    //                 TextStyle(
                    //                   color:Colors.black54,
                    //                   fontSize: 15,
                    //                 ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(height: 5.0,),
                    //             Text('궁금했던 부분들든 자세히 설명해 주시고 말하지 않은 부분들도 센스있게 마감해 주시는 것 보고 완공시기가 될 수록 마음에 드는 정도가 더 커녔네요. 수고 많으셨습니다! 감사합니다.', style:
                    //             TextStyle(
                    //               color:Colors.black87,
                    //               fontSize: 14,
                    //             ),
                    //               maxLines: 4,
                    //               softWrap: false,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //
                    //       Divider(
                    //         thickness: 0.5,
                    //         height: 1.0,
                    //         color: Color(0xFFe6e6e6),
                    //       ),
                    //
                    //       Container(
                    //         width: Get.width,
                    //         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    //         child: Column(
                    //           children: <Widget>[
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: <Widget>[
                    //                 Text('이도원', style:
                    //                 TextStyle(
                    //                   color:Colors.black87,
                    //                   fontSize: 16,
                    //                 ),
                    //                 ),
                    //                 SizedBox(width: 10.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
                    //                 SizedBox(width: 10.0,),
                    //                 Text('2022.01.03', style:
                    //                 TextStyle(
                    //                   color:Colors.black54,
                    //                   fontSize: 15,
                    //                 ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(height: 5.0,),
                    //             Text('궁금했던 부분들든 자세히 설명해 주시고 말하지 않은 부분들도 센스있게 마감해 주시는 것 보고 완공시기가 될 수록 마음에 드는 정도가 더 커녔네요. 수고 많으셨습니다! 감사합니다.', style:
                    //             TextStyle(
                    //               color:Colors.black87,
                    //               fontSize: 14,
                    //             ),
                    //               maxLines: 4,
                    //               softWrap: false,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //
                    //       Divider(
                    //         thickness: 0.5,
                    //         height: 1.0,
                    //         color: Color(0xFFe6e6e6),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

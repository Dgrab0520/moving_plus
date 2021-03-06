import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/alarm_setting_data.dart';
import 'package:moving_plus/datas/pro_data_portfolio_file.dart';
import 'package:moving_plus/datas/pro_intro_data.dart';
import 'package:moving_plus/datas/review_data.dart';
import 'package:moving_plus/models/portfolio_file_model.dart';
import 'package:moving_plus/models/pro_intro_model.dart';
import 'package:moving_plus/models/review_model.dart';
import 'package:moving_plus/pages/chat_personal.dart';
import 'package:moving_plus/pages/detailscreen_gallery.dart';
import 'package:moving_plus/pages/network_image_widget.dart';
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
  String area = '|   ';

  TextEditingController Controller1 = TextEditingController();

  double average = 0.0;

  double width_star = 0.0;
  double width_user_star = 0.0;

  String proId = Get.arguments;

  final heartController = Get.put(AlarmSettingData());

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
        setState(() {
          files = value;
        });
      }
    });
  }

  getPro_Detail() {
    ProIntro_Data.getProIntro(proId).then((value) {
      setState(() {
        pro = value;
        area = '|   ';
        area += pro[0].pro_area1;
        if (pro[0].pro_area2 != "") area += " / ${pro[0].pro_area2}";
        if (pro[0].pro_area3 != "") area += " / ${pro[0].pro_area3}";
        if (pro[0].pro_area4 != "") area += " / ${pro[0].pro_area4}";
        if (pro[0].pro_area5 != "") area += " / ${pro[0].pro_area5}";
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
      average += double.parse(review[i].review_point);
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
        title: const Text(
          '포트폴리오',
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
      body: _isLoading
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 30.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  'http://211.110.44.91/plus/pro_profile/${pro[0].profile_img}'),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              pro[0].com_name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              pro[0].pro_email,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            controller.pro.value.pro_id == pro[0].pro_id ||
                                    controller.pro.value.type == 'cus'
                                ? InkWell(
                                    onTap: () async {
                                      if (controller.pro.value.type == "pro") {
                                        var result = await Get.to(ProFolio_Page(
                                          pro: pro[0],
                                          review: review.length.toString(),
                                          avg: average.toStringAsFixed(1),
                                        ));
                                        print("result : $result");
                                        if (result != null) {
                                          pro = [];
                                          files = [];
                                          getPro_Detail();
                                          getProPhotos();
                                        }
                                      } else {
                                        Get.to(ChatPersonal(proId: proId));
                                      }
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF025595),
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Center(
                                        child: Text(
                                          controller.pro.value.type == "cus"
                                              ? '문의하기'
                                              : '수정하기',
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
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
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'NanumSquareEB',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    const Text(
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
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'NanumSquareEB',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    const Text(
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
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFFFC107),
                                          size: 15.0,
                                        ),
                                        const SizedBox(
                                          width: 1.0,
                                        ),
                                        Text(
                                          average.toStringAsFixed(2),
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    const Text(
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
                    Column(
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
                    _isBtn
                        ? Column(
                            children: [
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          '소개글',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                        // TextButton(
                                        //   onPressed: () {
                                        //     Controller1.text = pro[0].pro_intro;
                                        //     Get.defaultDialog(
                                        //         radius: 5.0,
                                        //         title: "수정하기",
                                        //         titleStyle: TextStyle(
                                        //           color: Colors.grey,
                                        //           fontSize: 15,
                                        //           fontFamily: 'NanumSquareB',
                                        //         ),
                                        //         content: Container(
                                        //           width: Get.width,
                                        //           child: SingleChildScrollView(
                                        //             child: Column(
                                        //               children: [
                                        //                 TextField(
                                        //                   controller:
                                        //                       Controller1,
                                        //                   maxLines: 7,
                                        //                   maxLength: 500,
                                        //                   style: TextStyle(
                                        //                     fontSize: 14.0,
                                        //                     color:
                                        //                         Colors.black87,
                                        //                     fontFamily:
                                        //                         'NanumSquareB',
                                        //                   ),
                                        //                   decoration:
                                        //                       InputDecoration(
                                        //                     hintText:
                                        //                         '파트너 소개를 해주세요',
                                        //                     hintStyle: TextStyle(
                                        //                         fontSize: 13.0,
                                        //                         color: Colors
                                        //                             .black54),
                                        //                     enabledBorder:
                                        //                         OutlineInputBorder(
                                        //                       borderSide:
                                        //                           const BorderSide(
                                        //                               width:
                                        //                                   0.8,
                                        //                               color: Colors
                                        //                                   .grey),
                                        //                       borderRadius:
                                        //                           BorderRadius
                                        //                               .circular(
                                        //                                   5),
                                        //                     ),
                                        //                     focusedBorder:
                                        //                         OutlineInputBorder(
                                        //                       borderSide: BorderSide(
                                        //                           width: 1.0,
                                        //                           color: Color(
                                        //                               0xFF025595)),
                                        //                       borderRadius:
                                        //                           BorderRadius
                                        //                               .circular(
                                        //                                   5),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 SizedBox(
                                        //                   height: 20.0,
                                        //                 ),
                                        //                 Row(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment
                                        //                           .center,
                                        //                   children: [
                                        //                     InkWell(
                                        //                       onTap: () {
                                        //                         Get.back();
                                        //                       },
                                        //                       child: Container(
                                        //                         width:
                                        //                             Get.width *
                                        //                                 0.3,
                                        //                         height: 40.0,
                                        //                         color:
                                        //                             Colors.grey,
                                        //                         child: Center(
                                        //                             child: Text(
                                        //                           'Cancel',
                                        //                           style:
                                        //                               TextStyle(
                                        //                             color: Colors
                                        //                                 .white,
                                        //                             fontSize:
                                        //                                 13,
                                        //                             fontFamily:
                                        //                                 'NanumSquareB',
                                        //                           ),
                                        //                         )),
                                        //                       ),
                                        //                     ),
                                        //                     SizedBox(
                                        //                       width: 10.0,
                                        //                     ),
                                        //                     InkWell(
                                        //                       onTap: () {
                                        //                         Get.back();
                                        //                       },
                                        //                       child: Container(
                                        //                         width:
                                        //                             Get.width *
                                        //                                 0.3,
                                        //                         height: 40.0,
                                        //                         color: Color(
                                        //                             0xFF025595),
                                        //                         child: Center(
                                        //                             child: Text(
                                        //                           'Edit',
                                        //                           style:
                                        //                               TextStyle(
                                        //                             color: Colors
                                        //                                 .white,
                                        //                             fontSize:
                                        //                                 13,
                                        //                             fontFamily:
                                        //                                 'NanumSquareB',
                                        //                           ),
                                        //                         )),
                                        //                       ),
                                        //                     )
                                        //                   ],
                                        //                 )
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ));
                                        //   },
                                        //   child: Text(
                                        //     '수정',
                                        //     style: TextStyle(
                                        //       fontSize: 14,
                                        //       fontFamily: 'NanumSquareB',
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      pro[0].pro_intro,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                      ),
                                      maxLines: 5,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 35.0,
                                    ),
                                    const Text(
                                      '기본정보',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Expanded(
                                          flex: 2,
                                          child: Text('대표자'),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text('|   ${pro[0].pro_name}'),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Expanded(
                                          flex: 2,
                                          child: Text('시공지역'),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            area,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Expanded(
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
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Expanded(
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
                                    const SizedBox(
                                      height: 35.0,
                                    ),
                                    const Text(
                                      '제공 서비스',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          pro[0].pro_service1 != ''
                                              ? Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                    color:
                                                        const Color(0xFFe6e6e6),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      pro[0].pro_service1,
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          pro[0].pro_service2 != ''
                                              ? Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                    color:
                                                        const Color(0xFFe6e6e6),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      pro[0].pro_service2,
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          pro[0].pro_service3 != ''
                                              ? Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                    color:
                                                        const Color(0xFFe6e6e6),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      pro[0].pro_service3,
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          pro[0].pro_service4 != ''
                                              ? Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                    color:
                                                        const Color(0xFFe6e6e6),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      pro[0].pro_service4,
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          pro[0].pro_service5 != ''
                                              ? Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                    color:
                                                        const Color(0xFFe6e6e6),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      pro[0].pro_service5,
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 35.0,
                                    ),
                                    const Text(
                                      '사진',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      height: 80,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: files.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                onTap: () {
                                                  Get.to(DetailScreenGallery(
                                                    files: files,
                                                    pageController:
                                                        PageController(
                                                            initialPage: index),
                                                  ));
                                                },
                                                child: Container(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: NetworkImageWidget(
                                                            url:
                                                                "http://211.110.44.91/plus/portfolio_file/${files[index].fileName}${files[index].fileType}"),
                                                      ),
                                                    )));
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Divider(
                                thickness: 1.5,
                                height: 1.0,
                                color: Color(0xFFe6e6e6),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    width: Get.width,
                                    height: 60.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
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
                                                children: const [
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
                                        SizedBox(
                                            width: 120.0,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  average.toStringAsFixed(2),
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  '( ${review.length}개 )',
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0.5,
                                    height: 1.0,
                                    color: Color(0xFFe6e6e6),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    height: 300.0,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: review.length > 5
                                            ? 5
                                            : review.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.symmetric(
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
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      review[index]
                                                          .cus_id
                                                          .split('@')[0],
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    SizedBox(
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
                                                            children: const [
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
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      review[index]
                                                          .register_date
                                                          .split(" ")[0],
                                                      style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  review[index].review_content,
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13,
                                                  ),
                                                  maxLines: 4,
                                                  softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                const Divider(
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
                              const SizedBox(
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
                                                color: const Color(0xFFCCCCCC)),
                                            color: const Color(0xFFF9F9F9)),
                                        child: const Center(
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
                              const SizedBox(
                                height: 80.0,
                              ),
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                width: Get.width,
                                height: 60.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width_star,
                                      height: 50.0,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            average.toInt(), //average.round(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, int index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
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
                                    SizedBox(
                                        width: 120.0,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              average.toStringAsFixed(2),
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              '( ${review.length}개 )',
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                height: 1.0,
                                color: Color(0xFFe6e6e6),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: review
                                    .map((e) => Container(
                                          width: Get.width,
                                          padding: const EdgeInsets.symmetric(
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
                                                    e.cus_id.split('@')[0],
                                                    style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  SizedBox(
                                                    width: double.parse(
                                                                e.review_point)
                                                            .toInt() *
                                                        15,
                                                    height: 20.0,
                                                    child: ListView.builder(
                                                      itemCount: double.parse(
                                                              e.review_point)
                                                          .toInt(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (_, int index) {
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
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
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    e.register_date
                                                        .split(" ")[0],
                                                    style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                e.review_content,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13,
                                                ),
                                                maxLines: 4,
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              const Divider(
                                                thickness: 0.5,
                                                height: 1.0,
                                                color: Color(0xFFe6e6e6),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';

import 'p_portfolio_edit_page.dart';

class Partner_Search extends StatefulWidget {
  const Partner_Search({Key? key}) : super(key: key);

  @override
  _Partner_SearchState createState() => _Partner_SearchState();
}

class _Partner_SearchState extends State<Partner_Search> {
  List<String> map = [
    '서울',
    '경기',
    '부산',
    '대구',
    '인천',
    '광주',
    '대전',
    '울산',
    '세종특별자치시',
    '강원',
    '충북',
    '충남',
    '전북',
    '전남',
    '경북',
    '경남',
    '제주특별자치도',
  ];

  List<String> category = [
    "입주 청소",
    "이사 청소",
    "인테리어 청소",
    "거주 청소",
    "준공 청소",
    "정기 청소",
    "화재 청소",
    "쓰레기집 청소",
    '간판 청소',
    '외벽 청소',
    "학교/관공서 청소",
    "상가 청소",
    "주방후드 청소",
    "기타 청소",
    "올 인테리어",
    "필름 인테리어",
    "탄성 코트",
    "도배",
    "장판/마루",
    "페인트",
    "방충망 교체",
    "욕실 인테리어",
    "타일 교체",
    "중문",
    "커튼/블라인드",
    "바닥 매트",
    "기타 인테리어",
    "줄눈",
    "실리콘 오염 방지",
    "욕실 나노 코팅",
    "상판 연마 코팅",
    "엔지니어스톤 코팅",
    "바닥 왁싱",
    "단열 차단 필름",
    "정리정돈",
    "새집 증후군",
    "곰팡이 제거",
    "기타 홈스타일링",
    "조명 설치",
    "에어컨 이전 설치",
    "에어컨 분해 청소",
    "세탁기 분해 청소",
    "냉장고 청소",
    "맞춤 가구 제작",
    "붙박이장 설치",
    "시스템 행거",
    "펜트리 선반 설치",
    "매트리스 케어",
    "쇼파천갈이",
    "보일러 설치",
    "배관수리 및 청소",
    "기타 가전/가구",
    "정수기 렌탈",
    "에어컨 렌탈",
    "비데 렌탈",
    "매트리스 렌탈",
    "쇼파 렌탈",
    "TV 렌탈",
    "안마의자 렌탈",
    "운동기구 렌탈",
    "의류 관리기 렌탈",
    "식기 세척기 렌탈",
    "음식물 분쇄기 렌탈",
    "청소기 렌탈",
    "공기 청정기 렌탈",
    "기타 렌탈",
    "사전점검",
    "소독/방역",
    "기타 서비스",

  ];

  String selectedValue1 = "";
  String selectedValue2 = "";
  String condition = "";

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final controller = Get.put(Pro_Data());

  @override
  void initState() {
    controller.get_Pro(condition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '파트너 찾기',
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 15.0, right: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 220,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset('assets/placeholder_g.png',
                                      width: 17, height: 17),
                                ),
                                const Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: Text(
                                      '지역',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 45,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: map
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return '지역을 골라주세요.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                              setState(() {
                                selectedValue1 = value.toString();
                              });
                            },
                            onSaved: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 220,
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        children: [
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              //Add isDense true and zero Padding.
                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              //Add more decoration as you want here
                              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                            ),
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset('assets/categories.png',
                                      width: 17, height: 17),
                                ),
                                const Expanded(
                                    flex: 4,
                                    child: Center(
                                      child: Text(
                                        '카테고리',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    )),
                              ],
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 45,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: category
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return '카테고리를 골라주세요.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                              setState(() {
                                selectedValue2 = value.toString();
                              });
                            },
                            onSaved: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("isProLoading : ${controller.isProLoading}");
                      print('$selectedValue1 $selectedValue2');
                      if (selectedValue1 != "" && selectedValue2 == "") {
                        print('selected1');
                        setState(() {
                          condition =
                              "WHERE pro_area1 = '$selectedValue1' OR pro_area2 = '$selectedValue1' OR pro_area3 = '$selectedValue1'";
                        });
                      } else if (selectedValue2 != "" && selectedValue1 == "") {
                        print('selected2');
                        setState(() {
                          condition =
                              "WHERE '$selectedValue2' REGEXP pro_service1 OR '$selectedValue2' REGEXP pro_service2 OR '$selectedValue2' REGEXP pro_service3 OR '$selectedValue2' REGEXP pro_service4 OR '$selectedValue2' REGEXP pro_service5";
                        });
                      } else if (selectedValue2 != "" && selectedValue1 != "") {
                        print('selected1 & selected2');
                        setState(() {
                          condition =
                              "WHERE ('$selectedValue2' REGEXP pro_service1 OR '$selectedValue2' REGEXP pro_service2 OR '$selectedValue2' REGEXP pro_service3 OR '$selectedValue2' REGEXP pro_service4 OR '$selectedValue2' REGEXP pro_service5) AND (pro_area1 = '$selectedValue1' OR pro_area2 = '$selectedValue1' OR pro_area3 = '$selectedValue1')";
                        });
                      }
                      controller.get_Pro(condition);
                      print(condition);
                    },
                    child: Container(
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF025595),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: const Center(
                        child: Text(
                          '검색',
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Obx(
            () => controller.isProLoading
                ? controller.pro.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.pro.length,
                          itemBuilder: (_, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(const PortfolioEdit_Page(),
                                    arguments: controller.pro[index].pro_id);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 20.0),
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        foregroundImage: NetworkImage(
                                            "http://211.110.44.91/plus/pro_profile/${controller.pro[index].profile_img}"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                controller.pro[index].com_name,
                                                style: const TextStyle(
                                                  color: Color(0xFF444444),
                                                  fontFamily: 'NanumSquareEB',
                                                  fontSize: 14,
                                                ),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(width: 5),
                                              controller.pro[index].index ==
                                                      'alli'
                                                  ? Container(
                                                      width: 30,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF025595),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          '인기',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '총 공사 ${controller.pro[index].finalCount}건',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/star1.png",
                                                      width: 13,
                                                      height: 13),
                                                  Text(
                                                      controller
                                                          .pro[index].reviewAvg,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      )),
                                                  Text(
                                                      '(${controller.pro[index].reviewCount}개)',
                                                      style: const TextStyle(
                                                        fontSize: 8,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                controller.pro[index]
                                                            .pro_service1 !=
                                                        ""
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 7,
                                                                right: 7),
                                                        height: 17,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF444444),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              controller
                                                                  .pro[index]
                                                                  .pro_service1,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 7,
                                                                fontFamily:
                                                                    'NanumSquareR',
                                                              )),
                                                        ),
                                                      )
                                                    : Container(),
                                                controller.pro[index]
                                                            .pro_service1 !=
                                                        ""
                                                    ? const SizedBox(width: 3)
                                                    : const SizedBox(width: 0),
                                                controller.pro[index]
                                                            .pro_service2 !=
                                                        ""
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 7,
                                                                right: 7),
                                                        height: 17,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF444444),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              controller
                                                                  .pro[index]
                                                                  .pro_service2,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 7,
                                                                fontFamily:
                                                                    'NanumSquareR',
                                                              )),
                                                        ),
                                                      )
                                                    : Container(),
                                                controller.pro[index]
                                                            .pro_service2 !=
                                                        ""
                                                    ? const SizedBox(width: 3)
                                                    : const SizedBox(width: 0),
                                                controller.pro[index]
                                                            .pro_service3 !=
                                                        ""
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 7,
                                                                right: 7),
                                                        height: 17,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF444444),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              controller
                                                                  .pro[index]
                                                                  .pro_service3,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 7,
                                                                fontFamily:
                                                                    'NanumSquareR',
                                                              )),
                                                        ),
                                                      )
                                                    : Container(),
                                                // controller.pro[index]
                                                //             .pro_service3 !=
                                                //         ""
                                                //     ? const SizedBox(width: 3)
                                                //     : const SizedBox(width: 0),
                                                // Container(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           left: 7, right: 7),
                                                //   height: 17,
                                                //   decoration: BoxDecoration(
                                                //     color:
                                                //         const Color(0xFF031D63),
                                                //     borderRadius:
                                                //         BorderRadius.circular(
                                                //             15),
                                                //   ),
                                                //   child: const Center(
                                                //     child: Text('카드결제',
                                                //         style: TextStyle(
                                                //           color: Colors.white,
                                                //           fontSize: 7,
                                                //           fontFamily:
                                                //               'NanumSquareR',
                                                //         )),
                                                //   ),
                                                // ),
                                                // const SizedBox(width: 3),
                                                // Container(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           left: 7, right: 7),
                                                //   height: 17,
                                                //   decoration: BoxDecoration(
                                                //     color:
                                                //         const Color(0xFF031D63),
                                                //     borderRadius:
                                                //         BorderRadius.circular(
                                                //             15),
                                                //   ),
                                                //   child: const Center(
                                                //     child: Text('현금영수증',
                                                //         style: TextStyle(
                                                //           color: Colors.white,
                                                //           fontSize: 7,
                                                //           fontFamily:
                                                //               'NanumSquareR',
                                                //         )),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          "http://211.110.44.91/plus/portfolio_file/${controller.pro[index].portfolioFileName}${controller.pro[index].portfolioFileType}",
                                          fit: BoxFit.cover,
                                          width: 60,
                                          height: 60,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFE6E5E5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                    : SizedBox(
                        width: Get.width,
                        height: 200.0,
                        child: const Center(
                          child: Text('검색 결과가 없습니다'),
                        ),
                      )
                : const Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}

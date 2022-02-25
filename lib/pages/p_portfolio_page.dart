import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../datas/pro_data_portfolio_file.dart';
import '../datas/pro_data_update.dart';
import '../models/pro_intro_model.dart';

class ProFolio_Page extends StatefulWidget {
  const ProFolio_Page(
      {Key? key, required this.pro, required this.review, required this.avg})
      : super(key: key);
  final Pro_Intro pro;
  final String review;
  final String avg;
  @override
  _ProFolio_PageState createState() => _ProFolio_PageState();
}

class _ProFolio_PageState extends State<ProFolio_Page> {
  late Pro_Intro pro;
  String serviceText = "";
  String areaText = "";

  final formKeyService = GlobalKey<FormState>();
  List _myServices = [];

  final formKeyArea = GlobalKey<FormState>();
  List _myAreas = [];

  List<Widget> photoAndVideo = [];
  List<File> files = [];
  List<String> types = [];
//region
  List myArea = [
    {
      "display": "서울특별시",
      "value": "서울",
    },
    {
      "display": "부산광역시",
      "value": "부산",
    },
    {
      "display": "대구광역시",
      "value": "대구",
    },
    {
      "display": "인천광역시",
      "value": "인천",
    },
    {
      "display": "광주광역시",
      "value": "광주",
    },
    {
      "display": "대전광역시",
      "value": "대전",
    },
    {
      "display": "울산광역시",
      "value": "울산",
    },
    {
      "display": "세종특별자치시",
      "value": "세종특별자치시",
    },
    {
      "display": "경기도",
      "value": "경기",
    },
    {
      "display": "강원도",
      "value": "강원",
    },
    {
      "display": "충청북도",
      "value": "충북",
    },
    {
      "display": "충청남도",
      "value": "충남",
    },
    {
      "display": "전라북도",
      "value": "전북",
    },
    {
      "display": "전라남도",
      "value": "전남",
    },
    {
      "display": "경상북도",
      "value": "경북",
    },
    {
      "display": "경상남도",
      "value": "경남",
    },
    {
      "display": "제주특별자치도",
      "value": "제주특별자치도",
    },
  ];
  //endregion
  //myArea
//region
  List myService = [
    {
      "display": "입주청소",
      "value": "입주 청소",
    },
    {
      "display": "이사청소",
      "value": "이사 청소",
    },
    {
      "display": "인테리어청소",
      "value": "인테리어 청소",
    },
    {
      "display": "거주청소",
      "value": "거주 청소",
    },
    {
      "display": "준공청소",
      "value": "준공 청소",
    },
    {
      "display": "정기청소",
      "value": "정기 청소",
    },
    {
      "display": "화재청소",
      "value": "화재 청소",
    },
    {
      "display": "쓰레기집청소",
      "value": "쓰레기집 청소",
    },
    {
      "display": "간판청소",
      "value": "간판 청소",
    },
    {
      "display": "외벽청소",
      "value": "외벽 청소",
    },
    {
      "display": "학교 / 관공서청소",
      "value": "학교/관공서 청소",
    },
    {
      "display": "상가청소",
      "value": "상가 청소",
    },
    {
      "display": "주방후드청소",
      "value": "주방후드 청소",
    },
    {
      "display": "기타청소",
      "value": "기타 청소",
    },
    {
      "display": "올인테리어",
      "value": "올 인테리어",
    },
    {
      "display": "필름인테리어",
      "value": "필름 인테리어",
    },
    {
      "display": "탄성코트",
      "value": "탄성 코트",
    },
    {
      "display": "도배",
      "value": "도배",
    },
    {
      "display": "장판 / 마루",
      "value": "장판 & 마루",
    },
    {
      "display": "페인트",
      "value": "페인트",
    },
    {
      "display": "방충망교체",
      "value": "방충망 교체",
    },
    {
      "display": "욕실인테리어",
      "value": "욕실 인테리어",
    },
    {
      "display": "타일교체",
      "value": "타일 교체",
    },
    {
      "display": "중문",
      "value": "중문",
    },
    {
      "display": "커튼 / 블라인드",
      "value": "커튼 & 블라인드",
    },
    {
      "display": "바닥매트",
      "value": "바닥 매트",
    },
    {
      "display": "기타인테리어",
      "value": "기타 인테리어",
    },
    {
      "display": "줄눈",
      "value": "줄눈",
    },
    {
      "display": "실리콘오염방지",
      "value": "실리콘 오염 방지",
    },
    {
      "display": "욕실나노코팅",
      "value": "욕실 나노 코팅",
    },
    {
      "display": "상판연마코팅",
      "value": "상판 연마 코팅",
    },
    {
      "display": "엔지니어스톤코팅",
      "value": "엔지니어스톤 코팅",
    },
    {
      "display": "바닥왁싱",
      "value": "바닥 왁싱",
    },
    {
      "display": "단열차단필름",
      "value": "단열 차단 필름",
    },
    {
      "display": "정리정돈",
      "value": "정리정돈",
    },
    {
      "display": "새집증후군",
      "value": "새집 증후군",
    },
    {
      "display": "곰팡이제거",
      "value": "곰팡이 제거",
    },
    {
      "display": "기타홈스타일링",
      "value": "기타 홈스타일링",
    },
    {
      "display": "조명설치",
      "value": "조명 설치",
    },
    {
      "display": "에어컨이전설치",
      "value": "에어컨 이전 설치",
    },
    {
      "display": "에어컨분해청소",
      "value": "에어컨 분해 청소",
    },
    {
      "display": "세탁기분해청소",
      "value": "세탁기 분해 청소",
    },
    {
      "display": "냉장고청소",
      "value": "냉장고 청소",
    },
    {
      "display": "맞춤가구제작",
      "value": "맞춤 가구 제작",
    },
    {
      "display": "붙박이장설치",
      "value": "붙박이장 설치",
    },
    {
      "display": "시스템행거",
      "value": "시스템 행거",
    },
    {
      "display": "펜트리선반설치",
      "value": "펜트리 선반 설치",
    },
    {
      "display": "메트리스케어",
      "value": "메트리스 케어",
    },
    {
      "display": "쇼파천갈이",
      "value": "쇼파천갈이",
    },
    {
      "display": "보일러설치",
      "value": "보일러 설치",
    },
    {
      "display": "배관수리및청소",
      "value": "배관수리 및 청소",
    },
    {
      "display": "기타 가전 & 가구",
      "value": "기타 가전 & 가구",
    },
    {
      "display": "정수기렌탈",
      "value": "정수기 렌탈",
    },
    {
      "display": "에어컨렌탈",
      "value": "에어컨 렌탈",
    },
    {
      "display": "비데렌탈",
      "value": "비데 렌탈",
    },
    {
      "display": "메트리스렌탈",
      "value": "메트리스 렌탈",
    },
    {
      "display": "쇼파렌탈",
      "value": "쇼파 렌탈",
    },
    {
      "display": "TV렌탈",
      "value": "TV 렌탈",
    },
    {
      "display": "안마의자렌탈",
      "value": "안마의자 렌탈",
    },
    {
      "display": "운동기구렌탈",
      "value": "운동기구 렌탈",
    },
    {
      "display": "의류관리기렌탈",
      "value": "의류 관리기 렌탈",
    },
    {
      "display": "식기세척기렌탈",
      "value": "식기 세척기 렌탈",
    },
    {
      "display": "음식물분쇄기렌탈",
      "value": "음식물 분쇄기 렌탈",
    },
    {
      "display": "청소기렌탈",
      "value": "청소기 렌탈",
    },
    {
      "display": "공기청정기렌탈",
      "value": "공기 청정기 렌탈",
    },
    {
      "display": "기타렌탈",
      "value": "기타 렌탈",
    },
    {
      "display": "사전점검",
      "value": "사전점검",
    },
    {
      "display": "소독 / 방역",
      "value": "소독 & 방역",
    },
    {
      "display": "기타서비스",
      "value": "기타 서비",
    },
  ];
  //endregion
  //myService

  getProPhotos() {
    ProDataPortfolioFile.getPortfolioFiles(widget.pro.pro_id).then((value) {
      print(value);
      if (value.isNotEmpty) {
        for (int i = 0; i < value.length; i++) {
          setState(() {
            photoAndVideo.add(Image.network(
              "http://211.110.44.91/plus/portfolio_file/${value[i].fileName}${value[i].fileType}",
              fit: BoxFit.cover,
            ));
          });
        }
      }
    });
  }

  @override
  void initState() {
    pro = widget.pro;

    _myServices.add(pro.pro_service1);
    if (pro.pro_service2 != "") _myServices.add(pro.pro_service2);
    if (pro.pro_service3 != "") _myServices.add(pro.pro_service3);
    if (pro.pro_service4 != "") _myServices.add(pro.pro_service4);
    if (pro.pro_service5 != "") _myServices.add(pro.pro_service5);

    _myAreas.add(pro.pro_area1);
    if (pro.pro_area2 != "") _myAreas.add(pro.pro_area2);
    if (pro.pro_area3 != "") _myAreas.add(pro.pro_area3);

    print(_myServices);
    print(_myAreas);

    getProPhotos();

    super.initState();
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40.0,
                            backgroundImage: NetworkImage(
                                'http://211.110.44.91/plus/pro_profile/${pro.profile_img}'),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                pro.com_name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'NanumSquareEB',
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '받은 견적서 ${pro.estimateCount}개',
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
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
                                    widget.avg,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                  const SizedBox(
                                    width: 1.0,
                                  ),
                                  Text(
                                    '(${widget.review}개)',
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {
                        TextEditingController intro = TextEditingController();
                        intro.text = pro.pro_intro;
                        Get.defaultDialog(
                          title: "소개글",
                          titleStyle: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'NanumSquareEB',
                          ),
                          content: TextField(
                            controller: intro,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          confirm: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pro.pro_intro = intro.text;
                              });
                              Get.back();
                            },
                            child: const Text("확인"),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF025595),
                            ),
                          ),
                          cancel: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("취소"),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF025595),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '소개글',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    pro.pro_intro,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        TextEditingController proName = TextEditingController();
                        TextEditingController career = TextEditingController();
                        TextEditingController pay = TextEditingController();
                        proName.text = pro.pro_name;
                        career.text =
                            pro.pro_career == "" ? "신입" : pro.pro_career;
                        pay.text = pro.pro_pay;
                        Get.dialog(AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text(
                                          '대표자',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: TextField(
                                          controller: proName,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 3,
                                          minLines: 1,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'NanumSquareB'),
                                        )),
                                    Expanded(flex: 1, child: Container()),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text(
                                          '전문분야',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Form(
                                          key: formKeyService,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              MultiSelectFormField(
                                                autovalidate:
                                                    AutovalidateMode.always,
                                                chipBackGroundColor:
                                                    const Color(0xFF025595),
                                                chipLabelStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 12.0),
                                                dialogTextStyle:
                                                    const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0),
                                                checkBoxActiveColor:
                                                    Colors.blue,
                                                checkBoxCheckColor:
                                                    Colors.white,
                                                dialogShapeBorder:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12.0))),
                                                title: const Text(
                                                  "나의 서비스",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.length == 0) {
                                                    return '제공 가능한 서비스를 한개 이상 선택해주세요';
                                                  } else if (value.length > 5) {
                                                    return '최대 5개까지 선택 할 수 있습니다';
                                                  }
                                                  return null;
                                                },
                                                dataSource: myService,
                                                textField: 'display',
                                                valueField: 'value',
                                                okButtonLabel: 'OK',
                                                cancelButtonLabel: 'CANCEL',
                                                hintWidget: const Text(
                                                  '',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                                initialValue: _myServices,
                                                onSaved: (value) {
                                                  if (value.length <= 5) {
                                                    setState(() {
                                                      _myServices = value;
                                                      print(_myServices);
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text(
                                          '시공지역',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Form(
                                          key: formKeyArea,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              MultiSelectFormField(
                                                autovalidate:
                                                    AutovalidateMode.always,
                                                chipBackGroundColor:
                                                    const Color(0xFF025595),
                                                chipLabelStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 12.0),
                                                dialogTextStyle:
                                                    const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0),
                                                checkBoxActiveColor:
                                                    Colors.blue,
                                                checkBoxCheckColor:
                                                    Colors.white,
                                                dialogShapeBorder:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12.0))),
                                                title: const Text(
                                                  "서비스 가능 지역",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.length == 0) {
                                                    return '서비스 가능 지역을 한개 이상 선택해주세요';
                                                  } else if (value.length > 3) {
                                                    return '최대 3개까지 선택 할 수 있습니다';
                                                  }
                                                  return null;
                                                },
                                                dataSource: myArea,
                                                textField: 'display',
                                                valueField: 'value',
                                                okButtonLabel: 'OK',
                                                cancelButtonLabel: 'CANCEL',
                                                hintWidget: const Text(
                                                  '',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                                initialValue: _myAreas,
                                                onSaved: (value) {
                                                  if (value.length <= 5) {
                                                    setState(() {
                                                      _myAreas = value;
                                                      print(_myAreas);
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text(
                                          '경력',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: TextField(
                                          controller: career,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 3,
                                          minLines: 1,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'NanumSquareB'),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text(
                                          '결제',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: TextField(
                                          controller: pay,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 3,
                                          minLines: 1,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'NanumSquareB'),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("취소"),
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF025595),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          pro.pro_name = proName.text;
                                          pro.pro_service1 = "";
                                          pro.pro_service2 = "";
                                          pro.pro_service3 = "";
                                          pro.pro_service4 = "";
                                          pro.pro_service5 = "";
                                          pro.pro_service1 = _myServices[0];
                                          if (_myServices.length > 1) {
                                            pro.pro_service2 = _myServices[1];
                                          }
                                          if (_myServices.length > 2) {
                                            pro.pro_service3 = _myServices[2];
                                          }
                                          if (_myServices.length > 3) {
                                            pro.pro_service4 = _myServices[3];
                                          }
                                          if (_myServices.length > 4) {
                                            pro.pro_service5 = _myServices[4];
                                          }

                                          pro.pro_area1 = "";
                                          pro.pro_area2 = "";
                                          pro.pro_area3 = "";
                                          pro.pro_area1 = _myAreas[0];
                                          if (_myAreas.length > 1) {
                                            pro.pro_area2 = _myAreas[1];
                                          }
                                          if (_myAreas.length > 2) {
                                            pro.pro_area3 = _myAreas[2];
                                          }

                                          pro.pro_career = career.text;
                                          pro.pro_pay = pay.text;
                                        });
                                        Get.back();
                                      },
                                      child: const Text("확인"),
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF025595),
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
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '기본정보',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: Text(
                                      '대표자',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      pro.pro_name,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB'),
                                    )),
                                Expanded(flex: 1, child: Container()),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: Text(
                                      '전문분야',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      pro.pro_service1 +
                                          ((pro.pro_service2 == '')
                                              ? ''
                                              : " / ") +
                                          pro.pro_service2 +
                                          ((pro.pro_service3 == '')
                                              ? ''
                                              : " / ") +
                                          pro.pro_service3 +
                                          ((pro.pro_service4 == '')
                                              ? ''
                                              : " / ") +
                                          pro.pro_service4 +
                                          ((pro.pro_service5 == '')
                                              ? ''
                                              : " / ") +
                                          pro.pro_service5,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB'),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: Text(
                                      '시공지역',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      pro.pro_area1 +
                                          ((pro.pro_area2 == '') ? '' : " / ") +
                                          pro.pro_area2 +
                                          ((pro.pro_area3 == '') ? '' : " / ") +
                                          pro.pro_area3,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB'),
                                    )),
                                const Expanded(
                                  flex: 1,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 18,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: Text(
                                      '경력',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      pro.pro_career == ""
                                          ? "신입"
                                          : pro.pro_career,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB'),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Expanded(
                                    flex: 2,
                                    child: Text(
                                      '결제',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      pro.pro_pay,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'NanumSquareB'),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '제공 서비스',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NanumSquareEB',
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 85,
                                    height: 25,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFFF9F9F9),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xFFcccccc),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        pro.pro_service1,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                pro.pro_service2 == ""
                                    ? Container()
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 85,
                                          height: 25,
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFFF9F9F9),
                                            border: Border.all(
                                              width: 1,
                                              color: const Color(0xFFcccccc),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              pro.pro_service2,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                pro.pro_service3 == ""
                                    ? Container()
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 85,
                                          height: 25,
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFFF9F9F9),
                                            border: Border.all(
                                              width: 1,
                                              color: const Color(0xFFcccccc),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              pro.pro_service3,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                pro.pro_service4 == ""
                                    ? Container()
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 85,
                                          height: 25,
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFFF9F9F9),
                                            border: Border.all(
                                              width: 1,
                                              color: const Color(0xFFcccccc),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              pro.pro_service4,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                pro.pro_service5 == ""
                                    ? Container()
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 85,
                                          height: 25,
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFFF9F9F9),
                                            border: Border.all(
                                              width: 1,
                                              color: const Color(0xFFcccccc),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              pro.pro_service5,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '사진 및 동영상',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'NanumSquareEB',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                            type: FileType.media,
                                            allowMultiple: true,
                                            onFileLoading: (value) {
                                              debugPrint(value.toString());
                                            });

                                    if (result != null) {
                                      files = result.paths
                                          .map((path) => File(path!))
                                          .toList();
                                      print(files);
                                      photoAndVideo = [];
                                      for (File file in files) {
                                        print(file.path.split(".").last);
                                        types.add(file.path.split(".").last);
                                        setState(() {
                                          photoAndVideo.add(Image.file(
                                            file,
                                            fit: BoxFit.cover,
                                          ));
                                        });
                                      }
                                      print(photoAndVideo.length);
                                      print(types);
                                    }
                                  },
                                  child: const Text("사진 추가")),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: photoAndVideo.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 90,
                                    height: 90,
                                    margin: const EdgeInsets.only(right: 7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: photoAndVideo[index],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ProDataUpdate.updatePro(
                        pro.pro_id,
                        pro.pro_intro,
                        pro.pro_name,
                        pro.pro_service1,
                        pro.pro_service2,
                        pro.pro_service3,
                        pro.pro_service4,
                        pro.pro_service5,
                        pro.pro_area1,
                        pro.pro_area2,
                        pro.pro_area3,
                        pro.pro_career,
                        pro.pro_pay)
                    .then((value) {
                  if (value == "success") {
                    ProDataPortfolioFile.changePortfolioImage(files, types)
                        .then((value) {
                      Get.back(result: true);
                      Get.snackbar("성공", "프토폴리오를 수정했습니다");
                    });
                  }
                });
              },
              child: Container(
                width: 300,
                height: 45,
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF025595),
                  ),
                  child: const Center(
                    child: Text(
                      '저장하기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ));
  }
}

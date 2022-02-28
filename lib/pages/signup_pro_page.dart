import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/datas/signup_data.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUpPage> {
  final formKey_Service = new GlobalKey<FormState>();
  List? _myServices;
  late String _myServicesResult;

  final formKey_Area = new GlobalKey<FormState>();
  List? _myAreas;
  late String _myAreasResult;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();
  TextEditingController comController = TextEditingController();
  TextEditingController comNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _pwChecked = false;
  bool _idChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  insertSignUp() {
    SignUp_Data.insertSignUp(
      idController.text,
      pwController.text,
      generateRandomString(8),
      comController.text,
      comNoController.text,
      nameController.text,
      phoneController.text,
      _myServices!.length >= 1 ? _myServices![0] : '',
      _myServices!.length >= 2 ? _myServices![1] : '',
      _myServices!.length >= 3 ? _myServices![2] : '',
      _myServices!.length >= 4 ? _myServices![3] : '',
      _myServices!.length >= 5 ? _myServices![4] : '',
      _myAreas!.length >= 1 ? _myAreas![0] : '',
      _myAreas!.length >= 2 ? _myAreas![1] : '',
      _myAreas!.length >= 3 ? _myAreas![2] : '',
    ).then((value) {
      if (value == 'success') {
        print('Insert Sign Up Success');
        Get.offAll(Main_Page(index: 1));
      } else {
        print('Insert Sign Up Fail');
        Get.snackbar("회원가입 실패", "네트워크 상태를 확인해주세요",
            backgroundColor: Color(0xBC000000), colorText: Colors.white);
      }
    });
  }

  //OrderId Random 생성
  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  //Pro_id 중복조회
  idCheck(pro_id) {
    Pro_Data.CheckPro(pro_id).then((value) {
      if (value == 'success') {
        String aa = '사용할 수 있습니다';
        setState(() {
          _idChecked = true;
        });
        Get.defaultDialog(
            title: '중복확인',
            titleStyle: TextStyle(fontSize: 15.0, fontFamily: 'NanumSquareB'),
            content: Column(
              children: [
                Container(
                    child: Text(
                  '입력하신 아이디 \n${idController.text}은(는)\n$aa',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueAccent,
                    fontFamily: 'NanumSquareB',
                  ),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * 0.25,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      } else {
        String aa = '사용할 수 없습니다\n\n다른 아이디를 사용해주세요';
        setState(() {
          _idChecked = false;
        });
        Get.defaultDialog(
            title: '중복확인',
            titleStyle: TextStyle(fontSize: 15.0, fontFamily: 'NanumSquareB'),
            content: Column(
              children: [
                Container(
                    child: Text(
                  '입력하신 아이디 \n${idController.text}은(는)\n$aa',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.deepOrange,
                    fontFamily: 'NanumSquareB',
                  ),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * 0.25,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _myServices = [];
    _myServicesResult = '';
    _myAreas = [];
    _myAreasResult = '';
  }

  _saveFormService() {
    var form = formKey_Service.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myServicesResult = _myServices.toString();
      });
    }
  }

  _saveFormArea() {
    var form = formKey_Area.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myAreasResult = _myAreas.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '회원가입',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'NanumSquareB',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //아이디
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '아이디',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      width: double.infinity,
                                      height: 45,
                                      child: TextField(
                                        controller: idController,
                                        onChanged: (text) {
                                          setState(() {
                                            _idChecked = false;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10.0, bottom: 10, left: 15),
                                          counterStyle: TextStyle(
                                            fontSize: 10,
                                          ),
                                          hintStyle: TextStyle(
                                            fontSize: 10,
                                          ),
                                          hintText: '아이디 이메일을 입력해주세요.',
                                          labelStyle: TextStyle(
                                              color: Color(0xFFACACAC)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFFACACAC)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xFFACACAC)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      )),
                                ),
                                SizedBox(
                                  width: 7.0,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        if (idController.text != "") {
                                          print('중복확인');
                                          idCheck(idController.text);
                                        } else {
                                          Get.snackbar("실패", "아이디를 입력해주세요");
                                        }
                                      },
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1.0,
                                            color: Color(0xFF025595),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '중복확인',
                                            style: TextStyle(
                                              color: Color(0xFF025595),
                                              fontSize: 12,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //비밀번호
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '비밀번호 [10글자 이상 입력해주세요]',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: pwController,
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  onChanged: (text) {
                                    if (text == pwCheckController.text &&
                                        text.isNotEmpty) {
                                      setState(() {
                                        _pwChecked = true;
                                      });
                                    } else {
                                      setState(() {
                                        _pwChecked = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '비밀번호를 입력해주세요',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //비밀번호 확인
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '비밀번호 확인',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: pwCheckController,
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  onChanged: (text) {
                                    if (text == pwController.text &&
                                        text.isNotEmpty) {
                                      setState(() {
                                        _pwChecked = true;
                                      });
                                    } else {
                                      setState(() {
                                        _pwChecked = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '비밀번호를 한번 더 입력해주세요.',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                )),
                            _pwChecked
                                ? Text(
                                    '비밀번호가 일치합니다',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.blueAccent),
                                  )
                                : Text(
                                    '비밀번호가 일치하지 않습니다',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.deepOrange),
                                  ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //업체명
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '업체명',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: comController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '업체명을 입력해주세요.',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //사업자 등록 번호
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '사업자 등록번호',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: comNoController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '업체명을 입력해주세요.',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //담당자 명
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '담당자 이름',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '업체명을 입력해주세요.',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //담당자 번호
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '담당자 연락처',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                                width: double.infinity,
                                height: 45,
                                child: TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.0, bottom: 10, left: 15),
                                    counterStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    hintText: '업체명을 입력해주세요.',
                                    labelStyle:
                                        TextStyle(color: Color(0xFFACACAC)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFACACAC)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      //나의 서비스
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '나의 서비스 [최대 5개]',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Form(
                              key: formKey_Service,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(),
                                    child: MultiSelectFormField(
                                      autovalidate: AutovalidateMode.disabled,
                                      chipBackGroundColor: Color(0xFF025595),
                                      chipLabelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12.0),
                                      dialogTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                      checkBoxActiveColor: Colors.blue,
                                      checkBoxCheckColor: Colors.white,
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Text(
                                        "나의 서비스",
                                        style: TextStyle(fontSize: 12),
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
                                      hintWidget: Text(
                                        '제공 가능한 서비스를 한개 이상 선택해주세요',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      initialValue: _myServices,
                                      onSaved: (value) {
                                        if (value.length == 0) {
                                          return;
                                        } else if (value.length <= 5) {
                                          setState(() {
                                            _myServices = value;
                                          });
                                        } else if (value.length > 5) {
                                          Get.snackbar(
                                              '등록실패', '최대 5개의 서비스를 선택할 수 있습니다',
                                              backgroundColor:
                                                  Color(0xBC000000),
                                              colorText: Colors.white);
                                        }
                                      },
                                    ),
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(8),
                                  //   child: ElevatedButton(
                                  //     child: Text('Save'),
                                  //     onPressed: (){
                                  //
                                  //       print(_myServices![3]);
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      //서비스 가능 지역
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '서비스 가능 지역 [최대 3개]',
                              style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              child: Form(
                                key: formKey_Area,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(),
                                      child: MultiSelectFormField(
                                        autovalidate: AutovalidateMode.disabled,
                                        chipBackGroundColor: Color(0xFF025595),
                                        chipLabelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12.0),
                                        dialogTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0),
                                        checkBoxActiveColor: Colors.blue,
                                        checkBoxCheckColor: Colors.white,
                                        dialogShapeBorder:
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0))),
                                        title: Text(
                                          "서비스 가능 지역",
                                          style: TextStyle(fontSize: 12),
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
                                        hintWidget: Text(
                                          '서비스 가능 지역을 한개 이상 선택해주세요',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        initialValue: _myAreas,
                                        onSaved: (value) {
                                          if (value.length == 0) {
                                            return;
                                          } else if (value.length <= 3) {
                                            setState(() {
                                              _myAreas = value;
                                            });
                                          } else if (value.length > 3) {
                                            Get.snackbar(
                                                '등록실패', '최대 3개의 지역을 선택할 수 있습니다',
                                                backgroundColor:
                                                    Color(0xBC000000),
                                                colorText: Colors.white);
                                          }
                                        },
                                      ),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.all(8),
                                    //   child: ElevatedButton(
                                    //     child: Text('Save'),
                                    //     onPressed: (){
                                    //       _saveFormArea;
                                    //       print(_myAreas![2].isNull ? true : false);
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Checkbox(
                                value: _isChecked1,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked1 = value!;
                                  });
                                },
                                activeColor: Color(0xFF025595),
                              )),
                          Expanded(
                            flex: 5,
                            child: Text(
                              '[필수] 서비스 이용약관에 동의',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      radius: 5.0,
                                      title: '이용약관',
                                      titleStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'NanumSquareR',
                                          fontSize: 14),
                                      content: Container(
                                        margin: EdgeInsets.all(20),
                                        height: Get.height * 0.6,
                                        width: Get.width,
                                        child: SingleChildScrollView(
                                          child: Text(use),
                                        ),
                                      ));
                                },
                                child: Text(
                                  '자세히 보기',
                                  style: TextStyle(
                                      fontSize: 11.0, color: Colors.grey),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Checkbox(
                                value: _isChecked2,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked2 = value!;
                                  });
                                },
                                activeColor: Color(0xFF025595),
                              )),
                          Expanded(
                            flex: 5,
                            child: Text(
                              '[필수] 개인정보 수집 이용에 동의',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      radius: 5.0,
                                      title: '개인정보처리방침',
                                      titleStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'NanumSquareR',
                                          fontSize: 14),
                                      content: Container(
                                        margin: EdgeInsets.all(20),
                                        height: Get.height * 0.6,
                                        width: Get.width,
                                        child: SingleChildScrollView(
                                          child: Text(privacy),
                                        ),
                                      ));
                                },
                                child: Text(
                                  '자세히 보기',
                                  style: TextStyle(
                                      fontSize: 11.0, color: Colors.grey),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    print('회원 가입');
                    _saveFormService();
                    _saveFormArea();
                    if (_myServices!.length > 5) {
                      Get.snackbar("회원가입 실패", "나의 서비스는 최대 5개까지 선택 가능합니다",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else if (_myAreas!.length > 3) {
                      Get.snackbar("회원가입 실패", "서비스 가능 지역 최대 3개까지 선택 가능합니다",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else if (_pwChecked == false ||
                        pwController.text.length < 10) {
                      Get.snackbar("회원가입 실패", "비밀번호를 확인 후 다시 시도해주세요",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else if (_isChecked2 == false || _isChecked1 == false) {
                      Get.snackbar("회원가입 실패", "필수 동의 항목을 확인해주세요",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else if (_idChecked == false) {
                      Get.snackbar("회원가입 실패", "아이디 중복확인 후 다시 시도해주세요",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else if (idController.text.isEmpty ||
                        pwController.text.isEmpty ||
                        comController.text.isEmpty ||
                        comNoController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        phoneController.text.isEmpty) {
                      Get.snackbar("회원가입 실패", "입력하지 않은 항목이 있습니다",
                          backgroundColor: Color(0xBC000000),
                          colorText: Colors.white);
                    } else {
                      insertSignUp();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF025595),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '가입하기',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'NanumSquareB',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  List myService = [
    {
      "display": "청소 전체",
      "value": "청소",
    },
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
      "display": "매트리스케어",
      "value": "매트리스 케어",
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
      "display": "매트리스렌탈",
      "value": "매트리스 렌탈",
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
      "display": "소독 & 방역",
      "value": "소독 & 방역",
    },
    {
      "display": "기타서비스",
      "value": "기타 서비스",
    },
  ];
  String privacy =
      """<입주플러스>('http://입주플러스.com/'이하 '입주플러스')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다. ○ 이 개인정보처리방침은 2022년 02월 20부터 적용됩니다. 


제1조(개인정보의 처리 목적) <입주플러스>('http://입주플러스.com/'이하 '입주플러스')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 
1. 홈페이지 회원가입 및 관리 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다. 
2. 민원사무 처리 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 목적으로 개인정보를 처리합니다. 
3. 재화 또는 서비스 제공 물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 요금결제·정산을 목적으로 개인정보를 처리합니다. 
4. 마케팅 및 광고에의 활용 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다. 


제2조(개인정보의 처리 및 보유 기간) ① < 입주플러스 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다. ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 
1.<홈페이지 회원가입 및 관리> <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<회원 탈퇴 시, 1개월 간 유지 후 파기>까지 위 이용목적을 위하여 보유.이용됩니다. 보유근거 : 이용자 식별 및 본인 여부 확인 예외사유 : 견적 요청 시, 6개월 간 유지 
2.<민원사무 처리> <민원사무 처리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다. 보유근거 : 민원인의 신원 확인, 민원 사항 확인, 사실 조사를 위한 연락 통지, 처리결과 통보 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 
3.<재화 또는 서비스 제공> <재화 또는 서비스 제공>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<5년>까지 위 이용목적을 위하여 보유.이용됩니다. 보유근거 : 물품 배송, 서비스 제공, 청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인 인증, 요금결제/정산 등 관련법령 : 대금결제 및 재화 등의 공급에 관한 기록 : 5년 
4.<마케팅 및 광고에의 활용> <마케팅 및 광고에의 활용>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3개월>까지 위 이용목적을 위하여 보유.이용됩니다. 보유근거 : 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등 관련법령 : 통시비밀보호법 


제3조(개인정보의 제3자 제공) ① < 입주플러스 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다. ② < 입주플러스 >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다. 


제4조(개인정보처리 위탁) ① < 입주플러스 >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. ② < 입주플러스 >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다. 


제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법) ① 정보주체는 입주플러스에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다. ② 제1항에 따른 권리 행사는입주플러스에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 입주플러스은(는) 이에 대해 지체 없이 조치하겠습니다. ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. ⑥ 입주플러스은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 


제6조(처리하는 개인정보의 항목 작성) ① < 입주플러스 >은(는) 다음의 개인정보 항목을 처리하고 있습니다. 1< 홈페이지 회원가입 및 관리 > 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름, SNS 2< 민원사무 처리 > 필수항목 : 이메일, 휴대전화번호, 로그인ID, 이름 3< 재화 또는 서비스 제공 > 필수항목 : 이메일, 휴대전화번호, 자택주소, 로그인ID, 성별, 생년월일, 이름, 신용카드정보, 은행계좌정보, 결제기록, 취소 및 환불 계좌 4< 마케팅 및 광고에의 활용 > 필수항목 : 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보 


제7조(개인정보의 파기) ① < 입주플러스 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 1. 법령 근거 : 2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜 ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다. 
1. 파기절차 < 입주플러스 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 입주플러스 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다. 
2. 파기방법 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다 


제8조(개인정보의 안전성 확보 조치) < 입주플러스 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다. 
1. 정기적인 자체 감사 실시 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다. 
2. 개인정보 취급 직원의 최소화 및 교육 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다. 
3. 개인정보의 암호화 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다. 
4. 개인정보에 대한 접근 제한 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다. 
5. 비인가자에 대한 출입 통제 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다. 


제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항) ① 입주플러스 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. 


제10조 (개인정보 보호책임자) ① 입주플러스 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. ▶ 개인정보 보호책임자 성명 :최현성 연락처 :1533-1196, no200chs@naver.com, ※ 개인정보 보호 담당부서로 연결됩니다. ② 정보주체께서는 입주플러스 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 입주플러스 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다. 


제11조(개인정보 열람청구) 정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. < 입주플러스 >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. ▶ 개인정보 열람청구 접수·처리 부서 담당자 : 최현성 연락처 : 1533-1196, no200chs@naver.com 제12조(권익침해 구제방법) 정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다. 
1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr) 
2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr) 
3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr) 
4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr) 「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다. ※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다. 


제13조(개인정보 처리방침 변경) ① 이 개인정보처리방침은 2022년 02월 20부터 적용됩니다.""";

  String use =
      """1. 고객 계약금은 운영사 (입주플러스_케이에스하우징매니지먼트) 수수료로 일괄 처리 됩니다. 잔금은 직접 수령하시고, 계약금  외 별도의 추가 수수료는 발생하지 않습니다.\n2. 계약금 이외  착수금 및 선금은 계약 고객과 별도 협의 바랍니다.

                            \n3. 계약을 위한  무리한 가격인하는 자제하여 주시고, 합리적은 시공 견적을 제시하여 주시기 바랍니다.

                            \n4. 현장 추가 요금 발생 항목은 문의 고객에게 사전 고지 바랍니다.

                            \n5. 계약 불이행 및 일정, 견적 금액 변경은 계약 고객에게 사전 고지 및 협의 바랍니다.
  
                            \n6. 타 시공과 일정이 겹치지 않도록 사전에 고객에게 다른 시공 여부를 확인바랍니다.
  
                            \n7. 상기 1~6번 항목 불성실 이행시, 계정 정지 및 삭제 등의 불이익이 발생 할 수 있습니다.

                            \n8. 입주플러스 직영 파트너  가입을 희망하시면, 담당자에게 별도 문의 부탁드립니다.
                            \n\n(담당자 1533-1196)
                            \n직영 파트너는 앱 이용 별도 혜택 외 명함, 팀조끼, 차량 홍보스티커(자석형) 등을 별도 제공해 드립니다.\n직영 파트너는 30만원  보증금이 있습니다.(1년 후 연장 의사가 없으면 전액 돌려드립니다.)""";
}

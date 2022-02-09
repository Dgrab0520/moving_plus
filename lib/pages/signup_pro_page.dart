import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/pro_data.dart';
import 'package:moving_plus/datas/signup_data.dart';
import 'package:moving_plus/pages/main_page.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';


class SignUpPage extends StatefulWidget{
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUpPage>{

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


  insertSignUp(){
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
    ).then((value){
      if(value == 'success'){
        print('Insert Sign Up Success');
        Get.offAll(Main_Page(index: 1));
      }else{
        print('Insert Sign Up Fail');
        Get.snackbar("회원가입 실패", "네트워크 상태를 확인해주세요", backgroundColor: Color(0xBC000000), colorText: Colors.white);
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
  idCheck(pro_id){
    Pro_Data.CheckPro(pro_id).then((value){
      if(value == 'success'){
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
                    child: Text('입력하신 아이디 \n${idController.text}은(는)\n$aa', style: TextStyle(fontSize: 15.0, color: Colors.blueAccent, fontFamily: 'NanumSquareB',), textAlign: TextAlign.center,)
                ),
                SizedBox(height: 20.0,),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    width: Get.width*0.25,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                    ),
                    child: Center(child: Text('확인', style: TextStyle(fontSize: 13.0, fontFamily: 'NanumSquareB',),),),
                  ),
                )
              ],
            )
        );
      }else{
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
                    child: Text('입력하신 아이디 \n${idController.text}은(는)\n$aa', style: TextStyle(fontSize: 15.0, color: Colors.deepOrange, fontFamily: 'NanumSquareB',), textAlign: TextAlign.center,)
                ),
                SizedBox(height: 20.0,),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    width: Get.width*0.25,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                    ),
                    child: Center(child: Text('확인', style: TextStyle(fontSize: 13.0, fontFamily: 'NanumSquareB',),),),
                  ),
                )
              ],
            )

        );
      }
    });
  }



  @override
  void initState(){
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
    return Scaffold(
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
              SizedBox(height: 20.0,),
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
                          Text('아이디',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                    width:double.infinity,
                                    height:45,
                                    child: TextField(
                                      controller: idController,
                                      onChanged: (text){
                                        setState(() {
                                          _idChecked = false;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                        counterStyle: TextStyle(
                                          fontSize:10,
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize:10,
                                        ),
                                        hintText: '아이디 이메일을 입력해주세요.',
                                        labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    )
                                ),
                              ),
                              SizedBox(width: 7.0,),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: (){
                                      print('중복확인');
                                      idCheck(idController.text);

                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1.0, color: Color(0xFF025595),),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Center(
                                        child: Text('중복확인',
                                          style:TextStyle(
                                            color: Color(0xFF025595),
                                            fontSize:12,
                                            fontFamily: 'NanumSquareR',
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //비밀번호
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('비밀번호 [10글자 이상 입력해주세요]',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: pwController,
                                obscuringCharacter: '*',
                                obscureText: true,
                                onChanged: (text){
                                  if(text == pwCheckController.text && text.isNotEmpty){
                                    setState(() {
                                      _pwChecked = true;
                                    });
                                  }else{
                                    setState(() {
                                      _pwChecked = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '비밀번호를 입력해주세요',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //비밀번호 확인
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('비밀번호 확인',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: pwCheckController,
                                obscuringCharacter: '*',
                                obscureText: true,
                                onChanged: (text){
                                  if(text == pwController.text && text.isNotEmpty){
                                    setState(() {
                                      _pwChecked = true;
                                    });
                                  }else{
                                    setState(() {
                                      _pwChecked = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '비밀번호를 한번 더 입력해주세요.',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                          _pwChecked ?
                          Text('비밀번호가 일치합니다', style: TextStyle(fontSize: 10.0, color: Colors.blueAccent),) : Text('비밀번호가 일치하지 않습니다', style: TextStyle(fontSize: 10.0, color: Colors.deepOrange),),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //업체명
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('업체명',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: comController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '업체명을 입력해주세요.',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //사업자 등록 번호
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('사업자 등록번호',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: comNoController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '업체명을 입력해주세요.',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //담당자 명
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('담당자 이름',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '업체명을 입력해주세요.',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:20),

                    //담당자 번호
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('담당자 연락처',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                              width:double.infinity,
                              height:45,
                              child: TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top:10.0,bottom:10,left:15),
                                  counterStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:10,
                                  ),
                                  hintText: '업체명을 입력해주세요.',
                                  labelStyle: TextStyle(color: Color(0xFFACACAC)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(width: 1, color:  Color(0xFFACACAC)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:30),

                    //나의 서비스
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('나의 서비스 [최대 5개]',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                            child: Form(
                              key: formKey_Service,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(),
                                    child: MultiSelectFormField(
                                      autovalidate: AutovalidateMode.disabled,
                                      chipBackGroundColor: Color(0xFF025595),
                                      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12.0),
                                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                                      checkBoxActiveColor: Colors.blue,
                                      checkBoxCheckColor: Colors.white,
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                      title: Text("나의 서비스", style: TextStyle(fontSize: 12),),
                                      validator: (value) {
                                        if (value == null || value.length == 0) {
                                          return '제공 가능한 서비스를 한개 이상 선택해주세요';
                                        }else if(value.length > 5){
                                          return '최대 5개까지 선택 할 수 있습니다';
                                        }
                                        return null;
                                      },
                                      dataSource: myService,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Text('제공 가능한 서비스를 한개 이상 선택해주세요', style: TextStyle(fontSize: 12.0),),
                                      initialValue: _myServices,
                                      onSaved: (value) {
                                        if (value.length == 0){
                                          return;
                                        }else if(value.length <= 5){
                                          setState(() {
                                            _myServices = value;
                                          });
                                        }else if(value.length >5){
                                          Get.snackbar('등록실패', '최대 5개의 서비스를 선택할 수 있습니다', backgroundColor: Color(0xBC000000), colorText: Colors.white);
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
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height:30),

                    //서비스 가능 지역
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('서비스 가능 지역 [최대 3개]',
                            style:TextStyle(
                              color:Color(0xFF444444),
                              fontSize:12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                          SizedBox(height:7),
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
                                      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12.0),
                                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                                      checkBoxActiveColor: Colors.blue,
                                      checkBoxCheckColor: Colors.white,
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                      title: Text("서비스 가능 지역", style: TextStyle(fontSize: 12),),
                                      validator: (value) {
                                        if (value == null || value.length == 0) {
                                          return '서비스 가능 지역을 한개 이상 선택해주세요';
                                        }else if(value.length > 3){
                                          return '최대 3개까지 선택 할 수 있습니다';
                                        }
                                        return null;
                                      },
                                      dataSource: myArea,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Text('서비스 가능 지역을 한개 이상 선택해주세요', style: TextStyle(fontSize: 12.0),),
                                      initialValue: _myAreas,
                                      onSaved: (value) {
                                        if (value.length == 0){
                                          return;
                                        }else if(value.length <= 3){
                                          setState(() {
                                            _myAreas = value;
                                          });
                                        }else if(value.length >3){
                                          Get.snackbar('등록실패', '최대 3개의 지역을 선택할 수 있습니다', backgroundColor: Color(0xBC000000), colorText: Colors.white);
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

              SizedBox(height:100),

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
                            onChanged: (value){
                              setState(() {
                                _isChecked1 = value!;
                              });
                            },
                            activeColor: Color(0xFF025595),
                          )
                        ),
                        Expanded(
                          flex: 5,
                          child: Text('[필수] 서비스 이용약관에 동의', style: TextStyle(fontSize: 12.0),),
                        ),
                        Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: (){print('이용약관 자세히 보기');},
                              child: Text('자세히 보기', style: TextStyle(fontSize: 11.0, color: Colors.grey),),
                            )
                        ),
                      ],
                    ),

                    SizedBox(height:10),

                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Checkbox(
                              value: _isChecked2,
                              onChanged: (value){
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                              activeColor: Color(0xFF025595),
                            )
                        ),
                        Expanded(
                          flex: 5,
                          child: Text('[필수] 개인정보 수집 이용에 동의', style: TextStyle(fontSize: 12.0),),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            onPressed: (){print('개인정보처리방침 자세히 보기');},
                            child: Text('자세히 보기', style: TextStyle(fontSize: 11.0, color: Colors.grey),),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height:20),

              InkWell(
                onTap:(){
                  print('회원 가입');
                  _saveFormService();
                  _saveFormArea();
                  if(_myServices!.length > 5){
                    Get.snackbar("회원가입 실패", "나의 서비스는 최대 5개까지 선택 가능합니다", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }else if(_myAreas!.length > 3){
                    Get.snackbar("회원가입 실패", "서비스 가능 지역 최대 3개까지 선택 가능합니다", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }else if(_pwChecked == false || pwController.text.length < 10){
                    Get.snackbar("회원가입 실패", "비밀번호를 확인 후 다시 시도해주세요", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }else if(_isChecked2 == false || _isChecked1 == false){
                    Get.snackbar("회원가입 실패", "필수 동의 항목을 확인해주세요", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }  else if(_idChecked== false){
                    Get.snackbar("회원가입 실패", "아이디 중복확인 후 다시 시도해주세요", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }
                  else if(idController.text.isEmpty || pwController.text.isEmpty || comController.text.isEmpty || comNoController.text.isEmpty || nameController.text.isEmpty || phoneController.text.isEmpty){
                    Get.snackbar("회원가입 실패", "입력하지 않은 항목이 있습니다", backgroundColor: Color(0xBC000000), colorText: Colors.white);
                  }else{
                    insertSignUp();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left:8,right:8),
                  width: double.infinity,
                  height:50,
                  decoration:BoxDecoration(
                    color: Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text('가입하기',
                      style: TextStyle(
                        fontSize:15,
                        color:Colors.white,
                        fontFamily:'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height:50),
            ],
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
    },{
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
    },{
      "display": "경상남도",
      "value": "경남",
    },{
      "display": "제주특별자치도",
      "value": "제주특별자치도",
    },
  ];

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
}
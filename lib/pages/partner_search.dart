import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:moving_plus/widgets/partner_sub.dart';
import 'package:moving_plus/widgets/partner_sub2.dart';

import 'main_arlim.dart';

class Partner_Search extends StatefulWidget {
  const Partner_Search({Key? key}) : super(key: key);



  @override
  _Partner_SearchState createState() => _Partner_SearchState();
}

class _Partner_SearchState extends State<Partner_Search> {
  List<String> map = [
  '서울',
  '경기',
  ];

  List<String> category = [
    '필름 시공',
    '올 인테리어',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('파트너 찾기',
          style: TextStyle(
            color:Colors.white,
            fontSize:17,
            fontFamily: 'NanumSquareB',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF025595),
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top:20,left:15.0,right:15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width:220,
                            child: Form(
                              key: _formKey,
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
                                      children: [
                                        Image.asset('assets/placeholder_g.png', width:17,height:17),
                                        SizedBox(width:30),
                                        Text(
                                          '지역',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 45,
                                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: map
                                        .map((item) =>
                                        DropdownMenuItem<String>(
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
                                    },
                                    onSaved: (value) {
                                      selectedValue = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:10),

                        Expanded(
                          child: Container(
                            width:220,
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
                                      children: [
                                        Image.asset('assets/categories.png', width:17,height:17),
                                        SizedBox(width:25),
                                        Text(
                                          '카테고리',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 45,
                                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: category
                                        .map((item) =>
                                        DropdownMenuItem<String>(
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
                                    },
                                    onSaved: (value) {
                                      selectedValue = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                      padding: EdgeInsets.only(left:15,right:15),
                      child: Column(
                        children: [
                          Partner_Sub(),
                          SizedBox(height:10),
                          Partner_Sub(),
                          SizedBox(height:10),
                          Partner_Sub2(),
                          SizedBox(height:10),
                          Partner_Sub2(),
                          SizedBox(height:10),
                          Partner_Sub2(),
                          SizedBox(height:10),
                          Partner_Sub2(),
                          SizedBox(height:20),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

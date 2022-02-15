import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page.dart';

class Account_Set extends StatefulWidget {
  const Account_Set({Key? key}) : super(key: key);

  @override
  _Account_SetState createState() => _Account_SetState();
}

class _Account_SetState extends State<Account_Set> {
  @override
  void initState() {
    print(controller.pro.value.pro_name);
    print(controller.pro.value.pro_id);
    print(controller.pro.value.pro_phone);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '계정',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                  child: controller.pro.value.type == 'cus'
                      ? controller.pro.value.profile_img == 'default_image'
                      ? Image.asset(
                      'assets/defaultImage.png',
                      width: 80,
                      height: 80)
                      : Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.pro.value
                                .profile_img,
                          ),
                          fit: BoxFit.fill,
                        )),
                  )
                  // Image.network(controller.pro.value.profile_img, width:70,height:70)
                      : Image.network("http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}", width: 80, height: 80)
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이름',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.pro.value.pro_name,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이메일',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.pro.value.pro_id,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                              SizedBox(width: 5),
                              Image.asset('assets/kakao_b.png',
                                  width: 16, height: 16),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '비밀번호',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '●●●●●●●●●',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '전화번호',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '010-5555-4444',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '계정 탈퇴',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';
import 'package:moving_plus/datas/customer_data.dart';
import 'package:moving_plus/models/customer_model.dart';
import 'package:moving_plus/pages/main_arlim.dart';
import 'package:moving_plus/pages/partner_search_page.dart';
import 'package:moving_plus/widgets/carousel_main.dart';
import 'package:moving_plus/widgets/carousel_sub.dart';
import 'package:moving_plus/widgets/partner_sub.dart';
import 'package:moving_plus/widgets/partner_sub2.dart';

import 'interior_page.dart';

final controller = Get.put(ReactiveController());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Customer> customer = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    if (controller.pro.value.type == 'cus') {
      Customer_Data.get_Customer(controller.pro.value.pro_id).then((value) {
        print('token11: ${controller.pro.value.pro_id}');
        setState(() {
          customer = value;
        });
        print({'customer : $customer'});
        if (value.isEmpty) {
          isLoading = false;
        } else {
          isLoading = true;
          controller.change(
            type: 'cus',
            id: '0',
            pro_id: controller.pro.value.pro_id,
            pro_name: controller.pro.value.pro_name,
            pro_phone: controller.pro.value.pro_phone,
            pro_email: 'None',
            com_name: 'None',
            profile_img: controller.pro.value.profile_img,
            pro_token: customer[0].cus_token,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Carousel_Main(),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 50, left: 10.0, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 25),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 0,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon1-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              Text(
                                '클린',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 1,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon2-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              const Text(
                                '인테리어',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 2,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon3-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              const Text(
                                '홈 스타일링',
                                style: TextStyle(
                                  fontFamily: 'NanumSquareB',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 25),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 3,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon4-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              const Text(
                                '가전/가구 케어',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 4,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon5-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              const Text(
                                '렌탈',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('success');
                          Get.to(Interior_Page(
                            categoryTitle: 5,
                          ));
                        },
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/main_icon6-1.png",
                                  width: 40, height: 40),
                              const SizedBox(height: 10),
                              const Text(
                                '기타',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('자주 찾는 서비스',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 15,
                              )),
                          SizedBox(height: 30),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_1.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 70,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#클린 서비스',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: EdgeInsets.only(
                                          left: 3.0, bottom: 13),
                                      width: 75,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#인테리어 청소',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_2.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 80,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#인테리어 서비스',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 3.0, bottom: 13),
                                      width: 65,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#올 인테리어',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_3.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 90,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#홈스타일링 서비스',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 3.0, bottom: 13),
                                      width: 55,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#정리정돈',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_4.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 95,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#가전/가구 케어서비스',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0, bottom: 13),
                                      width: 55,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#조명설치',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_5.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 65,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#렌탈 서비스',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 3.0, bottom: 13),
                                      width: 35,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#TV',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                print('success');
                              },
                              child: Container(
                                width: 171,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/service_6.png"),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, bottom: 13),
                                      width: 40,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF444444),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#기타',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0, bottom: 13),
                                      width: 55,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text('#소독/방역',
                                            style: TextStyle(
                                              color: Color(0xFF444444),
                                              fontSize: 9,
                                              fontFamily: 'NanumSquareR',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Carousel_Sub(),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 50, left: 20.0, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('파트너 추천',
                        style: TextStyle(
                          fontFamily: 'NanumSquareEB',
                          fontSize: 15,
                        )),
                    InkWell(
                      onTap: () {
                        Get.to(Partner_Search());
                      },
                      child: Text(
                        '더 보기',
                        style: TextStyle(
                          color: Color(0xFF444444),
                          fontFamily: 'NanumSquareR',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Partner_Sub(),
                Partner_Sub2(),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Divider(
            height: 1.0,
            thickness: 2.0,
            color: Color(0xFFe6e6e6),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xfff3f3f3),
            width:Get.width,
            height:250.0,


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Expanded(
                      child: Text('상호',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: Text('|   케이에스하우징매니지먼트',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      child: Text('대표자',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: Text('|   최현성',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      child: Text('사업자번호',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: Text('|   285-05-02282',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: Text('통신판매업',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                      fontSize: 12,
                    ),
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: Text('|   제 2022-안양동안-0159 호',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),

                Row(
                  children: [
                    Expanded(
                      child: Text('TEL',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: Text('|   1533-1196',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                      child: Text('이메일',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: Text('|   no200chs@naver.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NanumSquareR',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        onPressed: (){
                          Get.defaultDialog(
                            radius: 5.0,
                            title: '이용약관',
                            titleStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NanumSquareR',
                              fontSize: 14),
                            content: Container(
                              margin: EdgeInsets.all(20),
                              height: Get.height*0.6,
                              width: Get.width,
                              child: SingleChildScrollView(
                                child: Text(use),
                              ),
                            )
                          );
                        },
                        child: Center(
                          child: Text('이용약관',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NanumSquareR',
                              fontSize: 10,
                            ),
                          ),
                        )
                      )
                    ),
                    Expanded(
                        child: TextButton(
                          onPressed: (){},
                          child: Text('|',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NanumSquareR',
                              fontSize: 10,
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: TextButton(
                          onPressed: (){
                            Get.defaultDialog(
                                radius: 5.0,
                                title: '개인정보처리방침',
                                titleStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'NanumSquareR',
                                    fontSize: 14),
                                content: Container(
                                  margin: EdgeInsets.all(20),
                                  height: Get.height*0.6,
                                  width: Get.width,
                                  child: SingleChildScrollView(
                                    child: Text(privacy),
                                  ),
                                )
                            );
                          },
                          child: Center(
                            child: Text('개인정보처리방침',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'NanumSquareR',
                                fontSize: 10,
                              ),
                            ),
                          )
                        )
                    ),
                    Expanded(
                        child: TextButton(
                          onPressed: (){},
                          child: Text('|',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NanumSquareR',
                              fontSize: 10,
                            ),
                          ),
                        )
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        onPressed: (){
                          Get.defaultDialog(
                              radius: 5.0,
                              title: '환불정보',
                              titleStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NanumSquareR',
                                  fontSize: 14),
                              content: Container(
                                margin: EdgeInsets.all(20),
                                height: Get.height*0.6,
                                width: Get.width,
                                child: SingleChildScrollView(
                                  child: Text(return_service),
                                ),
                              )
                          );
                        },
                        child: Center(
                          child: Text('환불정보',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NanumSquareR',
                              fontSize: 10,
                            ),
                          ),
                        )
                      )
                    ),

                  ],
                ),
                Spacer(),

                Center(
                  child: Text('경기도 안양시 동안구 시민대로 327번길 11-41 안양창업지원센터 3층 3133호',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'NanumSquareR',
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5.0,),
                Center(
                  child: Text('Copyright © 2022 케이에스하우징매니지먼트. All rights reserved.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'NanumSquareR',
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            )
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  String privacy = """<입주플러스>('http://입주플러스.com/'이하 '입주플러스')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다. ○ 이 개인정보처리방침은 2022년 02월 20부터 적용됩니다. 


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

  String use = """1. 고객 계약금은 운영사 (입주플러스_케이에스하우징매니지먼트) 수수료로 일괄 처리 됩니다. 잔금은 직접 수령하시고, 계약금  외 별도의 추가 수수료는 발생하지 않습니다.\n2. 계약금 이외  착수금 및 선금은 계약 고객과 별도 협의 바랍니다.

                            \n3. 계약을 위한  무리한 가격인하는 자제하여 주시고, 합리적은 시공 견적을 제시하여 주시기 바랍니다.

                            \n4. 현장 추가 요금 발생 항목은 문의 고객에게 사전 고지 바랍니다.

                            \n5. 계약 불이행 및 일정, 견적 금액 변경은 계약 고객에게 사전 고지 및 협의 바랍니다.
  
                            \n6. 타 시공과 일정이 겹치지 않도록 사전에 고객에게 다른 시공 여부를 확인바랍니다.
  
                            \n7. 상기 1~6번 항목 불성실 이행시, 계정 정지 및 삭제 등의 불이익이 발생 할 수 있습니다.

                            \n8. 입주플러스 직영 파트너  가입을 희망하시면, 담당자에게 별도 문의 부탁드립니다.
                            \n\n(담당자 1533-1196)
                            \n직영 파트너는 앱 이용 별도 혜택 외 명함, 팀조끼, 차량 홍보스티커(자석형) 등을 별도 제공해 드립니다.\n직영 파트너는 30만원  보증금이 있습니다.(1년 후 연장 의사가 없으면 전액 돌려드립니다.)""";

  String return_service =
  """
  - 입주플러스는 입주 파트너와 고객간의 서비스 중개를 진행하며, 이에 대한 수수료다(이하 '계약금')가 발생합니다.\n\n
  - 이미 진행한 서비시의 경우 환불 진행이 불가합니다.\n\n
  - 서비스 이용 전 환불을 진행할 경우 서비스까지 남은 일정에 따라 수수료가 부과될 수 있습니다.\n\n
  - 파트너(고객)과 협의하지 않고 한쪽의 일반적인 서비스 취소 시 계약금 환불은 불가합니다.\n\n
  - 환불 절차는 고객센터를 통해 문의해주세요. \n\n
  """;
}

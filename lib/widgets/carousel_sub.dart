import 'dart:core';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/datas/banner_data.dart';

//375*95
class Carousel_Sub extends StatefulWidget {
  @override
  _Carousel_SubState createState() => _Carousel_SubState();
}

class _Carousel_SubState extends State<Carousel_Sub> {
  @override
  void initState() {
    super.initState();
  }

  final CarouselController _controller = CarouselController();
  final controller = Get.put(Banner_Data());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSubLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 96.0,
                  autoPlay: true,
                  viewportFraction: 2.0,
                  enlargeCenterPage: false,
                ),
                items: controller.bannerSub.map((item) {
                  return SizedBox(
                    height: 96.0,
                    child: Center(
                        child: Image.network(
                      'http://211.110.44.91/plus/banner/${item.banner_img}',
                      fit: BoxFit.cover,
                      width: Get.width,
                      height: 96.0,
                    )),
                  );
                }).toList(),
              ),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          ));
  }
}

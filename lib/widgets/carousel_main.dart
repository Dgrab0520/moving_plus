import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

final List<String> imgList = [
  "assets/main_banner.png",
  "assets/main_banner.png",
  "assets/main_banner.png",
];

class Carousel_Main extends StatefulWidget{
  @override
  _Carousel_MainState createState() => _Carousel_MainState();
}

class _Carousel_MainState extends State<Carousel_Main>{

  int _current = 0;
  final CarouselController _controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    Widget imageSliders = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 2.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: imgList?.map((item) {
            return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: Image.asset(
                            item, //
                            fit: BoxFit.fitWidth,
                            width: Get.width,
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'main Banner',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0e0e0e),
                        fontSize: 15.0,
                        fontFamily: 'Gmarket_Medium',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ));
          })?.toList() ??
              [],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList?.asMap()?.entries?.map((entry) {
            return Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 3.0),
                  height: 5.0,
                  //margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      color: (Theme.of(context).brightness ==
                          Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.1)),
                ),
              ),
            );
          })?.toList() ??
              [],
        ),
      ],
    );
    return Container(
        child: Column(
          children: <Widget>[
            imageSliders,
          ],
        )
    );
  }
}
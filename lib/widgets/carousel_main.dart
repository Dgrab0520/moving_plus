import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:moving_plus/datas/banner_data.dart';
import 'package:moving_plus/models/banner_model.dart';

final List<String> imgList = [
  "assets/main_banner.png",
  "assets/main_banner.png",
  "assets/main_banner.png",
];


//375*162
class Carousel_Main extends StatefulWidget{
  @override
  _Carousel_MainState createState() => _Carousel_MainState();
}

class _Carousel_MainState extends State<Carousel_Main>{

  List<Banners> _banner = [];
  int _current = 0;
  bool _isLoading = false;

  getBanner(){
    Banner_Data.getBanner().then((value){
      setState(() {
        _banner = value;
      });
      if(value.isEmpty){
        _isLoading = false;
      }else{
        _isLoading = true;
      }
    });
  }

  void initState(){
    super.initState();
    getBanner();
  }




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
          items: _banner?.map((item) {
            return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: Image.network(
                            'http://211.110.44.91/plus/banner/${item.banner_img}',
                            fit: BoxFit.fitWidth,
                            width: Get.width,

                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      item.banner_title,
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
          children: _banner?.asMap()?.entries?.map((entry) {
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
    return _isLoading ? Container(
        child: Column(
          children: <Widget>[
            imageSliders,
          ],
        )
    ) : Center(child: CircularProgressIndicator(),);
  }
}
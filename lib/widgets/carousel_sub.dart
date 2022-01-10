import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:moving_plus/datas/banner_data.dart';
import 'package:moving_plus/models/banner_model.dart';


//375*95
class Carousel_Sub extends StatefulWidget{
  @override
  _Carousel_SubState createState() => _Carousel_SubState();
}

class _Carousel_SubState extends State<Carousel_Sub>{

  List<Banners> banner = [];
  bool _isLoading = false;

  getBanner_Sub(){
    Banner_Data.getBanner_Sub().then((value){
      setState(() {
        banner = value;
      });
      print('ww$banner');
      if(value.isEmpty){
        setState(() {
          _isLoading = false;
        });

      }else{
        setState(() {
          _isLoading = true;
        });
      }
    });
  }


  void initState(){
    super.initState();
    getBanner_Sub();
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
            height: 96.0,
            autoPlay: true,
            viewportFraction: 2.0,
            enlargeCenterPage: false,
          ),
          items: banner.map((item) {
            return Container(
                height: 96.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 96.0,
                      child: Center(
                          child: Image.network(
                            'http://211.110.44.91/plus/banner/${item.banner_img}',
                            fit: BoxFit.fill,
                            width: Get.width,
                            height: 96.0,
                          )),
                    ),
                  ],
                ));
          }).toList(),
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
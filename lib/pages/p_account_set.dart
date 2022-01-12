import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_plus/controllers/Getx_ProController.dart';

import 'main_arlim.dart';



final controller = Get.put(ReactiveController());

class P_Account_Set extends StatefulWidget {
  const P_Account_Set({Key? key}) : super(key: key);

  @override
  _P_Account_SetState createState() => _P_Account_SetState();
}

class _P_Account_SetState extends State<P_Account_Set> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('계정 설정',
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
        child: Column(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top:25.0,bottom:25,left:15,right:15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network("http://211.110.44.91/plus/pro_profile/${controller.pro.value.profile_img}",width:90,height:90),
                      Positioned(
                          right:0,
                          bottom:0,
                          child:Image.asset("assets/photo-camera2.png",width:30,height:30)),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:25,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('회사명',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${controller.pro.value.com_name}',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('아이디',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(controller.pro.value.pro_id,
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('비밀번호',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('●●●●●●●●●',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:15,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('전화번호',
                      style:TextStyle(
                        fontSize:12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                    SizedBox(height:7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.pro.value.pro_phone,
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:70),

            Divider(
              thickness: 0.6,
              height: 1.0,
              color: Color(0xFFcccccc),
            ),

            SizedBox(height:10),

            InkWell(
              onTap:(){},
              child: Container(
                width:MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15,right:15,top:20,bottom:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('계정 탈퇴',
                          style:TextStyle(
                            fontSize:14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,size:18)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class C_Partner_Info extends StatefulWidget {
  const C_Partner_Info({Key? key}) : super(key: key);

  @override
  _C_Partner_InfoState createState() => _C_Partner_InfoState();
}

class _C_Partner_InfoState extends State<C_Partner_Info> {
  bool _isBtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('포트폴리오',
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
            width: Get.width,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF025595)
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('인테리어 작업대', style:
                          TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'NanumSquareEB',
                          ),
                          ),
                          SizedBox(height: 10.0,),
                          Text('총 공사 20건', style:
                          TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87
                          ),
                          ),
                          SizedBox(height: 2.0,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.orange, size: 15.0,),
                              SizedBox(width: 1.0,),
                              Text('4.7', style:
                              TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87
                              ),
                              ),
                              SizedBox(width: 1.0,),
                              Text('(10개)', style:
                              TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87
                              ),
                              )
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10.0,),

                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              _isBtn = true;
                            });
                          },
                          child: Container(
                              height: 40.0,
                              color: Color(_isBtn ? 0xFF025595 : 0xFFe6e6e6),
                              child: Center(
                                child: Text('파트너 정보', style:
                                TextStyle(
                                    color: _isBtn ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0
                                ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              _isBtn = false;
                            });
                          },
                          child: Container(
                              height: 40.0,
                              color: Color(_isBtn ? 0xFFe6e6e6 : 0xFF025595),
                              child: Center(
                                child: Text('이미지/후기', style:
                                TextStyle(
                                    color: _isBtn ? Colors.black87 : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0
                                ),
                                ),
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10.0,),

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text('소개글')
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';

class Partner_Sub2 extends StatefulWidget {
  const Partner_Sub2({Key? key}) : super(key: key);

  @override
  _Partner_Sub2State createState() => _Partner_Sub2State();
}

class _Partner_Sub2State extends State<Partner_Sub2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('success');
      },      child: Container(
        padding: EdgeInsets.only(left:10,right:10),
        width:double.infinity,
        height:100,
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset("assets/p_img-1.png", width:60,height:60),
                SizedBox(width:10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('인테리어 작업대',
                          style:TextStyle(
                            color:Color(0xFF444444),
                            fontFamily: 'NanumSquareEB',
                            fontSize:14,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text('총 공사 20건',
                              style:TextStyle(
                                fontSize:12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width:20),
                        Row(
                          children: [
                            Image.asset("assets/star1.png",width:13,height:13),
                            Text('4.7',
                                style:TextStyle(
                                  fontSize:12,
                                )
                            ),
                            Text('(10개)',
                                style:TextStyle(
                                  fontSize:8,
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height:10),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:7,right:7),
                          height:17,
                          decoration:BoxDecoration(
                            color:Color(0xFF444444),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text('인테리어 서비스',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontSize:7,
                                  fontFamily: 'NanumSquareR',
                                )
                            ),
                          ),
                        ),

                        SizedBox(width:3),

                        Container(
                          padding: EdgeInsets.only(left:7,right:7),
                          height:17,
                          decoration:BoxDecoration(
                            color:Color(0xFF444444),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text('카드결제',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontSize:7,
                                  fontFamily: 'NanumSquareR',
                                )
                            ),
                          ),
                        ),
                        SizedBox(width:3),
                        Container(
                          padding: EdgeInsets.only(left:7,right:7),
                          height:17,
                          decoration:BoxDecoration(
                            color:Color(0xFF444444),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text('일반도면',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontSize:7,
                                  fontFamily: 'NanumSquareR',
                                )
                            ),
                          ),
                        ),
                        SizedBox(width:3),
                        Container(
                          padding: EdgeInsets.only(left:7,right:7),
                          height:17,
                          decoration:BoxDecoration(
                            color:Color(0xFF444444),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text('보증보험',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontSize:7,
                                  fontFamily: 'NanumSquareR',
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
            Image.asset("assets/p_img2-1.png", width:60,height:60),
          ],
        ),
      ),
    );
  }
}

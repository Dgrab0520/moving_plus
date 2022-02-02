import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProFolio_Page extends StatefulWidget{
  @override
  _ProFolio_PageState createState() => _ProFolio_PageState();
}

class _ProFolio_PageState extends State<ProFolio_Page>{
  bool _isBtn = true;  //파트너 정보


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
          height: Get.height*0.8,
          child: Column(
            children: <Widget>[
              Container(
                width:Get.width,
                decoration:BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFcccccc)),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.asset('assets/img4.png'),
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('인테리어 작업대', style:
                          TextStyle(
                            fontSize: 18.0,
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
                            Icon(Icons.star, color: Color(0xFFFFC107), size: 15.0,),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:25),
              InkWell(
                onTap:(){},
                child: Container(
                  padding: EdgeInsets.only(left:15.0,right:15),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('소개글',
                            style:TextStyle(
                              fontSize:13,
                              fontFamily: 'NanumSquareEB',
                            ),
                          ),
                          SizedBox(height:7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('안녕하세요! 인테리어 작업대입니다. 공간을 사용하는 클라이언트의 입장을 고려하여 설계, 디자인하여 완성도 높은 시공으로 고객과 소통하겠습니다!', style:
                              TextStyle(
                                color:Colors.black54,
                                fontSize:14.0,
                              ),
                                maxLines: 4,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Icon(Icons.arrow_forward_ios,color:Colors.black,size:18,),
                            ],
                          ),
                        ],
                      ),
                ),
              ),

              SizedBox(height:30),
              InkWell(
                onTap:(){},
                child: Container(
                  width:Get.width,
                  padding: EdgeInsets.only(left:15.0,right:15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('기본정보',
                        style:TextStyle(
                          fontSize:13,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Expanded(
                              flex:2,
                              child: Text('대표자',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              )),
                          Expanded(
                              flex:6,
                              child: Text('김대표',
                                style:TextStyle(
                                    fontSize:13,
                                    fontFamily: 'NanumSquareB'
                                ),
                              )),
                          Expanded(
                              flex:1,
                              child: Text('')),
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: [
                          Expanded(
                              flex:2,
                              child: Text('전문분야',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              )),
                          Expanded(
                              flex:6,
                              child: Text('주거 / 상업공간',
                                style:TextStyle(
                                    fontSize:13,
                                    fontFamily: 'NanumSquareB'
                                ),
                              )),
                          Expanded(
                            flex:1,
                            child: Text(''),
                          ),
                        ],
                      ),

                      SizedBox(height:5),
                      Row(
                        children: [
                          Expanded(
                              flex:2,
                              child: Text('시공지역',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              )),
                          Expanded(
                              flex:6,
                              child: Text('서울 / 경기',
                                style:TextStyle(
                                    fontSize:13,
                                    fontFamily: 'NanumSquareB'
                                ),
                              )),
                          Expanded(
                            flex:1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_forward_ios,color:Colors.black,size:18,)),
                          ),
                        ],
                      ),

                      SizedBox(height:5),
                      Row(
                        children: [
                          Expanded(
                              flex:2,
                              child: Text('경력',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              )),
                          Expanded(
                              flex:6,
                              child: Text('10년 이상',
                                style:TextStyle(
                                    fontSize:13,
                                    fontFamily: 'NanumSquareB'
                                ),
                              )),
                          Expanded(
                            flex:1,
                            child: Text(''),
                          ),
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: [
                          Expanded(
                              flex:2,
                              child: Text('경제',
                                style:TextStyle(
                                  fontSize:13,
                                ),
                              )),
                          Expanded(
                              flex:6,
                              child: Text('계좌이체, 카드결제, 현금결제 가능',
                                style:TextStyle(
                                    fontSize:13,
                                    fontFamily: 'NanumSquareB'
                                ),
                              )),
                          Expanded(
                            flex:1,
                            child: Text(''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height:30),
              Container(
                width:Get.width,
                padding: EdgeInsets.only(left:15.0,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('제공 서비스',
                      style:TextStyle(
                        fontSize:13,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                    SizedBox(height:10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap:(){},
                              child: Container(
                                width:85,
                                height:25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1,
                                    color:Color(0xFFcccccc),
                                  ),
                                ),
                                child: Center(
                                  child: Text('올 인테리어',
                                    style:TextStyle(
                                      fontSize:12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width:5),
                            InkWell(
                              onTap:(){},
                              child: Container(
                                width:70,
                                height:25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1,
                                    color:Color(0xFFcccccc),
                                  ),
                                ),
                                child: Center(
                                  child: Text('필름시공',
                                    style:TextStyle(
                                      fontSize:12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width:5),
                            InkWell(
                              onTap:(){},
                              child: Container(
                                width:75,
                                height:25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1,
                                    color:Color(0xFFcccccc),
                                  ),
                                ),
                                child: Center(
                                  child: Text('타일교체',
                                    style:TextStyle(
                                      fontSize:12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width:5),
                            InkWell(
                              onTap:(){},
                              child: Container(
                                width:75,
                                height:25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1,
                                    color:Color(0xFFcccccc),
                                  ),
                                ),
                                child: Center(
                                  child: Text('페인트칠',
                                    style:TextStyle(
                                      fontSize:12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height:30),

              Container(
                width:Get.width,
                padding: EdgeInsets.only(left:15.0,right:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사진 및 동영상',
                      style:TextStyle(
                        fontSize:13,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),

                    SizedBox(height:10),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap:(){},
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset('assets/p_img2-1.png'),
                            ),
                          ),
                          SizedBox(width:7),
                          InkWell(
                            onTap:(){},
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset('assets/p_img2-1.png'),
                            ),
                          ),
                          SizedBox(width:7),
                          InkWell(
                            onTap:(){},
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset('assets/p_img2-1.png'),
                            ),
                          ),
                          SizedBox(width:7),
                          InkWell(
                            onTap:(){},
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset('assets/p_img2-1.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              InkWell(
                onTap:(){
                },
                child: Container(
                  width:300,
                  height:45,
                  padding: EdgeInsets.only(left:15.0,right:15),
                  child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Color(0xFF025595),
                          ),
                          child: Center(
                            child: Text('저장하기',
                              style:TextStyle(
                                fontSize:15,
                                color:Colors.white,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                      ),
                  ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
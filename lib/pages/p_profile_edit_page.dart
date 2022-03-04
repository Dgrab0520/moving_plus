import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEdit_Page extends StatefulWidget {
  @override
  _ProfileEdit_PageState createState() => _ProfileEdit_PageState();
}

class _ProfileEdit_PageState extends State<ProfileEdit_Page> {
  bool _isBtn = true; //파트너 정보

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '포트폴리오',
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
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            children: <Widget>[
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/img4.png'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '인테리어 작업대',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'i_desk123@naver.com',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: Get.width * 0.4,
                          height: 30.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF025595),
                              borderRadius: BorderRadius.circular(7.0)),
                          child: Center(
                            child: Text(
                              '문의 하기',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '4개',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'NanumSquareEB',
                                ),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                '받은 견적서',
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '10개',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'NanumSquareEB',
                                ),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                '리뷰',
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC107),
                                    size: 15.0,
                                  ),
                                  SizedBox(
                                    width: 1.0,
                                  ),
                                  Text(
                                    '4.7',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                '고객 만족도',
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isBtn = true;
                                });
                              },
                              child: Container(
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color:
                                      Color(_isBtn ? 0xFF025595 : 0xFFe6e6e6),
                                ),
                                child: Center(
                                  child: Text(
                                    '파트너 정보',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: _isBtn
                                            ? Colors.white
                                            : Colors.black87),
                                  ),
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isBtn = false;
                                });
                              },
                              child: Container(
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color:
                                      Color(_isBtn ? 0xFFe6e6e6 : 0xFF025595),
                                ),
                                child: Center(
                                  child: Text(
                                    '이미지 / 후기',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: _isBtn
                                            ? Colors.black87
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '소개글',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '안녕하세요! 인테리어 작업대입니다. 공간을 사용하는 클라이언트의 입장을 고려하여 설계, 디자인하여 완성도 높은 시공으로 고객과 소통하겠습니다!',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                      ),
                      maxLines: 4,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      '기본정보',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('대표자'),
                        ),
                        Expanded(
                          flex: 9,
                          child: Text('|   김대표'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('전문분야'),
                        ),
                        Expanded(
                          flex: 9,
                          child: Text('|   주거 / 상업공간'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('시공지역'),
                        ),
                        Expanded(
                          flex: 9,
                          child: Text('|   서울 / 경기'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('경력'),
                        ),
                        Expanded(
                          flex: 9,
                          child: Text('|   10년 이상'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text('결제'),
                        ),
                        Expanded(
                          flex: 9,
                          child: Text('|   계좌이체, 카드결제, 현금결제 가능'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      '제공 서비스',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.5, color: Color(0xffd4d4d4)),
                              color: Color(0xFFe6e6e6),
                            ),
                            child: Center(
                              child: Text(
                                '올 인테리어',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 80.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.5, color: Color(0xffd4d4d4)),
                              color: Color(0xFFe6e6e6),
                            ),
                            child: Center(
                              child: Text(
                                '필름시공',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 80.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.5, color: Color(0xffd4d4d4)),
                              color: Color(0xFFe6e6e6),
                            ),
                            child: Center(
                              child: Text(
                                '탄성코트',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 80.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.5, color: Color(0xffd4d4d4)),
                              color: Color(0xFFe6e6e6),
                            ),
                            child: Center(
                              child: Text(
                                '타일교체',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      '사진',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                thickness: 1.5,
                height: 1.0,
                color: Color(0xFFe6e6e6),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: Get.width,
                      height: 60.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '4.7',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '(10개)',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      height: 1.0,
                      color: Color(0xFFe6e6e6),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '이도원',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '2022.01.03',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '궁금했던 부분들든 자세히 설명해 주시고 말하지 않은 부분들도 센스있게 마감해 주시는 것 보고 완공시기가 될 수록 마음에 드는 정도가 더 커녔네요. 수고 많으셨습니다! 감사합니다.',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            maxLines: 4,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      height: 1.0,
                      color: Color(0xFFe6e6e6),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '이도원',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '2022.01.03',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '하나부터 열까지 모두 친절히 설명해주시면서 꼼꼼하게 시공해주셔서 감사합니다',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            maxLines: 4,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      height: 1.0,
                      color: Color(0xFFe6e6e6),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '이도원',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC107),
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '2022.01.03',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '하나부터 열까지 모두 친절히 설명해주시면서 꼼꼼하게 시공해주셔서 감사합니다',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            maxLines: 4,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: () {
                  print('로그인 더보기');
                },
                child: Container(
                  width: 120.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 0.8, color: Color(0xFFCCCCCC)),
                      color: Color(0xFFF9F9F9)),
                  child: Center(
                    child: Text(
                      '로그인 더보기',
                      style: TextStyle(
                        color: Color(0xFF025595),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

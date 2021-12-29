import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_set.dart';

class Transaction_Breakdown extends StatefulWidget {
  const Transaction_Breakdown({Key? key}) : super(key: key);

  @override
  _Transaction_BreakdownState createState() => _Transaction_BreakdownState();
}

class _Transaction_BreakdownState extends State<Transaction_Breakdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left:5,right:5),
                  width:MediaQuery.of(context).size.width,
                  height:58,
                  decoration: BoxDecoration(
                    color:Color(0xFF025595),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Expanded(
                        flex:8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('거래 내역',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize:17,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),),
                      ),
                      Expanded(
                        flex:1,
                        child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.notifications,color: Colors.white,size: 22,)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left:15,right:15,top:20),
                  child: Text('거래 내역',
                    style:TextStyle(
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

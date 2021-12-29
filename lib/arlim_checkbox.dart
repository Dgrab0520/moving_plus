import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';

class Arlim_checkbox extends StatefulWidget {
  const Arlim_checkbox({Key? key}) : super(key: key);

  @override
  _Arlim_checkboxState createState() => _Arlim_checkboxState();
}

class _Arlim_checkboxState extends State<Arlim_checkbox> {
  bool shouldCheck = false;
  bool shouldCheckDefault = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width:30,
          height:30,
          child: CustomCheckBox(
            value: shouldCheck,
            shouldShowBorder: true,
            borderColor: Color(0xFF025595),
            checkedFillColor: Color(0xFF025595),
            borderRadius: 4,
            borderWidth: 2,
            checkBoxSize: 10,
            onChanged: (val) {
              //do your stuff here
              setState(() {
                shouldCheck = val;
              });
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Interior_Sub extends StatefulWidget {
  const Interior_Sub(
      {Key? key,
      required this.image,
      required this.title,
      required this.content})
      : super(key: key);
  final String image;
  final String title;
  final String content;
  @override
  _Interior_SubState createState() => _Interior_SubState();
}

class _Interior_SubState extends State<Interior_Sub> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: const Color(0xFFcccccc),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'NanumSquareB',
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.content,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

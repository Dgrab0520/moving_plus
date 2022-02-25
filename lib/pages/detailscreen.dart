import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        child: Center(
          child: PhotoView(
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            minScale: 0.1,
            imageProvider: NetworkImage(path),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

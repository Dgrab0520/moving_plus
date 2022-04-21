import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class NetworkImageWidget extends StatefulWidget {
  const NetworkImageWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _NetworkImageWidgetState createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  Widget imageWidget = Container();
  bool isLoading = false;

  Future<Uint8List> getNetworkImage(String url) async {
    try {
      Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
          .buffer
          .asUint8List();
      var result = await FlutterImageCompress.compressWithList(
        bytes,
        minHeight: 480,
        minWidth: 480,
        quality: 50,
      );
      return result;
    } catch (e) {
      print(e);
    }
    return Uint8List(0);
  }

  getMemoryImage(String url) {
    print(url);
    getNetworkImage(url).then((value) {
      print(value.length);
      setState(() {
        if (value.isNotEmpty) {
          imageWidget = Image.memory(value);
        }
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    getMemoryImage(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? imageWidget
        : const SizedBox(
            width: 100,
            height: 100,
            child: Center(child: CircularProgressIndicator()));
  }
}

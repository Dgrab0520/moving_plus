import 'package:flutter/material.dart';
import 'package:moving_plus/models/portfolio_file_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailScreenGallery extends StatelessWidget {
  const DetailScreenGallery(
      {Key? key, required this.files, required this.pageController})
      : super(key: key);
  final List<PortfolioFile> files;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: GestureDetector(
        child: Center(
            child: PhotoViewGallery.builder(
          pageController: pageController,
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: files.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                  "http://211.110.44.91/plus/portfolio_file/${files[index].fileName}${files[index].fileType}"),
              initialScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(
                  tag:
                      "http://211.110.44.91/plus/portfolio_file/${files[index].fileName}${files[index].fileType}"),
            );
          },
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
        )),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

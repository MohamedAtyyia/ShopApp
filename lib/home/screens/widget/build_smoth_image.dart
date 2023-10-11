import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildSmothImage extends StatelessWidget {
  const BuildSmothImage(
      {super.key, required this.images, required this.controller});
  final PageController controller;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, index) => CachedNetworkImage(
                  imageUrl: images[index],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Image.asset('image/loading.gif'),
                  errorWidget: (context, url, error) =>
                      Image.asset('image/error.gif'),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: images.length,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
                spacing: 8.0,
                radius: 25.0,
                dotWidth: 12.0,
                dotHeight: 12.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo),
          ),
        )
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildProductImag extends StatelessWidget {
  const BuildProductImag(
      {super.key,
      required this.image,
      required this.discount,
      required this.height,
      required this.width});
  final String image;
  final int discount;
  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Image.asset('image/loading.gif'),
          errorWidget: (context, url, error) =>Image.asset('image/error.gif'),
          height: height,
        width: width,
        ),

        discount != 0
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.all(4),
                child: Text(
                  'Discound',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontSize: 12),
                ),
              )
            : Container()
      ],
    );
  }
}

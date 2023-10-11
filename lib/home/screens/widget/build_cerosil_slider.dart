import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model/home_model/banner.dart';

class BuildCaroiselSlider extends StatelessWidget {
  const BuildCaroiselSlider({super.key, required this.banners});
  final List<Banners>banners;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      
    options: CarouselOptions(
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    viewportFraction: 1.0,
    autoPlayInterval: const Duration(seconds: 4),
    autoPlayAnimationDuration:const  Duration(seconds: 1),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 0.3,
    scrollDirection: Axis.horizontal,
     ),
     items:banners.map((e) => Image.network(e.image.toString())).toList()
    );
  }


}
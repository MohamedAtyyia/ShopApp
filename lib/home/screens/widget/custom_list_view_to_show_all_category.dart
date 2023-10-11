import '../../data/model/home_model/category_model.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.allCategories});
  final List<AllCategoriesModel>allCategories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context,index)=> Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 12),
          child:  CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
          allCategories[index].image.toString()
          ),
              ),
        )),
    );
  }
}
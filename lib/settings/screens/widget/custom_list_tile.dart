import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/util/cubit/localization_cubit/localization_cubit.dart';

import '../../../util/app_const.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.titl,
      required this.leading,
      required this.ontap});
  final String titl;
  final IconData leading;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        leading,
        color: AppConst.basecolor,
      ),
      title: Text(
        titl,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing:BlocProvider.of<LocalizationCubit>(context).isEnglish()?
  const     Icon(
        Icons.arrow_circle_right_rounded,
      size: 24,
        color: AppConst.basecolor,
      )
      :
    const   Icon(
        Icons.arrow_circle_left_rounded,
      size: 24,
        color: AppConst.basecolor,
      )
    );
  }
}

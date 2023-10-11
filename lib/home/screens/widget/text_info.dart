import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/util/cubit/localization_cubit/localization_cubit.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
     alignment: BlocProvider.of<LocalizationCubit>(context).isEnglish() ?
         Alignment.bottomLeft :Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),);
  }
}


import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';

import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CustomTextFolemFiled extends StatelessWidget {
  const CustomTextFolemFiled(
      {super.key,
      required this.text,
      required this.prefixIcon,
      this.suffixIcon,
      this.inputType,
      required this.onChanged,
      this.validate, this.index});
  final String text;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? inputType;
  final Function(String) onChanged;
  final String? Function(String?)? validate;
  final int?index;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ShowPasswordCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: inputType ?? TextInputType.text,
            obscureText: text == S.of(context).password ? cubit.isShow[index!] : false,
            validator: validate ??
                (data) {
                  if (data!.isEmpty) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
            onChanged: onChanged, // تم تعديل هنا
            decoration: InputDecoration(
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              fillColor: const Color(0xffEEEEEE),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: text == S.of(context).password
                  ? IconButton(
                      onPressed: () {
                        cubit.showPassword(index!);
                      },
                      icon: Icon(cubit.isShow[index!]
                          ? Icons.visibility_off
                          : Icons.visibility),
                      iconSize: 24,
                      color: const Color(0xff01BE84),
                    )
                  : null,
              prefixIcon: Icon(
                prefixIcon,
                size: 30,
                color: const Color(0xff01BE84),
              ),
              hintText: text,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}

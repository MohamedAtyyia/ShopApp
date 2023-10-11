import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';

import '../../../util/widget/custom_bottom.dart';
import '../../../generated/l10n.dart';
import '../../manager/cubit/setting_cubit.dart';
import '../../../util/flutter_tost.dart';
import '../../../util/widget/custom_text_form_filed.dart';
import '../../../util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody(
      {super.key, required this.formstate, required this.userModel});
  final GlobalKey<FormState> formstate;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ShowPasswordCubit>(context);
    late String password;
    late String passwordConfirmation;
    return Form(
      key: formstate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFolemFiled(
                  text: S.of(context).password,
                  prefixIcon: Icons.lock_rounded,
                  onChanged: (String text) {
                    password = text;
                  },
                  index: 2,
                  validate: (String? password) {
                    if (password!.isEmpty) {
                      return S.of(context).faileIsRequied;
                    } else if (password != passwordConfirmation) {
                      return S.of(context).diffrent_password;
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextFolemFiled(
                  text: S.of(context).password,
                  prefixIcon: Icons.lock_rounded,
                  onChanged: (String text) {
                    passwordConfirmation = text;
                  },
                  index: 3,
                  validate: (String? text) {
                    if (text!.isEmpty) {
                      return S.of(context).faileIsRequied;
                    } else if (text != password) {
                      return S.of(context).diffrent_password;
                    } else {
                      return null;
                    }
                  },
                ),
                BlocConsumer<SettingCubit, SettingState>(
                  listener: (context, state) {
                    if (state is SettingFailuerState) {
                      flutterToast(message: state.erroMessage);
                    } else if (state is SettingSuccessfulyState) {
                      Navigator.pop(context);
                      flutterToast(
                          message: S.of(context).change_password_successfuly);
                      cubit.isShow[2] = true;
                      cubit.isShow[3] = true;
                    }
                  },
                  builder: (context, state) {
                    if (state is SettingLoadinState) {
                      return const LoadingWidget();
                    } else {
                      return Custombottom(
                          text: S.of(context).update,
                          ontap: () async {
                            if (formstate.currentState!.validate()) {
                              await BlocProvider.of<SettingCubit>(context)
                                  .changePassword(queryParameters: {
                                "name": userModel.data!.name,
                                "phone": userModel.data!.phone,
                                "email": userModel.data!.email,
                                "password": password,
                              });
                            }
                          });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

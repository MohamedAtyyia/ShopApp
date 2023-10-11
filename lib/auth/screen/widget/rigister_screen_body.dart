import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';

import '../../../generated/l10n.dart';
import '../../../util/app_const.dart';
import '../../../util/flutter_tost.dart';
import '../../../util/widget/custom_text_form_filed.dart';
import '../../../util/widget/loading_widget.dart';
import '../../manager/cubit/authentication_cubit.dart';
import '../../../util/widget/custom_bottom.dart';

class RigigsterScreenBody extends StatelessWidget {
  const RigigsterScreenBody({super.key, required this.formstate});
  final GlobalKey<FormState> formstate;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ShowPasswordCubit>(context);
    String? username;

    String? phoneNumber;

    String? email;

    String? password;
    return Form(
      key: formstate,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              Text(
                S.of(context).signUp,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              CustomTextFolemFiled(
                text: S.of(context).userName,
                prefixIcon: Icons.account_circle,
                onChanged: (value) {
                  username = value;
                },
              ),
              CustomTextFolemFiled(
                text: S.of(context).phone,
                inputType: TextInputType.number,
                prefixIcon: Icons.description,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              CustomTextFolemFiled(
                text: S.of(context).email,
                prefixIcon: Icons.email,
                onChanged: (value) {
                  email = value;
                },
              ),
              CustomTextFolemFiled(
                text: S.of(context).password,
                prefixIcon: Icons.lock_outline,
                onChanged: (value) {
                  password = value;
                },
                index: 0,
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationSuccfuly) {
                    flutterToast(message: S.of(context).account_created);
                    cubit.isShow == false
                        ? cubit.showPassword(0)
                        : cubit.isShow[0] = true;
                    Navigator.pop(context);
                  } else if (state is AuthenticationFailuer) {
                    flutterToast(message: state.erroMessage);
                  }
                },
                builder: (context, state) {
                  if (state is AuthenticationLoading) {
                    return const LoadingWidget();
                  } else {
                    return Custombottom(
                      text: S.of(context).signUp,
                      ontap: () async {
                        if (formstate.currentState!.validate()) {
                          await BlocProvider.of<AuthenticationCubit>(context)
                              .authentication(
                            endpoint: AppConst.endpointrigister,
                            queryParameters: {
                              "name": username,
                              "phone": phoneNumber,
                              "email": email,
                              "password": password,
                            },
                          );
                        }
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}

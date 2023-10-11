
import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';

import '../../manager/cubit/authentication_cubit.dart';
import '../../../generated/l10n.dart';
import '../../../shared/shared_prefrence.dart';
import '../../../util/app_const.dart';
import '../../../util/flutter_tost.dart';
import '../../../util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../util/app_router.dart';
import '../../../util/widget/custom_bottom.dart';
import '../../../util/widget/custom_text_form_filed.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key, required this.formstate});
  final GlobalKey<FormState> formstate;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ShowPasswordCubit>(context);

    late String email;

    late String password;
    return Form(
      key: formstate,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(

            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .25),
              // InkWell(onTap: ()=>print(MySharedPrefrence.get(key: AppConst.token)),
              // child: Text('asdasdasdas'),
              //),
              Text(
                S.of(context).login,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              CustomTextFolemFiled(
                text: 'Email',
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
                index: 1,
                suffixIcon: Icons.visibility,
              ),
              const SizedBox(height: 10),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is AuthenticationFailuer) {
                    flutterToast(message: state.erroMessage);
                  } else if (state is AuthenticationSuccfuly) {
                    MySharedPrefrence.setData(
                        key: AppConst.token,
                        value: state.userModel.data!.token);
                    flutterToast(
                        message: S.of(context).logged_successfuly);

                    Navigator.pushReplacementNamed(
                        context, AppRouter.homescreen);
                    cubit.isShow == false
                        ? cubit.showPassword(1)
                        : cubit.isShow[1] = true;
                  }
                },
                builder: (context, state) {
                  if (state is AuthenticationLoading) {
                    return const LoadingWidget();
                  } else {
                    return Custombottom(
                      text: S.of(context).login,
                      ontap: () async {
                        if (formstate.currentState!.validate()) {
                          BlocProvider.of<AuthenticationCubit>(context)
                              .authentication(
                                  endpoint: AppConst.endpointlogin,
                                  queryParameters: {
                                "email": email,
                                "password": password
                              });
                        }
                      },
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    '${S.of(context).dont_have_account}  ',
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.rigisterScreen);
                    },
                    child:  Text(
                      S.of(context).signUp,
                      style:const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

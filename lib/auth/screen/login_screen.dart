import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';

import '../data/repo/home_repo_imple.dart';
import '../manager/cubit/authentication_cubit.dart';
import 'widget/login_screen_body.dart';
import '../../util/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(
            HomeRepoImpl(
              ApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
            body: LoginScreenBody(
          formstate: GlobalKey(),
        )),
      ),
    );
  }
}

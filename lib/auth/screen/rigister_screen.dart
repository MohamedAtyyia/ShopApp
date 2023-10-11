import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';

import '../../util/api_service.dart';
import '../data/repo/home_repo_imple.dart';
import '../manager/cubit/authentication_cubit.dart';
import 'widget/rigister_screen_body.dart';

class RigiserScreen extends StatelessWidget {
  const RigiserScreen({super.key});

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
            body: RigigsterScreenBody(
          formstate: GlobalKey(),
        )),
      ),
    );
  }
}

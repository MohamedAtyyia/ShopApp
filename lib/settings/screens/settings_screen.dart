import 'package:shop_app/home/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/settings/screens/widget/setting_screen_body.dart';
import 'package:shop_app/util/cubit/localization_cubit/localization_cubit.dart';
import 'package:shop_app/util/widget/loading_widget.dart';

import '../../generated/l10n.dart';
import '../manager/cubit/setting_cubit.dart';
import '../../shared/shared_prefrence.dart';
import '../../util/app_const.dart';
import '../../util/app_router.dart';
import '../../util/flutter_tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationCubit,LocalizationState>(
      listener: (context,state)async{
        if(state is LanguageIsEnglisgh || state is LanguageIsArabic){
            await BlocProvider.of<HomeCubit>(context).featchDataofHome();
                BlocProvider.of<LocalizationCubit>(context).startLoading(false);
        }
                      },
      builder: (context, state) {
        if (BlocProvider.of<LocalizationCubit>(context).isLoading == true) {
          return const LoadingWidget();
        } else {
          return _buildBuilder();
        }
      },
    );
  }

  BlocBuilder<SettingCubit, SettingState> _buildBuilder() {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      if (state is SettingFailuerState) {
        return Center(
          child: Text(state.erroMessage),
        );
      } else if (state is SettingSuccessfulyState) {
        return SettingScreenBody(
          userModel: state.userModel,
        );
      } else if (state is LogoutFailuer) {
        return Center(child: Text(state.erroMessage));
      } else if (state is LogoutSuccessfuly) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          MySharedPrefrence.deleteValue(AppConst.token);
          Navigator.pushReplacementNamed(context, AppRouter.loginscreen);
          flutterToast(message: S.of(context).logged_successfuly);
        });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}

int a = 0;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app/shared/shared_prefrence.dart';
import 'package:shop_app/util/api_service.dart';
import 'package:shop_app/util/app_const.dart';
import 'package:shop_app/util/app_router.dart';
import 'package:shop_app/util/bloc_observer.dart';
import 'package:shop_app/util/cubit/localization_cubit/localization_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPrefrence.init();
  // Stripe.publishableKey = AppConst.publishablekey;
  ApiService.init();

  Bloc.observer = const AppBlocObserver();

  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationCubit()..changeLanguage(openApp: true),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
                 locale: Locale(BlocProvider.of<LocalizationCubit>(context).language),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: MySharedPrefrence.get(key: AppConst.token) == null
                ? AppRouter.loginscreen
                : AppRouter.homescreen,
          );
        },
      )
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cart/data/repo/home_repo_imple.dart';
import 'package:shop_app/cart/manager/cart_cubit.dart';
import 'package:shop_app/favorite/data/repo/home_repo_imple.dart';
import 'package:shop_app/favorite/manager/favorit_cubit.dart';
import 'package:shop_app/home/data/repo/home_repo_imple.dart';
import 'package:shop_app/home/manager/bootom/bottom_nav_bar_cubit.dart';
import 'package:shop_app/home/manager/category/category_cubit.dart';
import 'package:shop_app/home/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/home/screens/details_screen.dart';
import 'package:shop_app/home/screens/home_page.dart';
import 'package:shop_app/settings/data/repo/home_repo_imple.dart';
import 'package:shop_app/settings/manager/cubit/setting_cubit.dart';
import 'package:shop_app/settings/screens/change_password.dart';
import 'package:shop_app/util/api_service.dart';
import 'package:shop_app/util/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';

import '../auth/screen/login_screen.dart';
import '../auth/screen/rigister_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String rigisterScreen = '/rigisterscreen';
  static const String homescreen = '/homescreen';
  static const String detailsScreen = '/detailsScreen';
  static const String loginscreen = '/loginscreen';
  static const String changepassword = '/changepassword';

  static CartCubit cartCubit = CartCubit(HomeRepoImpleCart(ApiService()));
  static FavoritCubit favoritCubit =
      FavoritCubit(HomeRepoImpleFavorit(ApiService()));
  static SettingCubit settingCubit =
      SettingCubit(HomeRepoImpleSetting(ApiService()));
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case rigisterScreen:
        return MaterialPageRoute(builder: (_) => const RigiserScreen());
      case homescreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomNavBarCubit(),
              ),
              BlocProvider(
                create: (context) => CategoryCubit(
                  HomeRepoImple(
                    ApiService(),
                  ),
                )..featchDataofCategory(),
              ),
              BlocProvider(
                create: (context) => HomeCubit(
                  HomeRepoImple(
                    ApiService(),
                  ),
                )..featchDataofHome(),
              ),
              BlocProvider<CartCubit>.value(
                value: cartCubit..featchAllItemCart(),
              ),
              BlocProvider<FavoritCubit>.value(
                value: favoritCubit..featchAllItemFavorite(),
              ),
              BlocProvider<SettingCubit>.value(
                value: settingCubit..featchDataofProfile(),
              ),
            ],
            child: const HomePage(),
          ),
        );

      case detailsScreen:
        final dataofProduct = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CartCubit>.value(
                value: cartCubit,
              ),
              BlocProvider<FavoritCubit>.value(
                value: favoritCubit..featchAllItemFavorite(),
              ),
            ],
            child: DetailsScreen(dataofProduct: dataofProduct),
          ),
        );
      case changepassword:
        final userModel = settings.arguments as UserModel;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<SettingCubit>.value(
                      value: settingCubit,
                    ),
                    BlocProvider(
                      create: (context) => ShowPasswordCubit(),
                    ),
                  ],
                  child: ChangePassword(
                    userModel: userModel,
                  ),
                ));
    }
  }
}

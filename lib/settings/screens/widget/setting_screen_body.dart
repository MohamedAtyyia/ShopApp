import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cart/manager/cart_cubit.dart';
import 'package:shop_app/favorite/manager/favorit_cubit.dart';

import 'package:shop_app/settings/screens/widget/custom_list_tile.dart';
import 'package:shop_app/shared/shared_prefrence.dart';
import 'package:shop_app/util/app_const.dart';
import 'package:shop_app/util/cubit/localization_cubit/localization_cubit.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';

import '../../../generated/l10n.dart';
import '../../../util/app_router.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(userModel.data!.image.toString(),
                          fit: BoxFit.cover)),
                ),
                const Icon(
                  Icons.camera_alt,
                  size: 24,
                )
              ],
            ),
            const SizedBox(height: 12),
            Text(userModel.data!.name.toString(),
                style: Theme.of(context).textTheme.titleMedium),
            CustomListTile(
              ontap: () {
                Navigator.pushNamed(context, AppRouter.changepassword,
                    arguments: userModel);
              },
              titl: S.of(context).change_password,
              leading: Icons.lock_rounded,
            ),
            const SizedBox(height: 12),
            CustomListTile(
              ontap: () async {
                BlocProvider.of<LocalizationCubit>(context).isLoading = true;
                await BlocProvider.of<LocalizationCubit>(context)
                    .changeLanguage();
              },
              titl: S.of(context).language,
              leading: Icons.language,
            ),
            const SizedBox(height: 12),
            CustomListTile(
                ontap: () {
                  Navigator.pushReplacementNamed(
                      context, AppRouter.loginscreen);
                  BlocProvider.of<CartCubit>(context).cardId.clear();
                  BlocProvider.of<FavoritCubit>(context).favoritId.clear();
                  MySharedPrefrence.deleteValue(AppConst.token);
                },
                titl: S.of(context).log_out,
                leading: Icons.logout)
          ],
        ));
  }
}

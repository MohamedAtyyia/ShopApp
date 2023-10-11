import 'package:flutter/material.dart';
import 'package:shop_app/settings/screens/widget/change_password-body.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ChangePasswordBody(
        formstate: GlobalKey(),
        userModel: userModel,
      )),
    );
  }
}

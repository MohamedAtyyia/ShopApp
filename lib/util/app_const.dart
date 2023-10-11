import 'package:flutter/material.dart';

class AppConst {
  static const String baseurl = 'https://student.valuxapps.com/api/';
  static const String endpointlogin = 'login';
  static const String endpointrigister = 'register';
  static const String token = 'token';
  //دى key بتاعت bool الهيتخزن فى shard
  static const String isarabic = 'isarabic';
  // دى key  الهتشيل اسم اللغه الهيشتغل بيها التطبيق وهتكون متحزنه ف shard 
  static const String language =  'language';
  ///....
  static const String endpointHome = 'home';
  static const String endpointCategory = 'categories';
  static const String endpointCart = 'carts';

  static const String endpointfavorit = 'favorites';
  static const String endpointProfile = 'profile';

  static const String endpointlogout = 'logout';
  static const String changepassword = 'update-profile';

  static const String publishablekey = 'pk_test_51NlVoHE3Gwf7W2Mz0gZuXptXa5eFv61hvkMkCMgO6xm5QHlPkb2nvyUhbGjww5vWk3cLCsq34Qa8xVYZhvQCuOpP00uGlNjoyA';
  static const String secretkey ='sk_test_51NlVoHE3Gwf7W2MzcnXgdlCZU1ZhEYq78p6KkyY7ibKKR9eJnATP8ck8JCpBRnlW86OPC3CnXLbMhhpxdzAI7UZc00frwSpZ2Y';
  static const Color basecolor =  Color(0xff01BE84);

  //quantity
  static void ShowSnakbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$message')),
    );
  }
}

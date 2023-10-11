import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefrence {
  static late SharedPreferences sharedPreferences;
 static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> setData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setBool(key, value);
    }
  }
  static  Future<void> deleteValue(String key) async {
    await sharedPreferences.remove(key);
  }


 static get({required String key}){
      return  sharedPreferences.get(key);
  }



}

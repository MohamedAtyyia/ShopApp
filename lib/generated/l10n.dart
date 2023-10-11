// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LOG IN`
  String get login {
    return Intl.message(
      'LOG IN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `You have been logged in successfully`
  String get logged_successfuly {
    return Intl.message(
      'You have been logged in successfully',
      name: 'logged_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an acount?`
  String get dont_have_account {
    return Intl.message(
      'Dont have an acount?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Account successfully created`
  String get account_created {
    return Intl.message(
      'Account successfully created',
      name: 'account_created',
      desc: '',
      args: [],
    );
  }

  /// `Shop App`
  String get shop_app {
    return Intl.message(
      'Shop App',
      name: 'shop_app',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `All Category`
  String get all_catefory {
    return Intl.message(
      'All Category',
      name: 'all_catefory',
      desc: '',
      args: [],
    );
  }

  /// `All Product`
  String get all_product {
    return Intl.message(
      'All Product',
      name: 'all_product',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get log_out {
    return Intl.message(
      'Log out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get faileIsRequied {
    return Intl.message(
      'Field is required',
      name: 'faileIsRequied',
      desc: '',
      args: [],
    );
  }

  /// `The two passwords must be the same`
  String get diffrent_password {
    return Intl.message(
      'The two passwords must be the same',
      name: 'diffrent_password',
      desc: '',
      args: [],
    );
  }

  /// `The password has been changed successfully`
  String get change_password_successfuly {
    return Intl.message(
      'The password has been changed successfully',
      name: 'change_password_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Add To Card`
  String get add_to_cart {
    return Intl.message(
      'Add To Card',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `This Product is in the cart`
  String get product_in_cart {
    return Intl.message(
      'This Product is in the cart',
      name: 'product_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `This Product is in the Favorite`
  String get product_in_favorit {
    return Intl.message(
      'This Product is in the Favorite',
      name: 'product_in_favorit',
      desc: '',
      args: [],
    );
  }

  /// `The product has been added to the cart`
  String get product_add_cart {
    return Intl.message(
      'The product has been added to the cart',
      name: 'product_add_cart',
      desc: '',
      args: [],
    );
  }

  /// `The Product has been added in Favorite`
  String get product_add_favorit {
    return Intl.message(
      'The Product has been added in Favorite',
      name: 'product_add_favorit',
      desc: '',
      args: [],
    );
  }

  /// `the Product has been deleted from Favorit`
  String get product_deleted_from_favorit {
    return Intl.message(
      'the Product has been deleted from Favorit',
      name: 'product_deleted_from_favorit',
      desc: '',
      args: [],
    );
  }

  /// `the Product has been deleted from Cart`
  String get product_deleted_from_cart {
    return Intl.message(
      'the Product has been deleted from Cart',
      name: 'product_deleted_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `There are no items in the Cart`
  String get cart_is_empty {
    return Intl.message(
      'There are no items in the Cart',
      name: 'cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `There are no items in the Favorit`
  String get favorit_is_empty {
    return Intl.message(
      'There are no items in the Favorit',
      name: 'favorit_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully logged out`
  String get logou_is_successfuly {
    return Intl.message(
      'You have successfully logged out',
      name: 'logou_is_successfuly',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

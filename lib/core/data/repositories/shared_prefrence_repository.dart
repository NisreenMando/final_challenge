import 'dart:convert';

import 'package:fluter_template/core/data/enums/data_type.dart';
import 'package:fluter_template/core/data/models/apis/token_info.dart';
import 'package:fluter_template/core/data/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences storage = Get.find();

  //!--- Keys -----
  // ignore: non_constant_identifier_names
  String PREF_FIRST_LUNCH = 'first_lunch';
  // ignore: non_constant_identifier_names
  String PREF_FIRST_LOGIN = 'first_login';
  // ignore: non_constant_identifier_names
  String PREF_TOKEN = 'token';
  // ignore: non_constant_identifier_names
  String PREF_APP_LANG = 'app_lang';
  // ignore: non_constant_identifier_names
  String PREF_CART_LIST = 'pref_cart_list';

  void setFirstLunch(bool value) async {
    setPreferenc(
      dataTyep: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }

  bool getFirstLunch() {
    if (storage.containsKey(PREF_FIRST_LUNCH)) {
      return getPreferenc(key: PREF_FIRST_LUNCH);
    } else {
      return true;
    }
  }

  void setFirstLogin(bool value) {
    setPreferenc(
      dataTyep: DataType.BOOL,
      key: PREF_FIRST_LOGIN,
      value: value,
    );
  }

  bool getFirstLogin() {
    if (storage.containsKey(PREF_FIRST_LOGIN)) {
      return getPreferenc(key: PREF_FIRST_LOGIN);
    } else {
      return true;
    }
  }

  void setAppLang(String value) {
    setPreferenc(
      dataTyep: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLang() {
    if (storage.containsKey(PREF_APP_LANG)) {
      return getPreferenc(key: PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  void setTokenInfo(TokenInfo value) {
    setPreferenc(
      dataTyep: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfo? getTokenInfo() {
    if (storage.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(
        jsonDecode(getPreferenc(key: PREF_TOKEN)),
      );
    } else {
      return null;
    }
  }

  void setCartList(List<CartModel> list) {
    //قلبناها ل stringوحفظناها
    setPreferenc(
      dataTyep: DataType.STRING,
      key: PREF_CART_LIST,
      //????????
      value: CartModel.encode(list),
    );
  }

//////////////?????
  List<CartModel> getCartList() {
    if (storage.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreferenc(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  bool get isLogedIn => getTokenInfo() != null ? true : false;
  //!--- Main Function -------
  setPreferenc(
      {required DataType dataTyep,
      required String key,
      required dynamic value}) async {
    switch (dataTyep) {
      case DataType.INT:
        await storage.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await storage.setDouble(key, value);
        break;
      case DataType.STRING:
        await storage.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await storage.setStringList(key, value);
        break;
      case DataType.BOOL:
        await storage.setBool(key, value);
        break;
    }
  }

  dynamic getPreferenc({required String key}) {
    return storage.get(key);
  }
}

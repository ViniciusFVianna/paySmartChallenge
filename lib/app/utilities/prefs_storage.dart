import 'package:get_storage/get_storage.dart';

import 'constants_strings.dart';

class PrefsStorage {

  void setToken(String val) => GetStorage().write(ConstantsStrings.authPrefs, val.toString());

  String get getToken => GetStorage().read(ConstantsStrings.authPrefs);


  void setData(String key, dynamic value) => GetStorage().write(key, value);

  void setString(String key, String value) => GetStorage().write(key, value);

  int? getInt(String key) => GetStorage().read(key);

  String? getString(String key) => GetStorage().read(key);

  bool? getBool(String key) => GetStorage().read(key);

  double? getDouble(String key) => GetStorage().read(key);

  dynamic getData(String key) => GetStorage().read(key);

  void clearData() async => GetStorage().erase();

}
import 'package:adavance_go_router/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isAuthenticate() {
    return sharedPreferences.getBool(sharedAuthenticateKey) ?? false;
  }

  void setAuthenticate({required bool isLogin}) {
    sharedPreferences.setBool(sharedAuthenticateKey, isLogin);
  }

  String getLocale() {
    return sharedPreferences.getString(localeKey) ?? 'en';
  }

  void setLocale({required String locale}) {
    sharedPreferences.setString(localeKey, locale);
  }
}
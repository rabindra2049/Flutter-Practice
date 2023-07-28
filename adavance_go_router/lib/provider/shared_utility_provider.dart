import 'package:adavance_go_router/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider =
    StateNotifierProvider<SharedUtilityNotifier, SharedUtilityState>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtilityNotifier(sharedPreferences: sharedPrefs);
});

class SharedUtilityState {
  final bool isAuthenticated;
  final String locale;

  SharedUtilityState({
    required this.isAuthenticated,
    required this.locale,
  });

  SharedUtilityState copyWith({bool? isAuthenticated, String? locale}) {
    return SharedUtilityState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      locale: locale ?? this.locale,
    );
  }
}

class SharedUtilityNotifier extends StateNotifier<SharedUtilityState> {
  final SharedPreferences sharedPreferences;

  SharedUtilityNotifier({required this.sharedPreferences})
      : super(SharedUtilityState(
            isAuthenticated:
                sharedPreferences.getBool(sharedAuthenticateKey) ?? false,
            locale: sharedPreferences.getString(localeKey) ?? 'en'));

  void setAuthenticate({required bool isLogin}) {
    state = state.copyWith(isAuthenticated: isLogin);
    sharedPreferences.setBool(sharedAuthenticateKey, isLogin);
  }

  void setLocale({required String locale}) {
    state = state.copyWith(locale: locale);
    sharedPreferences.setString(localeKey, locale);
  }
}

/*
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
}*/

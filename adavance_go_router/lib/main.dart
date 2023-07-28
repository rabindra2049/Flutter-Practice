import 'package:adavance_go_router/provider/shared_utility_provider.dart';
import 'package:adavance_go_router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const AdvanceRouteApp(),
  ));
}

class AdvanceRouteApp extends ConsumerWidget {
  const AdvanceRouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final router = ref.watch(goRouterProvider);
    final sharedUtility = ref.watch(sharedUtilityProvider);
    return MaterialApp.router(
      locale: Locale(sharedUtility.locale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: "Advance Routing",
      routerConfig: router,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

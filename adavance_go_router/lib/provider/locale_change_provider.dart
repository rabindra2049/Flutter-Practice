import 'package:adavance_go_router/provider/shared_utility_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateProvider<String>((ref) {
  final sharedUtility = ref.read(sharedUtilityProvider);
  return sharedUtility.getLocale();
});

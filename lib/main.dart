import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_app/app.dart';
import 'package:lm_labs_app/src/features/shared_preferences/application/shared_preferences.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: LLApp(
        initAppProvider: initAppProvider,
        appBuilder: (context) => const MyApp(),
      ),
    ),
  );
}

@Riverpod(keepAlive: true)
Future<void> initApp(InitAppRef ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    ref.invalidate(asyncSharedPreferencesProvider);
  });

  // await for all initialization code to be complete before returning
  await [
    // // Firebase init
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    // // list of providers to be warmed up
    ref.watch(asyncSharedPreferencesProvider.future),
  ].wait;
}

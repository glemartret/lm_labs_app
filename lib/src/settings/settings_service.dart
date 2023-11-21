import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final settingsServiceProvider = Provider(
//   (ref) => SettingsService(
//     ref.watch(sharedPreferencesProvider),
//   ),
// );

// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError();
// });

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

// /// A service that stores and retrieves user settings.
// ///
// /// By default, this class does not persist user settings. If you'd like to
// /// persist the user settings locally, use the shared_preferences package. If
// /// you'd like to store settings on a web server, use the http package.
// class SettingsService {
//   final SharedPreferences sharedPreferences;

//   SettingsService(this.sharedPreferences);

//   /// Loads the User's preferred ThemeMode from local or remote storage.
//   ThemeMode themeMode() =>
//       ThemeMode.values[sharedPreferences.getInt('themeMode') ?? 0];

//   /// Persists the user's preferred ThemeMode to local or remote storage.
//   // Use the shared_preferences package to persist settings locally or the
//   // http package to persist settings over the network.
//   Future<bool> updateThemeMode(ThemeMode? theme) async =>
//       sharedPreferences.setInt('themeMode', theme?.index ?? 0);
// }

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  late SharedPreferences prefs;

  ThemeModeNotifier() : super(ThemeMode.system) {
    unawaited(_init());
  }

  ThemeMode get themeMode => state;

  set themeMode(ThemeMode mode) {
    state = mode;
    unawaited(prefs.setInt('themeMode', mode.index));
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    final themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? 0];
    state = themeMode;
  }
}

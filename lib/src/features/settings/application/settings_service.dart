import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_service.g.dart';

@Riverpod(
  keepAlive: true,
)
Future<SharedPreferences> asyncSharedPreferences(
  AsyncSharedPreferencesRef ref,
) =>
    SharedPreferences.getInstance();

// @riverpod
// SettingsService settingsService(SettingsServiceRef ref) => SettingsService(
//       ref.watch(sharedPreferencesProvider),
//     );

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    ref.watch(asyncSharedPreferencesProvider).requireValue;

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  @override
  ThemeMode build() => ThemeMode
      .values[ref.watch(sharedPreferencesProvider).getInt('themeMode') ?? 0];

  /// Persists the user's preferred ThemeMode to local or remote storage.
  // Use the shared_preferences package to persist settings locally or the
  // http package to persist settings over the network.
  Future<bool> update(ThemeMode? theme) async {
    final res = await ref
        .read(sharedPreferencesProvider)
        .setInt('themeMode', theme?.index ?? 0);
    state = build();
    return res;
  }
}

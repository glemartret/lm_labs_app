import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lm_labs_app/src/features/shared_preferences/application/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_service.g.dart';

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncSharedPreferencesHash() =>
    r'61f77631824dd46a1a96dbc512a65e076c6291ab';

/// See also [asyncSharedPreferences].
@ProviderFor(asyncSharedPreferences)
final asyncSharedPreferencesProvider =
    FutureProvider<SharedPreferences>.internal(
  asyncSharedPreferences,
  name: r'asyncSharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncSharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AsyncSharedPreferencesRef = FutureProviderRef<SharedPreferences>;
String _$sharedPreferencesHash() => r'abc365c2e5a7e7d5730114a32a42db3443cea074';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider =
    AutoDisposeProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = AutoDisposeProviderRef<SharedPreferences>;
String _$themeModeNotifierHash() => r'06a296004a6fa7d376f31bd3bbee083f1326253f';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
///
/// Copied from [ThemeModeNotifier].
@ProviderFor(ThemeModeNotifier)
final themeModeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeModeNotifier, ThemeMode>.internal(
  ThemeModeNotifier.new,
  name: r'themeModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeNotifier = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

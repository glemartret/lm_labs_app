// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences.dart';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

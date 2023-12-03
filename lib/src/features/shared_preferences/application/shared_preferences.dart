import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(
  keepAlive: true,
)
Future<SharedPreferences> asyncSharedPreferences(
  AsyncSharedPreferencesRef ref,
) =>
    SharedPreferences.getInstance();

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    ref.watch(asyncSharedPreferencesProvider).requireValue;

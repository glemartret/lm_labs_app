// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$jokeHash() => r'05e51873e28f674621ff1c8e7c224541af727d3b';

/// See also [joke].
@ProviderFor(joke)
final jokeProvider = AutoDisposeFutureProvider<Joke>.internal(
  joke,
  name: r'jokeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$jokeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JokeRef = AutoDisposeFutureProviderRef<Joke>;
String _$jokesRepositoryHash() => r'8c1056bb60641d2ff98113ed1e5514639f33b294';

/// See also [jokesRepository].
@ProviderFor(jokesRepository)
final jokesRepositoryProvider = AutoDisposeProvider<JokesRepository>.internal(
  jokesRepository,
  name: r'jokesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$jokesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JokesRepositoryRef = AutoDisposeProviderRef<JokesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

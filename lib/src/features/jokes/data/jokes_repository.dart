import 'package:dio/dio.dart';
import 'package:lm_labs_app/src/features/jokes/domain/joke.dart';
import 'package:lm_labs_utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jokes_repository.g.dart';

@riverpod
Future<Joke> joke(JokeRef ref) => ref.watch(jokesRepositoryProvider).getJoke(
      cancelToken: ref.cancelToken(),
    );

@riverpod
JokesRepository jokesRepository(
  JokesRepositoryRef ref,
) =>
    JokesRepository(dio: ref.watch(dioProvider));

class JokesRepository {
  final Dio dio;

  JokesRepository({required this.dio});

  Future<Joke> getJoke({
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      'https://v2.jokeapi.dev/joke/Any?type=single',
      cancelToken: cancelToken,
    );

    return Joke.fromJson(response.data!);
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_app/src/features/jokes/data/jokes_repository.dart';
import 'package:lm_labs_app/src/features/jokes/presentation/jokes.i18n.dart';
import 'package:lm_labs_utils/widgets.dart';

class JokesView extends ConsumerWidget {
  const JokesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joke = ref.watch(jokeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes'.i18n),
      ),
      body: SafeArea(
        child: Center(
          child: AsyncValueWidget(
            value: joke,
            builder: (joke) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                joke.joke,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.invalidate(jokeProvider),
        tooltip: 'Refresh'.i18n,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

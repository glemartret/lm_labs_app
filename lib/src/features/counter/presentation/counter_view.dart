import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_app/src/features/counter/application/counter_provider.dart';
import 'package:lm_labs_app/src/features/counter/presentation/counter.i18n.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Counter'.i18n),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:'.i18n,
              ),
              Text(
                '${ref.watch(counterProvider)}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // The read method is a utility to read a provider
          // without listening to it
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          tooltip: 'Increment'.i18n,
          child: const Icon(Icons.add),
        ),
      );
}

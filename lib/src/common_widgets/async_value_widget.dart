// Generic AsyncValueWidget to work with values of type T
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueSliverWidget<T> extends StatelessWidget {
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) builder;

  const AsyncValueSliverWidget({
    required this.value,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => switch (value) {
        AsyncData(:final value) => builder(value),
        AsyncError(:final error) => SliverToBoxAdapter(
            child: Center(
              child: Text(
                error.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.red),
              ),
            ),
          ),
        _ => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
      };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AsyncValue<T>>('value', value))
      ..add(ObjectFlagProperty<Widget Function(T p1)>.has('builder', builder));
  }
}

class AsyncValueWidget<T> extends StatelessWidget {
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) builder;

  const AsyncValueWidget({
    required this.value,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => switch (value) {
        AsyncData(:final value) => builder(value),
        AsyncError(:final error) => Center(
            child: Text(
              error.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.red),
            ),
          ),
        _ => const Center(child: CircularProgressIndicator()),
      };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AsyncValue<T>>('value', value))
      ..add(ObjectFlagProperty<Widget Function(T p1)>.has('builder', builder));
  }
}

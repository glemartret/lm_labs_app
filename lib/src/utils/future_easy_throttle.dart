import 'dart:async';

import 'package:lm_labs_app/src/utils/extensions/completer_extension.dart';

typedef FutureEasyThrottleCallback = Future<void> Function();

class FutureEasyThrottle {
  static final Map<String, (_FutureEasyThrottleOperation, Completer)>
      _operations = {};

  /// Cancels any active throttle with the given [tag].
  static void cancel(String tag) {
    _operations[tag]?.$1.timer.cancel();
    _operations[tag]?.$2.tryComplete();
    _operations.remove(tag);
  }

  /// Cancels all active throttles.
  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.$1.timer.cancel();
      operation.$2.tryComplete();
    }
    _operations.clear();
  }

  /// Returns the number of active throttles
  static int count() => _operations.length;

  /// Will execute [onExecute] immediately and ignore additional attempts to
  /// call throttle with the same [tag] happens for the given [duration].
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular
  /// throttle operation in subsequent calls to [throttle()] or [cancel()].
  ///
  /// [duration] is the amount of time subsequent attempts will be ignored.
  static Future<void> throttle(
    String tag,
    Duration duration,
    FutureEasyThrottleCallback onExecute, {
    FutureEasyThrottleCallback? onAfter,
  }) {
    final throttled = _operations.containsKey(tag);
    if (throttled) {
      return _operations[tag]!.$2.future;
    }

    _operations[tag] = (
      _FutureEasyThrottleOperation(
        onExecute,
        Timer(duration, () {
          _operations[tag]?.$1.timer.cancel();
          final removed = _operations.remove(tag);

          removed?.$1.onAfter?.call();
        }),
        onAfter: onAfter,
      ),
      Completer(),
    );

    onExecute().then((_) {
      _operations[tag]?.$2.tryComplete();
      _operations.remove(tag);
    });

    return _operations[tag]?.$2.future ?? Future.value();
  }
}

class _FutureEasyThrottleOperation {
  FutureEasyThrottleCallback callback;
  FutureEasyThrottleCallback? onAfter;
  Timer timer;

  _FutureEasyThrottleOperation(
    this.callback,
    this.timer, {
    this.onAfter,
  });
}

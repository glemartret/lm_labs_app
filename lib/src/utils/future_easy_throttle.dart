import 'dart:async';

import 'package:lm_labs_app/src/utils/extensions/completer_extension.dart';

typedef FutureEasyThrottleCallback = Future<void> Function();

class FutureEasyThrottle {
  static final Map<String, _FutureEasyThrottleOperation> _operations = {};
  static final Map<String, Completer> _completers = {};

  /// Cancels any active throttle with the given [tag].
  static void cancel(String tag) {
    _operations[tag]?.timer.cancel();
    _operations.remove(tag);

    _completers[tag]?.completeIfNotCompleted();
    _completers.remove(tag);
  }

  /// Cancels all active throttles.
  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.timer.cancel();
    }
    _operations.clear();

    for (final completer in _completers.values) {
      completer.completeIfNotCompleted();
    }
    _completers.clear();
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
    _completers[tag] ??= Completer();

    final throttled = _operations.containsKey(tag);
    if (throttled) {
      return _completers[tag]!.future;
    }

    _operations[tag] = _FutureEasyThrottleOperation(
      onExecute,
      Timer(duration, () {
        _operations[tag]?.timer.cancel();
        final removed = _operations.remove(tag);

        removed?.onAfter?.call();
      }),
      onAfter: onAfter,
    );

    onExecute().then((_) {
      _completers[tag]?.completeIfNotCompleted();
      _completers.remove(tag);
    });

    return _completers[tag]?.future ?? Future.value();
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

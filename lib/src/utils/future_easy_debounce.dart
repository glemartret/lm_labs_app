import 'dart:async';

import 'package:lm_labs_app/src/utils/extensions/completer_extension.dart';

/// A void callback, i.e. (){}, so we don't need to import e.g. `dart.ui`
/// just for the VoidCallback type definition.
typedef FutureFutureEasyDebounceCallback = Future<void> Function();

/// A static class for handling method call debouncing.
class FutureEasyDebounce {
  static final Map<String, (_FutureEasyDebounceOperation, Completer)>
      _operations = {};

  /// Cancels any active debounce operation with the given [tag].
  static void cancel(String tag) {
    _operations[tag]?.$1.timer.cancel();
    _operations[tag]?.$2.tryComplete();
    _operations.remove(tag);
  }

  /// Cancels all active debouncers.
  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.$1.timer.cancel();
    }
    _operations.clear();
  }

  /// Returns the number of active debouncers (debouncers that haven't yet
  /// called their onExecute methods).
  static int count() => _operations.length;

  /// Will delay the execution of [onExecute] with the given [duration].
  /// If another call to debounce() with the same [tag] happens within
  /// this duration, the first call will be cancelled and the debouncer
  /// will start waiting for another [duration] before executing [onExecute].
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular
  /// debounce operation in subsequent calls to [debounce()] or [cancel()].
  ///
  /// If [duration] is `Duration.zero`, [onExecute] will be executed
  /// immediately, i.e. synchronously.
  static Future<void> debounce(
    String tag,
    Duration duration,
    FutureFutureEasyDebounceCallback onExecute,
  ) {
    if (duration == Duration.zero) {
      _operations[tag]?.$1.timer.cancel();

      onExecute().then((_) {
        _operations[tag]?.$2.tryComplete();
        _operations.remove(tag);
      });
    } else {
      _operations[tag]?.$1.timer.cancel();

      _operations[tag] = (
        _FutureEasyDebounceOperation(
          onExecute,
          Timer(duration, () {
            _operations[tag]?.$1.timer.cancel();
            _operations.remove(tag);

            onExecute().then((_) {
              _operations[tag]?.$2.tryComplete();
              _operations.remove(tag);
            });
          }),
        ),
        Completer(),
      );
    }

    return _operations[tag]?.$2.future ?? Future.value();
  }

  /// Fires the callback associated with [tag] immediately. This does not
  /// cancel the debounce timer, so if you want to invoke the callback and
  /// cancel the debounce timer, you must first call `fire(tag)` and
  /// then `cancel(tag)`.
  static Future<void> fire(String tag) {
    _operations[tag]?.$1.callback().then((_) {
      _operations[tag]?.$2.tryComplete();
      _operations.remove(tag);
    });

    return _operations[tag]?.$2.future ?? Future.value();
  }
}

class _FutureEasyDebounceOperation {
  FutureFutureEasyDebounceCallback callback;
  Timer timer;

  _FutureEasyDebounceOperation(this.callback, this.timer);
}

import 'dart:async';

extension CompleterX on Completer {
  bool tryComplete([FutureOr<dynamic>? value]) {
    if (!isCompleted) {
      complete(value);
      return true;
    }

    return false;
  }
}

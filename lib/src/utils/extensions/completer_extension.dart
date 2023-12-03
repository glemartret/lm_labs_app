import 'dart:async';

extension CompleterX on Completer {
  void completeIfNotCompleted([FutureOr<dynamic>? value]) {
    if (!isCompleted) {
      complete(value);
    }
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';

/// Web safe version of [Platform].
class LLPlatform {
  static final bool isWindows = !kIsWeb && Platform.isWindows;
  static final bool isAndroid = !kIsWeb && Platform.isAndroid;
  static final bool isIOS = !kIsWeb && Platform.isIOS;
  static final bool isLinux = !kIsWeb && Platform.isLinux;
  static final bool isMacOS = !kIsWeb && Platform.isMacOS;

  static final bool isDesktop = isLinux || isMacOS || isWindows;
  static final bool isMobile = isAndroid || isIOS;
}

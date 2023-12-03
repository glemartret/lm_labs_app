import 'dart:io';

import 'package:flutter/foundation.dart';

final kIsAndroid = !kIsWeb && Platform.isAndroid;
final kIsDesktop = kIsLinux || kIsMacOS || kIsWindows;
final kIsIOS = !kIsWeb && Platform.isIOS;
final kIsLinux = !kIsWeb && Platform.isLinux;
final kIsMacOS = !kIsWeb && Platform.isMacOS;
final kIsMobile = kIsAndroid || kIsIOS;
final kIsWindows = !kIsWeb && Platform.isWindows;

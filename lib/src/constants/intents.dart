import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lm_labs_utils/constants.dart';

class CloseAppAction extends Action<CloseAppIntent> {
  @override
  Future<void> invoke(covariant CloseAppIntent intent) async {
    if (LLPlatform.isDesktop) {
      exit(0);
    } else {
      await SystemNavigator.pop();
    }

    return;
  }
}

class CloseAppIntent extends Intent {
  const CloseAppIntent();
}

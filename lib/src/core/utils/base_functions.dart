import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BaseFunctions {
  BaseFunctions._();

  static String getDefaultLocale() {
    final String defaultSystemLocale = Platform.localeName;
    switch (defaultSystemLocale.split("_").first) {
      case "ru":
        return "ru";
      case "en":
        return "en";
      case "uz":
        return "uz";
      default:
        return "ru";
    }
  }

  static String getDefaultTheme() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness.name;
  }
}

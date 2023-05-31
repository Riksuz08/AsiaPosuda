import 'dart:io';

import 'package:flutter/scheduler.dart';

final String defaultSystemLocale = Platform.localeName.split('_').first;

String get defaultLocale => switch (defaultSystemLocale) {
      'ru' => 'ru',
      'en' => 'en',
      'uz' => 'uz',
      _ => 'ru',
    };

String get defaultTheme =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';

import 'presentation/components/cupertino_back/cupertino_back_gesture.dart';

enum CustomTextDirection {
  localeBased,
  ltr,
  rtl,
}

const List<String> rtlLanguages = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

const systemLocaleOption = Locale('system');

Locale _deviceLocale = Locale(Platform.localeName);

Locale get deviceLocale => _deviceLocale;

set deviceLocale(Locale locale) {
  _deviceLocale = locale;
}

class AppOptions extends Equatable {
  const AppOptions({

    required double? textScaleFactor,
    required this.customTextDirection,
    required Locale? locale,
    required this.timeDilation,
    required this.platform,
  })  : _textScaleFactor = textScaleFactor ?? 1.0,
        _locale = locale;

  final double _textScaleFactor;
  final CustomTextDirection customTextDirection;
  final Locale? _locale;
  final double timeDilation;
  final TargetPlatform? platform;

  double textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale get locale => _locale ?? deviceLocale;

  /// Returns a text direction based on the [CustomTextDirection] setting.
  /// If it is based on locale and the locale cannot be determined, returns
  /// null.
  TextDirection? resolvedTextDirection() {
    switch (customTextDirection) {
      case CustomTextDirection.localeBased:
        final language = locale.languageCode.toLowerCase();
        return rtlLanguages.contains(language)
            ? TextDirection.rtl
            : TextDirection.ltr;
      case CustomTextDirection.rtl:
        return TextDirection.rtl;
      default:
        return TextDirection.ltr;
    }
  }

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.


  AppOptions copyWith({
    ThemeMode? themeMode,
    double? textScaleFactor,
    CustomTextDirection? customTextDirection,
    Locale? locale,
    double? timeDilation,
    TargetPlatform? platform,
  }) =>
      AppOptions(
        textScaleFactor: textScaleFactor ?? _textScaleFactor,
        customTextDirection: customTextDirection ?? this.customTextDirection,
        locale: locale ?? this.locale,
        timeDilation: timeDilation ?? this.timeDilation,
        platform: platform ?? this.platform,
      );

  static AppOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    scope.modelBindingState.updateModel(newModel);
  }

  @override
  List<Object?> get props => [

        _textScaleFactor,
        customTextDirection,
        _locale,
        timeDilation,
        platform,
      ];
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    final textDirection = options.resolvedTextDirection();
    final textScaleFactor = options.textScaleFactor(context);

    final Widget widget = MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );
    return textDirection == null
        ? widget
        : Directionality(
            textDirection: textDirection,
            child: widget,
          );
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    required this.modelBindingState,
    required super.child,
  });

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) =>
      modelBindingState.currentModel !=
      oldWidget.modelBindingState.currentModel;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding({
    super.key,
    required this.initialModel,
    required this.child,
  });

  final AppOptions initialModel;
  final Widget child;

  @override
  State<ModelBinding> createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late AppOptions currentModel;
  late Timer? _timeDilationTimer;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }

  void handleTimeDilation(AppOptions newModel) {
    if (currentModel.timeDilation != newModel.timeDilation) {
      _timeDilationTimer?.cancel();
      _timeDilationTimer = null;
      if (newModel.timeDilation > 1) {
        _timeDilationTimer = Timer(
          const Duration(milliseconds: 150),
          () {
            timeDilation = newModel.timeDilation;
          },
        );
      } else {
        timeDilation = newModel.timeDilation;
      }
    }
  }

  void updateModel(AppOptions newModel) {
    if (newModel != currentModel) {
      handleTimeDilation(newModel);
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) => BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: _ModelBindingScope(
          modelBindingState: this,
          child: widget.child,
        ),
      );
}

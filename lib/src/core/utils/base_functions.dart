import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/core/utils/constants.dart';

class BaseFunctions {
  BaseFunctions._();

  static String moneyFormat(num number) {
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(" ");
    return isNegative ? "-$result" : result;
  }

  static String moneyFormatSymbol(num number) {
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(" ");
    return "\$${isNegative ? "-$result" : result} ${AppTranslations.of(AppConstants.navigatorKey.currentContext!).sum}";
  }

  static String formatter(double currentBalance) {
    bool t = currentBalance.isNegative;
    double value = currentBalance.abs();
    if (value < 10) {
      return (t ? '-' : '') + value.toInt().toString();
    } else if (value < 1000) {
      final text = value.round().toString();
      return (t ? '-' : '') + text;
    } else if (value >= 1000 && value < 1000000) {
      return (t ? '-' : '') +
          NumberFormat.compactCurrency(decimalDigits: 3, symbol: '')
              .format(value.round());
    } else if (value >= 1000000 && value < (1000000 * 1000)) {
      return (t ? '-' : '') +
          NumberFormat.compactCurrency(decimalDigits: 6, symbol: '')
              .format(value.round());
    } else if (value >= (1000000 * 1000) && value < (1000000 * 1000 * 100)) {
      return (t ? '-' : '') +
          NumberFormat.compactCurrency(decimalDigits: 9, symbol: '')
              .format(value.round());
    } else if (value >= (1000000 * 1000 * 1000) &&
        value < (1000000 * 1000 * 1000 * 1000)) {
      return (t ? '-' : '') +
          NumberFormat.compactCurrency(decimalDigits: 12, symbol: '')
              .format(value.round());
    } else {
      return '';
    }
  }

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

  static String dateFormatter(String? value) {
    if (value == null) {
      return "";
    } else if (value.isEmpty) {
      return "";
    } else {
      final date = DateTime.parse(value).toLocal();
      return DateFormat('yyyy-MM-dd HH:mm').format(date);
    }
  }

  static String timeZone() {
    var date = DateTime.now().toIso8601String().split(".")[0];
    if (DateTime.now().timeZoneOffset.isNegative) {
      date += "-";
    } else {
      date += "+";
    }
    final timeZoneSplit = DateTime.now().timeZoneOffset.toString().split(":");

    var hour = int.parse(timeZoneSplit[0]);
    if (hour < 10) {
      date += "0${timeZoneSplit[0]}";
    }
    date += ":${timeZoneSplit[1]}";
    return date;
  }

  // static Future<void> refreshToken() async {
  //   var request = RefreshTokenRequest(
  //     refreshToken: LocalSource.instance.getRefreshToken(),
  //   );
  //   final refreshTokenRepository = RefreshTokenRepository();
  //   final result = await refreshTokenRepository.refreshToken(request: request);
  //   if (result is RefreshTokenResponse) {
  //     LocalSource.instance.setRefreshedTokens(
  //       refreshToken: result.refreshToken,
  //       accessToken: result.accessToken,
  //     );
  //   }
  // }

  static String phoneFormat(String phone) {
    if (phone.length >= 13) {
      String t = phone;
      t = t.replaceAll('+998', '');
      t = '${t.substring(0, 2)} ${t.substring(2, 5)} ${t.substring(5, 7)} ${t.substring(7, 9)}';
      return '+998 $t';
    } else {
      return phone;
    }
  }

// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}

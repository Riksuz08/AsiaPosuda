import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/core/constans/app_keys.dart';
import 'package:sample_bloc_mobile/src/core/utils/base_functions.dart';

class LocalSource {
  final Box<dynamic> box;

  LocalSource(this.box);

  Future<void> setUser({
    required String lastName,
    required String firstName,
    required String companyName,
    required String subDomain,
    required String token,
    required String refreshToken,
    required String companyId,
    required String currentShopId,
    required String currentShopName,
    required String userId,
    required String imageUrl,
  }) async {
    if (box != null) {
      await box.put(AppKeys.lastName, lastName);
      await box.put(AppKeys.firstName, firstName);
      await box.put(AppKeys.companyName, companyName);
      await box.put(AppKeys.subDomain, subDomain);
      await box.put(AppKeys.accessToken, token);
      await box.put(AppKeys.refreshToken, refreshToken);
      await box.put(AppKeys.companyId, companyId);
      await box.put(AppKeys.currentShopId, currentShopId);
      await box.put(AppKeys.currentShopName, currentShopName);
      await box.put(AppKeys.userId, userId);
      await box.put(AppKeys.imageUrl, imageUrl);
    }
  }

  String getCompanyId() {
    return box.get(AppKeys.companyId, defaultValue: "") ?? '';
  }

  String getCurrentShopId() {
    return box.get(AppKeys.currentShopId, defaultValue: "") ?? '';
  }

  String getAccessToken() {
    return box.get(AppKeys.accessToken, defaultValue: "") ?? '';
  }

  String getCurrentShopName() {
    return box.get(AppKeys.currentShopName, defaultValue: "") ?? '';
  }

  Future<void> setCurrentShopId(String value) async {
    await box.put(AppKeys.currentShopId, value);
  }

  String getSubDomain() {
    return box.get(AppKeys.subDomain, defaultValue: "") ?? '';
  }

  String getCompanyName() {
    return box.get(AppKeys.companyName, defaultValue: "") ?? '';
  }

  String getFullName() {
    return (box.get(AppKeys.firstName, defaultValue: "") ?? '') +
        ' ' +
        (box.get(AppKeys.lastName, defaultValue: "") ?? '');
  }

  String getUserId() {
    return box.get(AppKeys.userId, defaultValue: "") ?? '';
  }

  String getToken() {
    return box.get(AppKeys.accessToken, defaultValue: "") ?? '';
  }

  Future<void> setLocale(String lang) async {
    await box.put(AppKeys.languageCode, lang);
  }

  String get locale =>
      box.get(
        AppKeys.languageCode,
        defaultValue: BaseFunctions.getDefaultLocale(),
      ) ??
      BaseFunctions.getDefaultLocale();

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  ThemeMode Function() get themeMode => () {
        switch (box.get(AppKeys.themeMode)) {
          case "system":
            return ThemeMode.system;
          case "light":
            return ThemeMode.light;
          case "dark":
            return ThemeMode.dark;
          default:
            return ThemeMode.system;
        }
      };

  Future<void> clear() async {
    await box.clear();
  }
}

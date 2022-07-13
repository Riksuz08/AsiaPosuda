import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/core/utils/app_keys.dart';
import 'package:sample_bloc_mobile/src/core/utils/base_functions.dart';

class LocalSource {
  static Box? _box;

  static LocalSource? _localSource;

  LocalSource._();

  static LocalSource get instance => _localSource ?? LocalSource._();

  static Future<void> getInstance() async {
    if (_box == null) {
      _localSource ??= LocalSource._();
      _box = await Hive.openBox(AppKeys.localSource);
    }
  }

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
    if (_box != null) {
      await _box?.put(AppKeys.lastName, lastName);
      await _box?.put(AppKeys.firstName, firstName);
      await _box?.put(AppKeys.companyName, companyName);
      await _box?.put(AppKeys.subDomain, subDomain);
      await _box?.put(AppKeys.accessToken, token);
      await _box?.put(AppKeys.refreshToken, refreshToken);
      await _box?.put(AppKeys.companyId, companyId);
      await _box?.put(AppKeys.currentShopId, currentShopId);
      await _box?.put(AppKeys.currentShopName, currentShopName);
      await _box?.put(AppKeys.userId, userId);
      await _box?.put(AppKeys.imageUrl, imageUrl);
    }
  }

  String getCompanyId() {
    return _box?.get(AppKeys.companyId, defaultValue: "") ?? '';
  }

  String getCurrentShopId() {
    return _box?.get(AppKeys.currentShopId, defaultValue: "") ?? '';
  }

  String getCurrentShopName() {
    return _box?.get(AppKeys.currentShopName, defaultValue: "") ?? '';
  }

  Future<void> setCurrentShopId(String value) async {
    await _box?.put(AppKeys.currentShopId, value);
  }

  String getSubDomain() {
    return _box?.get(AppKeys.subDomain, defaultValue: "") ?? '';
  }

  String getCompanyName() {
    return _box?.get(AppKeys.companyName, defaultValue: "") ?? '';
  }

  String getFullName() {
    return (_box?.get(AppKeys.firstName, defaultValue: "") ?? '') +
        ' ' +
        (_box?.get(AppKeys.lastName, defaultValue: "") ?? '');
  }

  String getUserId() {
    return _box?.get(AppKeys.userId, defaultValue: "") ?? '';
  }

  String getToken() {
    return _box?.get(AppKeys.accessToken, defaultValue: "") ?? '';
  }

  Future<void> setLocale(String lang) async {
    await _box?.put(AppKeys.languageCode, lang);
  }

  String getLocale() {
    return _box?.get(
          AppKeys.languageCode,
          defaultValue: BaseFunctions.getDefaultLocale(),
        ) ??
        BaseFunctions.getDefaultLocale();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _box?.put(AppKeys.themeMode, mode.name);
  }

  ThemeMode getThemeMode() {
    if (_box == null) {
      return ThemeMode.system;
    }
    switch (_box!.get(AppKeys.themeMode, defaultValue: ThemeMode.system.name)) {
      case "system":
        return ThemeMode.system;
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> clear() async {
    await _box?.clear();
  }
}

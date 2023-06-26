import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample_bloc_mobile/src/core/constants/app_keys.dart';
import 'package:sample_bloc_mobile/src/core/utils/base_functions.dart';

final class LocalSource {
  final Box<dynamic> box;

  LocalSource(this.box);

  void setHasProfile(bool hasProfile) {
    box.put(AppKeys.hasProfile, hasProfile);
  }

  bool get hasProfile => box.get(AppKeys.hasProfile, defaultValue: false);

  Future<void> setUser({
    required String name,
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String imageUrl,
    required String phone,
    required String email,
    required String login,
  }) async {
    await box.put(AppKeys.hasProfile, true);
    await box.put(AppKeys.phone, phone);
    await box.put(AppKeys.login, login);
    await box.put(AppKeys.email, email);
    await box.put(AppKeys.fullName, name);
    await box.put(AppKeys.accessToken, accessToken);
    await box.put(AppKeys.refreshToken, refreshToken);
    await box.put(AppKeys.userId, userId);
    await box.put(AppKeys.imageUrl, imageUrl);
  }

  String get accessToken => box.get(AppKeys.accessToken, defaultValue: '');

  String get fullName => box.get(AppKeys.fullName, defaultValue: '');

  String get userId => box.get(AppKeys.userId, defaultValue: '');

  String get locale => box.get(
        AppKeys.languageCode,
        defaultValue: defaultLocale,
      );

  bool get lanSelected =>
      box.get(AppKeys.langSelected, defaultValue: false) is bool
          ? box.get(AppKeys.langSelected, defaultValue: false)
          : false;

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  Future<void> setLocale(String lang) async {
    await box.put(AppKeys.languageCode, lang);
  }

  Future<void> setKey(String key, dynamic value) async {
    await box.put(key, value);
  }

  Future<void> setLangSelected(bool langSelected) async {
    await box.put(AppKeys.langSelected, langSelected);
  }

  String getKey(String key) => box.get(key, defaultValue: '');

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        'system' => ThemeMode.system,
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  Future<void> clear() async {
    await box.clear();
  }

  Future<void> userClear() async {
    await box.delete(AppKeys.hasProfile);
    await box.delete(AppKeys.phone);
    await box.delete(AppKeys.email);
    await box.delete(AppKeys.fullName);
    await box.delete(AppKeys.accessToken);
    await box.delete(AppKeys.refreshToken);
    await box.delete(AppKeys.userId);
    await box.delete(AppKeys.imageUrl);
  }
}

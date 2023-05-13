import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';

mixin CacheMixin {
  Future<void> setUserInfo({
    required String name,
    required String id,
    required String login,
    required String email,
    required String phoneNumber,
    required String accessToken,
    required String refreshToken,
    required String imageUrl,
  }) async {
    await localSource.setUser(
      name: name,
      userId: id,
      login: login,
      email: email,
      phone: phoneNumber,
      accessToken: accessToken,
      refreshToken: refreshToken,
      imageUrl: imageUrl,
    );
  }
}

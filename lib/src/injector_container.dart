import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/domain/network/api_client.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/splash/splash_bloc.dart';

import 'core/constans/constants.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  ///External
  await initHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "API-KEY",
          "X-API-KEY": "P-qapkgqLxf6v25bwhNzgcIDHwjhFd4mzM",
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            error: kDebugMode,
            request: kDebugMode,
            requestBody: kDebugMode,
            responseBody: kDebugMode,
          ),
          if (kDebugMode) chuck.getDioInterceptor(),
          RetryInterceptor(
            dio: sl(),
            retries: 1,
            toNoInternetPageNavigator: () async => await Navigator.pushNamed(
              rootNavigatorKey.currentContext!,
              Routes.internetConnection,
            ),
            accessTokenGetter: () => sl<LocalSource>().getAccessToken(),
            refreshTokenFunction: () async {
              await sl<LocalSource>().clear();
              Navigator.pushNamedAndRemoveUntil(
                rootNavigatorKey.currentContext!,
                Routes.initial,
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
  );
  sl.registerLazySingleton(() => ApiClient(sl(), Constants.baseUrl));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  //Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerSingleton<LocalSource>(LocalSource(_box));

  /// splash
  sl.registerFactory(() => SplashBloc());

  /// main
  sl.registerLazySingleton(() => MainBloc());
}

Future<void> initHive() async {
  const boxName = 'ets_international_mobile_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}

/// Create singletons (blocs and repositories) that can be shared across the app.
void registerSingletons() {
  sl.registerLazySingleton<MainBloc>(() => MainBloc());
}

MainBloc get mainBloc => sl.get<MainBloc>();

T inject<T extends Object>() {
  return sl.get<T>();
}

T cubit<T extends Object>() {
  return rootNavigatorKey.currentContext!.read<T>();
}

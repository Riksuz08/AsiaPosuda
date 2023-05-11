import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_pages.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/constans/constants.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_custome_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_customer_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/banners_response.dart';
import 'package:sample_bloc_mobile/src/data/models/base_response.dart';
import 'package:sample_bloc_mobile/src/data/models/customer.dart';
import 'package:sample_bloc_mobile/src/data/models/update_version_response.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static Chuck alice = Chuck(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
    navigatorKey: navigatorKey,
  );

  static get getDio {
    Dio dio = Dio(
      BaseOptions(
        followRedirects: false,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    /// Tries the last error request again.
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: 1,
        toNoInternetPageNavigator: () async => await Navigator.pushNamed(
          navigatorKey.currentContext!,
          AppRoutes.internetConnection,
        ),
        accessTokenGetter: () => LocalSource.instance.getAccessToken(),
        refreshTokenFunction: () async {
          await LocalSource.getInstance();
          await LocalSource.instance.clear();
          await Navigator.pushNamedAndRemoveUntil(
            navigatorKey.currentContext!,
            AppRoutes.initial,
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(alice.getDioInterceptor());
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
        ),
      );
    } else {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: false,
          request: false,
          error: false,
          requestHeader: false,
        ),
      );
    }
    return dio;
  }

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    _apiClient ??= ApiClient(getDio, baseUrl);
    return _apiClient!;
  }

  static close() {
    _apiClient = null;
  }

  factory ApiClient(Dio dio, String baseUrl) =>
      _ApiClient(dio, baseUrl: baseUrl);

  /// Check customer exits
  @POST('v1/customers/phone')
  Future<CheckCustomerResponse> checkCustomer(
    @Header('Shipper') String shipperId,
    @Body() CheckCustomerRequest request,
  );

  /// Login
  @POST('v1/customers/login')
  Future<BaseResponse> login(
    @Header('Shipper') String shipperId,
    @Body() LoginRequest request,
  );

  /// Register
  @POST('v1/customers/register')
  Future<BaseResponse> register(
    @Header('Shipper') String shipperId,
    @Body() RegisterRequest request,
  );

  /// Register confirm
  @POST('v1/customers/register-confirm')
  Future<Customer> confirmRegister(
    @Header('Shipper') String shipperId,
    @Header('Platform') String platformId,
    @Body() ConfirmRegisterRequest request,
  );

  /// Login confirm
  @POST('v1/customers/confirm-login')
  Future<Customer> confirmLogin(
    @Header('Shipper') String shipperId,
    @Header('Platform') String platformId,
    @Body() ConfirmLoginRequest request,
  );

  /// Get customer information
  @GET('v1/customer-profile')
  Future<Customer> getProfile(@Header('Authorization') String token);

  /// Get customers about information
  @GET('v1/customers/{customer_id}')
  Future<Customer> getCustomers(
    @Header('Authorization') String token,
    @Path('customer_id') String customerId,
  );

  /// Get app version for update
  @GET('v1/mobile_app/{app_name}')
  Future<UpdateVersionResponse> getAppVersion(
    @Header('Authorization') String token,
    @Path('app_name') String appName,
  );

  /// Put customer update
  @PUT('v1/customers/{customer_id}')
  Future<BaseResponse> updateCustomer(
    @Header('Authorization') String token,
    @Path('customer_id') String customerId,
    @Body() Customer request,
  );

  /// Get banner list
  @GET('v1/banner')
  Future<BannersResponse> getBanners(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
  );
}

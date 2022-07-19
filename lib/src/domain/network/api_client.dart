import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/utils/constants.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_custome_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_customer_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/banners_response.dart';
import 'package:sample_bloc_mobile/src/data/models/base_id_response.dart';
import 'package:sample_bloc_mobile/src/data/models/base_response.dart';
import 'package:sample_bloc_mobile/src/data/models/branch/branches_response.dart';
import 'package:sample_bloc_mobile/src/data/models/category_v2_response.dart';
import 'package:sample_bloc_mobile/src/data/models/create_address_response.dart';
import 'package:sample_bloc_mobile/src/data/models/customer.dart';
import 'package:sample_bloc_mobile/src/data/models/delete_address_response.dart';
import 'package:sample_bloc_mobile/src/data/models/my_address_request.dart';
import 'package:sample_bloc_mobile/src/data/models/my_address_response.dart';
import 'package:sample_bloc_mobile/src/data/models/ondemand_order_request.dart';
import 'package:sample_bloc_mobile/src/data/models/ondemand_order_response.dart';
import 'package:sample_bloc_mobile/src/data/models/orders_response.dart';
import 'package:sample_bloc_mobile/src/data/models/product_by_id_response.dart';
import 'package:sample_bloc_mobile/src/data/models/products_v2_response.dart';
import 'package:sample_bloc_mobile/src/data/models/reviews_response.dart';
import 'package:sample_bloc_mobile/src/data/models/saved_address_response.dart';
import 'package:sample_bloc_mobile/src/data/models/token/refresh_token_request.dart';
import 'package:sample_bloc_mobile/src/data/models/token/refresh_token_response.dart';
import 'package:sample_bloc_mobile/src/data/models/update_version_response.dart';
import 'package:sample_bloc_mobile/src/data/models/user_reviews_request.dart';
import 'package:sample_bloc_mobile/src/data/models/user_update_reviews_request.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  static Chuck alice = Chuck(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
    navigatorKey: AppConstants.navigatorKey,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    /// Tries the last error request again.
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: 1,
        toNoInternetPageNavigator: () async => await Navigator.pushNamed(
          AppConstants.navigatorKey.currentContext!,
          AppRoutes.internetConnection,
        ),
        accessTokenGetter: () => LocalSource.instance.getAccessToken(),
        refreshTokenFunction: () async {
          await LocalSource.getInstance();
          await LocalSource.instance.clear();
          await Navigator.pushNamedAndRemoveUntil(
            AppConstants.navigatorKey.currentContext!,
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
    }
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

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

  /// Get categoriesV2 and products
  @GET('v2/category')
  Future<CategoryV2Response> getCategoryWithProductV2(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('all') bool all,
  );

  /// Get product info
  @GET('v2/product/{product_id}')
  Future<ProductByIdResponse> getProductDetailV2(
    @Header('Shipper') String shipperId,
    @Path('product_id') String productId,
  );

  /// Get all products
  @GET('v2/product')
  Future<ProductsV2Response> getProductsV2(
    @Header('Shipper') String shipperId,
    @Query('search') String search,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get branches
  @GET('v1/branches')
  Future<BranchesResponse> getBranches(
    @Header('Authorization') String token,
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get near branches
  @GET('v1/nearest-branch')
  Future<BranchesResponse> getNearBranches(
    @Header('Authorization') String token,
    @Header('Shipper') String shipperId,
    @Query('lat') String lat,
    @Query('long') String long,
  );

  /// Get branches id
  @GET('v1/branches/{branch_id}')
  Future<Branches> getBranchesId(
    @Header('Authorization') String token,
    @Path('branch_id') String branchId,
  );

  /// get orders
  @POST('v2/ondemand-order')
  Future<OndemandOrderResponse> addOndemandOrder(
    @Header('Authorization') String token,
    @Body() OnDemandOrderRequest request,
  );

  @GET('v1/order')
  Future<OrdersResponse> getOrders(
    @Header('Authorization') String token,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('status_ids') List<String> statusIds,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );

  @GET('v1/order')
  Future<OrdersResponse> getLastOrders(
    @Header('Authorization') String token,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('v1/order')
  Future<OrdersResponse> getOrdersReview(
    @Header('Authorization') String token,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
    @Query('review_seen') bool reviewSeen,
  );

  @GET('v1/order/{order_id}')
  Future<Orders> getOrdersDetail(
    @Header('Authorization') String token,
    @Path('order_id') String orderId,
  );

  @GET('v1/review')
  Future<ReviewsResponse> review(
    @Header('Authorization') String token,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @POST('v1/user_reviews')
  Future<BaseIdResponse> createUserReview(
    @Header('Authorization') String token,
    @Body() UserReviewsRequest request,
  );

  @PUT('v1/order-review/{order_id}')
  Future<BaseResponse> updateUserReview(
    @Header('Authorization') String token,
    @Path('order_id') String orderId,
    @Body() UserUpdateReviewsRequest request,
  );

  @POST('v1/customers/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );

  @GET('v1/customer_address')
  Future<MyAddressResponse> getMyAddress(
    @Header('Authorization') String token,
    @Header('Shipper') String shipperId,
    @Query('customer_id') String id,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  // Post my address
  @POST('v1/customer_address')
  Future<CreateAddressResponse> postMyAddress(
    @Header('Authorization') String token,
    @Header('Shipper') String shipperId,
    @Body() MyAddressRequest customerAddress,
  );

  @GET('v1/customer_address')
  Future<SavedAddressResponse> getSavedAddresses(
    @Header('Authorization') String token,
    @Query('customer_id') String customerId,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @DELETE('v1/customer_address/{customer_address_id}')
  Future<DeleteAddressResponse> deleteSavedAddress(
    @Header('Authorization') String token,
    @Path('customer_address_id') String customerAddressId,
  );
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_custome_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/check_customer_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/base_response.dart';
import 'package:sample_bloc_mobile/src/data/models/customer.dart';
import 'package:sample_bloc_mobile/src/domain/network/api_client.dart';
import 'package:sample_bloc_mobile/src/domain/network/response_handler.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';

import 'base_repository.dart';

class AuthRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<ResponseHandler<CheckCustomerResponse>> fetchCheckCustomerExits({
    required String shipperId,
    required CheckCustomerRequest request,
  }) async {
    CheckCustomerResponse response;
    try {
      response = await _apiClient.checkCustomer(shipperId, request);
    } on SocketException catch (e, stacktrace) {
      debugPrint("Socket exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } on TypeError catch (e, stacktrace) {
      debugPrint("Type exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withDioError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<BaseResponse>> fetchLogin({
    required String shipperId,
    required LoginRequest request,
  }) async {
    BaseResponse response;
    try {
      response = await _apiClient.login(shipperId, request);
    } on SocketException catch (e, stacktrace) {
      debugPrint("Socket exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } on TypeError catch (e, stacktrace) {
      debugPrint("Type exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withDioError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<BaseResponse>> fetchRegister(
      {required String shipperId, required RegisterRequest request}) async {
    BaseResponse response;
    try {
      response = await _apiClient.register(shipperId, request);
    } on SocketException catch (e, stacktrace) {
      debugPrint("Socket exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } on TypeError catch (e, stacktrace) {
      debugPrint("Type exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withDioError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<Customer>> fetchConfirmRegister({
    required String shipperId,
    required String platform,
    required ConfirmRegisterRequest request,
  }) async {
    Customer response;
    try {
      response = await _apiClient.confirmRegister(shipperId, platform, request);
    } on SocketException catch (e, stacktrace) {
      debugPrint("Socket exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } on TypeError catch (e, stacktrace) {
      debugPrint("Type exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withDioError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<Customer>> fetchConfirmLogin({
    required String shipperId,
    required String platform,
    required ConfirmLoginRequest request,
  }) async {
    Customer response;
    try {
      response = await _apiClient.confirmLogin(shipperId, platform, request);
    } on SocketException catch (e, stacktrace) {
      debugPrint("Socket exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } on TypeError catch (e, stacktrace) {
      debugPrint("Type exception: ${e.toString()} stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(message: e.toString()));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withDioError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> checkCustomerExits({
    required String shipperId,
    required CheckCustomerRequest request,
  }) async {
    final response =
        await fetchCheckCustomerExits(shipperId: shipperId, request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? "");
    }
  }

  Future<dynamic> login(
      {required String shipperId, required LoginRequest request}) async {
    final response = await fetchLogin(shipperId: shipperId, request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? "");
    }
  }

  Future<dynamic> register(
      {required String shipperId, required RegisterRequest request}) async {
    final response =
        await fetchRegister(shipperId: shipperId, request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? "");
    }
  }

  Future<dynamic> confirmRegister(
      {required String shipperId,
      required String platform,
      required ConfirmRegisterRequest request}) async {
    final response = await fetchConfirmRegister(
        shipperId: shipperId, platform: platform, request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? "",
      );
    }
  }

  Future<dynamic> confirmLogin(
      {required String shipperId,
      required String platform,
      required ConfirmLoginRequest request}) async {
    final response = await fetchConfirmLogin(
        shipperId: shipperId, platform: platform, request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? "",
      );
    }
  }
}

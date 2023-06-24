import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/core/platform/network_info.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/api_client.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/register/register_repository.dart';
import 'dart:developer';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  RegisterUserRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser(
      {required Map<String, dynamic> request}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.registerUser(request);
        return Right(response);
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}

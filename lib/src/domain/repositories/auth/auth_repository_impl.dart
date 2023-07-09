part of 'auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  }) : super();

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, SendMessageResponse>> codeMessage({
    required SendMessageRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.sendMessage(request);
        return Right(response);
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, SendMessageResponse>> verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiClient.verifySmsCode(
          request,
          smsId,
          otp,
        );
        return Right(response);
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}

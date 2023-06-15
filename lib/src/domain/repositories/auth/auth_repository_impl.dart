part of 'auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  const AuthRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  }) : super();

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

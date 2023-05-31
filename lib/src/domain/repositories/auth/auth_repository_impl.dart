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
        final response = await _sendMessage(request: request);
        return Right(response);
      } catch (e) {
        return Left(
          ServerFailure(
            message: e is ServerError ? e.message : e.toString(),
          ),
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  Future<SendMessageResponse> _sendMessage({
    required SendMessageRequest request,
  }) async {
    late SendMessageResponse response;
    try {
      response = await apiClient.sendMessage(request);
    } on DioError catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withDioError(error: error);
    } on SocketException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withError(message: error.toString());
    } catch (error, stacktrace) {
      if (error is TypeError) {
        log('Type Error: $error stacktrace: $stacktrace');
        throw ServerError.withError(message: error.toString());
      }
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withError(message: error.toString());
    }
    return response;
  }

  @override
  Future<Either<Failure, SendMessageResponse>> verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _verifySmsCode(
          request: request,
          smsId: smsId,
          otp: otp,
        );
        return Right(response);
      } catch (e) {
        return Left(
          ServerFailure(
            message: e is ServerError ? e.message : e.toString(),
          ),
        );
      }
    } else {
      return Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  Future<SendMessageResponse> _verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  }) async {
    late SendMessageResponse response;
    try {
      response = await apiClient.verifySmsCode(request, smsId, otp);
    } on DioError catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withDioError(error: error);
    } on SocketException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withError(message: error.toString());
    } catch (error, stacktrace) {
      if (error is TypeError) {
        log('Type Error: $error stacktrace: $stacktrace');
        throw ServerError.withError(message: error.toString());
      }
      log('Exception occurred: $error stacktrace: $stacktrace');
      throw ServerError.withError(message: error.toString());
    }
    return response;
  }
}

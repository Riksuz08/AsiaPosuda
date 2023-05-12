part of "auth_repository.dart";

class AuthRepositoryImpl extends AuthRepository {
  final ApiClient apiClient;

  const AuthRepositoryImpl({
    required this.apiClient,
  }) : super();

  @override
  Future<Either<Failure, SendMessageResponse>> codeMessage({
    required SendMessageRequest request,
  }) async {
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
  }

  Future<SendMessageResponse> _sendMessage({
    required SendMessageRequest request,
  }) async {
    late SendMessageResponse response;
    try {
      response = await apiClient.sendMessage(request);
    } on TypeError catch (e, stacktrace) {
      log("Type Error: ${e.toString()} stacktrace: $stacktrace");
      throw ServerError.withError(message: e.toString());
    } on DioError catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerError.withDioError(error: error);
    } on SocketException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerError.withError(message: error.toString());
    } catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
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
  }

  Future<SendMessageResponse> _verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  }) async {
    late SendMessageResponse response;
    try {
      response = await apiClient.verifySmsCode(request, smsId, otp);
    } on TypeError catch (e, stacktrace) {
      log("Type Error: ${e.toString()} stacktrace: $stacktrace");
      throw ServerError.withError(message: e.toString());
    } on DioError catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerError.withDioError(error: error);
    } on SocketException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerError.withError(message: error.toString());
    } catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerError.withError(message: error.toString());
    }
    return response;
  }
}

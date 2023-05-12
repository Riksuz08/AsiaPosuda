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
      final response = await _sendMessage(
        request: request,
      );
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          message: e is ServerException ? e.message : e.toString(),
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
      throw ServerException(
        message: ServerError.withError(message: e.toString()).errorMessage,
      );
    } on DioError catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerException(
        message: ServerError.withDioError(error: error).errorMessage,
      );
    } on SocketException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerException(
        message: ServerError.withError(message: error.toString()).errorMessage,
      );
    } catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      throw ServerException(
        message: ServerError.withError(message: error.toString()).errorMessage,
      );
    }
    return response;
  }
}

part of 'register_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final ApiClient apiClient;
  final NetworkInfo networkInfo;

  RegisterUserRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  }) async {
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

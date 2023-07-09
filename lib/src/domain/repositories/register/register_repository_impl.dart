part of 'register_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  RegisterUserRepositoryImpl({
    required this.apiClient,
    required this.networkInfo,
  });

  final ApiClient apiClient;
  final NetworkInfo networkInfo;

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

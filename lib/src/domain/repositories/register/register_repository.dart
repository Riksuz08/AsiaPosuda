import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  });
}

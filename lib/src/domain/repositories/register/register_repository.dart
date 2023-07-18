import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/core/platform/network_info.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';

part 'register_repository_impl.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  });
}

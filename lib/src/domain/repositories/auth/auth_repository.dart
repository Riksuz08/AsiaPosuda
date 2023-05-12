import 'package:repo_annotation/repo_annotation.dart';
import 'package:sample_bloc_mobile/src/domain/network/response_handler.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/base_repository.dart';

part 'auth_repository.g.dart';

@subGen
abstract class AuthRepository extends BaseRepository {
  Future<ResponseHandler<String>> offersLink({
    required String platformId,
  });
}

import 'package:jobdi/core/error/failure.dart';
import 'package:jobdi/core/impl/result_response.dart';
import 'package:jobdi/data/data_sources/auth_remote.dart'
    show AuthRemoteDataSource;
import 'package:jobdi/domain/entities/auth_entity.dart';

sealed class AuthRepository {
  Future<ResultResponse<AuthEntity, Failure>> signIn(
    String username,
    String password,
  );
  Future<void> signOut();
}

class AuthRepoImppl extends AuthRepository {
  AuthRepoImppl(this.remote);

  final AuthRemoteDataSource remote;

  @override
  Future<ResultResponse<AuthEntity, Failure>> signIn(
    String username,
    String password,
  ) async {
    try {
      final response = await remote.signIn(username, password);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remote.signOut();
    } catch (_) {
      rethrow;
    }
  }
}

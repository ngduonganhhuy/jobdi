import 'package:jobdi/core/error/failure.dart';
import 'package:jobdi/core/impl/result_response.dart';
import 'package:jobdi/data/repositories/auth_repository.dart';
import 'package:jobdi/domain/entities/auth_entity.dart';

class LoginUseCase {
  LoginUseCase(this.authRepo);
  final AuthRepository authRepo;

  Future<ResultResponse<AuthEntity, Failure>> revoke(
    String username,
    String password,
  ) async {
    return authRepo.signIn(username, password);
  }
}

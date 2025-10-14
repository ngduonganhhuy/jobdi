import 'package:flutter/foundation.dart' show compute;
import 'package:jobdi/core/constants/api_urls.dart';
import 'package:jobdi/core/error/exception.dart' show NullException;
import 'package:jobdi/core/error/failure.dart' show Failure;
import 'package:jobdi/core/impl/result_response.dart' show ResultResponse;
import 'package:jobdi/core/services/api_service/api_service.dart';
import 'package:jobdi/data/models/auth_model.dart';

sealed class AuthRemoteDataSource {
  Future<ResultResponse<AuthModel, Failure>> signIn(
    String username,
    String password,
  );
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<ResultResponse<AuthModel, Failure>> signIn(
    String username,
    String password,
  ) async {
    final response = await ApiService.callRequest(
      RequestMethod.POST,
      ApiUrls.signIn,
      'signIn',
    );
    return compute(
      (message) {
        if (message == null) throw NullException();
        final resData = AuthModel.fromJson(message as Map<String, dynamic>);
        return ResultResponse.success(resData);
      },
      response,
    );
  }

  @override
  Future<void> signOut() async {}
}

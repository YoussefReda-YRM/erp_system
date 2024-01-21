import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:erp_system/core/errors/failures.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<Either<Failure, SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(
        ServerFailure(
          error.toString(),
        ),
      );
    }
  }
}

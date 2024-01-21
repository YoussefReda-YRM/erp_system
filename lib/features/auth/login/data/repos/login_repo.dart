import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:erp_system/core/errors/failures.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';

class LoginRepo{
  final ApiService _apiService;

  LoginRepo(this._apiService);
  
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
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

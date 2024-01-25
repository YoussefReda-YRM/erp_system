// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:erp_system/core/errors/failures.dart';
// import 'package:erp_system/core/networking/api_service.dart';
// import 'package:erp_system/features/auth/forgot_password/data/models/forgot_password_request_body.dart';
// import 'package:erp_system/features/auth/forgot_password/data/models/forgot_password_response.dart';

// class ForgotPasswordRepo {
//   final ApiService _apiService;

//   ForgotPasswordRepo(this._apiService);

//   Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
//       ForgotPasswordRequestBody forgotPasswordRequestBody) async {
//     try {
//       final response =
//           await _apiService.forgotPassword(forgotPasswordRequestBody);
//       return right(response);
//     } catch (error) {
//       if (error is DioException) {
//         return left(ServerFailure.fromDioError(error));
//       }
//       return left(
//         ServerFailure(
//           error.toString(),
//         ),
//       );
//     }
//   }
// }

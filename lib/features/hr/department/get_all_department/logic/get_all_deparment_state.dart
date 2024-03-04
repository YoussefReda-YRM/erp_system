import 'package:erp_system/features/hr/department/get_all_department/data/models/getAllDepartment.dart';

abstract class GetAllDepartmentState {}

class GetAllDepartmentInitial extends GetAllDepartmentState {}

class GetAllDepartmentLoading extends GetAllDepartmentState {}

class GetAllDepartmentFailure extends GetAllDepartmentState {
  final String error;

  GetAllDepartmentFailure({required this.error});
}

class GetAllDepartmentSuccess extends GetAllDepartmentState {
  final GetAllDepartmentResponse response;

  GetAllDepartmentSuccess({
    required this.response,
  });
}
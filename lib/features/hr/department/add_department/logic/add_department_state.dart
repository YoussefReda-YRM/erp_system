
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentResponse.dart';

abstract class AddDepartmentState {}

class AddDepartmentInitial extends AddDepartmentState {}

class AddDepartmentLoading extends AddDepartmentState {}

class AddDepartmentFailure extends AddDepartmentState {
  final String error;

  AddDepartmentFailure({required this.error});
}

class AddDepartmentSuccess extends AddDepartmentState {
  final AddDepartmentResponse response;

  AddDepartmentSuccess({
    required this.response,
  });
}

import 'package:erp_system/features/inventory/get_all_accounting_employee/data/models/get_all_accounting_employee.dart';

abstract class GetAllAccountingEmployeeState {}

class GetAllAccountingEmployeeInitial extends GetAllAccountingEmployeeState {}

class GetAllAccountingEmployeeLoading extends GetAllAccountingEmployeeState {}

class GetAllAccountingEmployeeSuccess extends GetAllAccountingEmployeeState {
  final List<GetAllAccountingEmployeeModel> getAllAccounting;

  GetAllAccountingEmployeeSuccess(this.getAllAccounting);
}

class GetAllAccountingEmployeeFailure extends GetAllAccountingEmployeeState {
  final String error;

  GetAllAccountingEmployeeFailure({required this.error});
}

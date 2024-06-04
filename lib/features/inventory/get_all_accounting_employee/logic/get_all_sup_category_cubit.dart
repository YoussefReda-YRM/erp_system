import 'package:erp_system/features/inventory/get_all_accounting_employee/data/repos/get_all_accounting_employee_repo.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllAccountingEmployeeCubit
    extends Cubit<GetAllAccountingEmployeeState> {
  final GetAllAccountingEmployeeRepo _getAllAccountingEmployeeRepo;

  GetAllAccountingEmployeeCubit(this._getAllAccountingEmployeeRepo)
      : super(GetAllAccountingEmployeeInitial());

  Future<void> getAllAccountingEmployee() async {
    emit(GetAllAccountingEmployeeLoading());

    final response =
        await _getAllAccountingEmployeeRepo.getAllAccountingEmployee();

    response.when(
      success: (categories) {
        emit(GetAllAccountingEmployeeSuccess(categories));
      },
      failure: (error) {
        emit(GetAllAccountingEmployeeFailure(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

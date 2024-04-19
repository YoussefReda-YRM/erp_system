import 'package:erp_system/features/hr/employee/details_employee/data/repo/details_employee_repo.dart';
import 'package:erp_system/features/hr/employee/details_employee/logic/details_employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsEmployeeCubit extends Cubit<DetailsEmployeeState> {
  final DetailsEmployeeRepo _detailsEmployeeRepo;
  DetailsEmployeeCubit(this._detailsEmployeeRepo)
      : super(DetailsEmployeeInitial());
  Future<void> getSpecificEmployee(String? employeeId) async {
    emit(DetailsEmployeeLoading());
    var response = await _detailsEmployeeRepo.getSpecificEmployee(employeeId!);
    response.when(
      success: (employeeDetails) {
        emit(DetailsEmployeeSuccess(
          response: employeeDetails,
        ));
      },
      failure: (error) {
        emit(DetailsEmployeeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
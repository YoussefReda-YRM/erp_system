import 'package:erp_system/features/hr/employee/get_all_employees/data/repos/get_all_employee_repo.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/logic/get_all_employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllEmployeeCubit extends Cubit<GetAllEmployeeState> {
  final GetAllEmployeeRepo _getAllEmployeeRepo;
  GetAllEmployeeCubit(this._getAllEmployeeRepo)
      : super(GetAllEmployeeInitial());
  Future<void> getAllEmployees() async {
    emit(GetAllEmployeeLoading());
    var response = await _getAllEmployeeRepo.getAllEmployees();
    response.when(
      success: (getAllEmployeeResponse) {
        emit(GetAllEmployeeSuccess(
          response: getAllEmployeeResponse,
        ));
      },
      failure: (error) {
        emit(GetAllEmployeeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

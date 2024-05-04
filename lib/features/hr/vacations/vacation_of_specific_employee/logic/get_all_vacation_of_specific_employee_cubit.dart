import 'package:erp_system/features/hr/vacations/get_all_vacations/logic/get_all_vacations_state.dart';
import 'package:erp_system/features/hr/vacations/vacation_of_specific_employee/data/repos/get_all_vacation_of_specific_employee_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllVacationOfSpecificEmployeeCubit extends Cubit<GetAllVacationsState> {
  final GetAllVacationOfSpecificEmployeeRepo _getAllVacationOfSpecificEmployeeRepo;
  GetAllVacationOfSpecificEmployeeCubit(this._getAllVacationOfSpecificEmployeeRepo)
      : super(GetAllVacationsInitial());
  Future<void> getAllVacationOfSpecificEmployee() async {
    emit(GetAllVacationsLoading());
    var response = await _getAllVacationOfSpecificEmployeeRepo.getAllVacationOfSpecificEmployee();
    response.when(
      success: (getAllVacations) {
        emit(GetAllVacationsSuccess(
          response: getAllVacations,
        ));
      },
      failure: (error) {
        emit(GetAllVacationsFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

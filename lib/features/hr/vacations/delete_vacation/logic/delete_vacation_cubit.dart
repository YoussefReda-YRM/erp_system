import 'package:erp_system/features/hr/vacations/delete_vacation/data/repos/delete_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/delete_vacation/logic/delete_vacation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteVacationCubit extends Cubit<DeleteVacationState> {
  final DeleteVacationRepo _deleteVacationRepo;

  DeleteVacationCubit(this._deleteVacationRepo) : super(DeleteVacationInitial());

  void deleteVacation(String vacationId) async {
    emit(DeleteVacationLoading());

    final response = await _deleteVacationRepo.deleteVacation(vacationId)
       ;

    response.when(
      success: (response) {
        emit(DeleteVacationSuccess(response));
      },
      failure: (error) {
        emit(GetAllVacationFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }



}

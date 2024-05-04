import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/update_status_of_vacation_request.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/repos/update_status_of_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/logic/update_status_of_vacation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStatusOfVacationCubit extends Cubit<UpdateStatusOfVacationState> {
  final UpdateStatusOfVacationRepo _updateStatusOfVacationRepo;

  UpdateStatusOfVacationCubit(this._updateStatusOfVacationRepo)
      : super(UpdateStatusOfVacationInitial());

  final formKey = GlobalKey<FormState>();

  void updateVacatoin(String vacationId, int status) async {
    emit(UpdateStatusOfVacationLoading());
    final response = await _updateStatusOfVacationRepo.updateStatusOfVacation(
      getIt.get<LoginResponse>().token!,
      vacationId,
      UpdateStatusOfVacationRequest(
        status: status,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateStatusOfVacationSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateStatusOfVacationFailure(
              error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

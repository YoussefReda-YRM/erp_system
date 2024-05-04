import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationRequest.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/repos/update_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVacationCubit extends Cubit<UpdateVacationState> {
  final UpdateVacationRepo _updateVacationRepo;

  UpdateVacationCubit(this._updateVacationRepo)
      : super(UpdateVacationInitial());

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void updateVacation(int vacationId) async {
    emit(UpdateVacationLoading());
    final response = await _updateVacationRepo.updateVacation(getIt.get<LoginResponse>().token!, vacationId, UpdateVacationRequest(
      start: startDateController.text,
      end: endDateController.text,
      description: descriptionController.text
    ))

    ;

    response.when(
      success: (response) {
        emit(UpdateVacationSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateVacationFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

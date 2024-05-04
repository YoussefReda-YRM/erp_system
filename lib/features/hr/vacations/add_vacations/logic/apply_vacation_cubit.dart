import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_request.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/repos/apply_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyVacationCubit extends Cubit<ApplyVacatinState> {
  final ApplyVacationRepo _applyVacationRepo;
  ApplyVacationCubit(this._applyVacationRepo) : super(ApplyVacationInitial());

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void applyVacation() async {
    emit(ApplyVacationLoading());
    final response = await _applyVacationRepo.applyVacation(
      ApplyVacationRequest(
        startDate: startDateController.text,
        endDate: endDateController.text,
        description: descriptionController.text,
      ),
    );
    response.when(
      success: (response) {
        emit(ApplyVacationSuccess(response: response));
      },
      failure: (error) {
        emit(
          ApplyVacationFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

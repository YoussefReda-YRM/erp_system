import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionRequest.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/repos/add_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/logic/add_job_position_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddJobPositionCubit extends Cubit<AddJobPositionState> {
  final AddJobPositionRepo _addJobPositionRepo;
  AddJobPositionCubit(this._addJobPositionRepo)
      : super(AddJobPositionInitial());

  TextEditingController jobNameController = TextEditingController();
  // TextEditingController departmentDescriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addJobPosition(int id) async {
    emit(AddJobPositionLoading());
    final response = await _addJobPositionRepo.addJobPosition(
      AddJobPositionRequest(jobName: jobNameController.text, departmentId: id),
      getIt.get<LoginResponse>().token!,
    );
    response.when(
      success: (response) {
        emit(AddJobPositionSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddJobPositionFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

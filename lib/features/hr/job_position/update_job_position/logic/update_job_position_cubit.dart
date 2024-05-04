import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/UpdateJobRequest.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/repos/update_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateJObPositionCubit extends Cubit<UpdateJobPositionState> {
  final UpdateJobPositionRepo _jobPositionRepo;
  UpdateJObPositionCubit(
    this._jobPositionRepo,
  ) : super(UpdateJobPositionInitial());

  TextEditingController jobPositionNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void updateJobPosition(int jobPositionId, int depId) async {
    emit(UpdateJobPositionLoading());
    final response = await _jobPositionRepo.updateJobPosition(
      getIt.get<LoginResponse>().token!,
      jobPositionId,
      UpdateJobRequest(
        departmentId: depId,
        jobName: jobPositionNameController.text,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateJobPositionSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateJobPositionFailure(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}

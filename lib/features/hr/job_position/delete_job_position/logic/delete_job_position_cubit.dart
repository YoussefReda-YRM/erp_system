import 'package:erp_system/features/hr/job_position/delete_job_position/data/repos/delete_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/logic/delete_job_position_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteJobPositionCubit extends Cubit<DeleteJobPositionState> {
  final DeleteJobPositionRepo _deleteJobPositionRepo;

  DeleteJobPositionCubit(this._deleteJobPositionRepo) : super(DeleteJobPositionInitial());

  void deleteJobPosition(String jobPositionId) async {
    emit(DeleteJobPositionLoading());

    final response = await _deleteJobPositionRepo.deleteJobPosition(  jobPositionId,);

    response.when(
      success: (response) {
        emit(DeleteJobPositionSuccess(response));
      },
      failure: (error) {
        emit(GetAllJobPositionFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }



}

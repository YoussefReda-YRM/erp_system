import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/repos/get_all_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/logic/get_all_job_position_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllJobPositionCubit extends Cubit<GetAllJobPositionState> {
  final GetAllJobPositionRepo _allJobPositionRepo;
  GetAllJobPositionCubit(this._allJobPositionRepo)
      : super(GetAllJobPositionInitial());
  Future<void> getAllJobPositions(int depId) async {
    emit(GetAllJobPositionLoading());
    var response = await _allJobPositionRepo.getAllJobPosition(depId);
    response.when(
      success: (jobPosition) {
        jobPositionInGetIt = jobPosition;
        emit(GetAllJobPositionSuccess(response: jobPosition));
      },
      failure: (error) {
        emit(GetAllJobPositionFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

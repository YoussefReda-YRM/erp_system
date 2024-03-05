import 'package:erp_system/features/hr/department/get_all_department/data/repos/get_all_department_repo.dart';
import 'package:erp_system/features/hr/department/get_all_department/logic/get_all_deparment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllDepartmentCubit extends Cubit<GetAllDepartmentState> {
  final GetAllDepartmentRepo _getAllDepartmentRepo;
  GetAllDepartmentCubit(this._getAllDepartmentRepo)
      : super(GetAllDepartmentInitial());
  Future<void> getAllDepartment() async {
    emit(GetAllDepartmentLoading());
    var response = await _getAllDepartmentRepo.getAllDepartment();
    response.when(
      success: (getAllDepartment) {
        emit(GetAllDepartmentSuccess(
          response: getAllDepartment,
        ));
      },
      failure: (error) {
        emit(GetAllDepartmentFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

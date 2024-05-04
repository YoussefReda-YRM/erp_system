import 'package:erp_system/features/hr/department/delete_department/data/repos/delete_department_repo.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDepartmentCubit extends Cubit<CategoryState> {
  final DeleteDepartmentRepo _deleteDepartmentRepo;

  DeleteDepartmentCubit(this._deleteDepartmentRepo) : super(CategoryInitial());

  void deleteDepartment( int depId) async {
    emit(DeleteCategoryLoading());

    final response = await _deleteDepartmentRepo.deleteDepartment(
        depId
    );

    response.when(
      success: (response) {
        emit(DeleteCategorySuccess(response));
      },
      failure: (error) {
        emit(DeleteCategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }



}

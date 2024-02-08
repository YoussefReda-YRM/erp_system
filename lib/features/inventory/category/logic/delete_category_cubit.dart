import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:erp_system/features/inventory/category/data/repos/delete_category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/categorystate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCategoryCubit extends Cubit<CategoryState>{
  final DeleteCategoryRepo _deleteCategoryRepo;


  DeleteCategoryCubit(this._deleteCategoryRepo) : super(CategoryInitial());



  void deleteSubcategory(String token, int subCategoryId) async {

    emit(CategoryLoading());

    final response = await _deleteCategoryRepo.deleteSubcategory(token,subCategoryId);


    response.when(
      success: (__) {

        emit(CategorySuccessDeletion());
        // In case of successful deletion, you might not need to emit a state here,
        // or you can emit a success state if needed.
      },
      failure: (error) {
        emit(CategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }


}
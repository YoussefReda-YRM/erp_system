
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/categorystate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo;

  CategoryCubit(this._categoryRepo) : super(CategoryInitial());

  void getAllCategories() async {
    emit(CategoryLoading());

    final response = await _categoryRepo.getAllCategories();

    response.when(
      success: (categories) {
        emit(CategorySuccess(categories));
      },
      failure: (error) {
        emit(CategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void deleteSubcategory(int subCategoryId) async {
    emit(CategoryLoading());

    final response = await _categoryRepo.deleteSubcategory(subCategoryId);

    response.when(
      success: (_) {
        // In case of successful deletion, you might not need to emit a state here,
        // or you can emit a success state if needed.
      },
      failure: (error) {
        emit(CategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

}


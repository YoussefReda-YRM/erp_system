import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_state.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/repos/get_category_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo;

  CategoryCubit(this._categoryRepo) : super(CategoryInitial());

  Future<void> getAllCategories(String token) async {
    emit(CategoryLoading());

    final response = await _categoryRepo.getAllCategory(token);

    response.when(
      success: (categories) {
        categoriesInGetIt = categories;
        emit(CategorySuccess(categories));
      },
      failure: (error) {
        emit(CategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  // delete parent category

  void deleteparentcategory(String token, int parentCategoryId) async {
    emit(DeleteCategoryLoading());

    final response = await _categoryRepo.deleteParentCategory(
      token,
      parentCategoryId,
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


  //delete sub category 
    void deleteSubcategory(String token, int subCategoryId) async {
    emit(DeleteCategoryLoading());

    final response =
        await _categoryRepo.deleteSubcategory(token, subCategoryId);

    response.when(
      success: (response) {
        emit(DeleteCategorySuccess(response));
      },
      failure: (error) {
        emit(DeleteCategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  /*List<CategoryDm> updateCategories(CategoryDm category, {bool isDeleted = false}) {
    if (isDeleted) {
      categories?.remove(category);
    } else {
      categories?.add(category);
    }
    return categories ?? [];
  }*/
}

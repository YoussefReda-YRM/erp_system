
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/categorystate.dart';
import 'package:erp_system/features/inventory/category/ui/category_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo;

  CategoryCubit(this._categoryRepo) : super(CategoryInitial());

  Future<void> getAllCategories(String token) async {
    emit(CategoryLoading());

    final response = await _categoryRepo.getAllCategory(token);

    response.when(
      success: (categories) {
        emit(CategorySuccess(categories));
      },
      failure: (error) {
        emit(CategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }


}



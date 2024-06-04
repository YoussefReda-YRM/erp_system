import 'package:erp_system/features/inventory/category/get_all_sup_category/data/repos/get_all_sup_category_repo.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/logic/get_all_sup_category_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllSupCategoryCubit extends Cubit<GetAllSupCategoryState> {
  final GetAllSupCategoryRepo _categoryRepo;

  GetAllSupCategoryCubit(this._categoryRepo)
      : super(GetAllSupCategoryInitial());

  Future<void> getAllSupCategories() async {
    emit(GetAllSupCategoryLoading());

    final response = await _categoryRepo.getAllSupCategory();

    response.when(
      success: (categories) {
        emit(GetAllSupCategorySuccess(categories));
      },
      failure: (error) {
        emit(
            GetAllSupCategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

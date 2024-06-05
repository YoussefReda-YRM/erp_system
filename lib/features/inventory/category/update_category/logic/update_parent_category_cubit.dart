import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/update_category/data/repos/update_parent_category_repo.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateParentCategoryCubit extends Cubit<UpdateParentCategoryState> {
  final UpdateParentCategoryRepo _updateSubCategoryRepo;

  UpdateParentCategoryCubit(this._updateSubCategoryRepo)
      : super(UpdateParentCategoryInitial());

  TextEditingController parentCategoryNameController = TextEditingController(
      text: parentCategoryNameControllerInGetIt.toString());

  final formKey = GlobalKey<FormState>();

  void updateparentcategory(int parentid) async {
    emit(UpdateParentCategoryLoading());
    final response = await _updateSubCategoryRepo.updateParentcategory(
      parentid,
      UpdateRequestParentCategory(
        parentCategoryName: parentCategoryNameController.text,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateParentCategorySuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateParentCategoryFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/add_category/data/repos/add_parent_category_repo.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddParentCategoryCubit extends Cubit<AddParentCategoryState> {
  final AddParentCategoryRepo _addParentCategoryRepo;
  AddParentCategoryCubit(this._addParentCategoryRepo)
      : super(AddParentCategoryInitial());

  TextEditingController parentCategoryNameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addparentcategory() async {
    emit(AddParentCategoryLoading());
    final response = await _addParentCategoryRepo.addparentcategory(
      AddRequestParentCategory(
        parentCategoryName: parentCategoryNameController.text,
      ),
    );

    response.when(
      success: (response) {
        emit(AddParentCategorySuccess(response: response));
      },
      failure: (error) {
        emit(
          AddParentCategoryFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

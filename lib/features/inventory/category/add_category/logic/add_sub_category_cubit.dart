import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/category/add_category/data/repos/add_sub_category_repo.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_state.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_sub_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSubCategoryCubit extends Cubit<AddSubCategoryState> {
  final AddSubCategoryRepo _addSubCategoryRepo;
  AddSubCategoryCubit(this._addSubCategoryRepo)
      : super(AddSubCategoryInitial());

  TextEditingController subCategoryNameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addsubcategory(int parentId) async {
    emit(AddSubCategoryLoading());
    final response = await _addSubCategoryRepo.addsubcategory(
      AddRequestSubCategoey(
        subCategoryName: subCategoryNameController.text,
        parentCategoryId: parentId,
      ),
      getIt.get<LoginResponse>().token!,
    );

    response.when(
      success: (response) {
        emit(AddSubCategorySuccess(response: response));
      },
      failure: (error) {
        emit(AddSubCategoryFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

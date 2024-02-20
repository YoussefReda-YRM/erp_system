import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_sub_category.dart';
import 'package:erp_system/features/inventory/category/update_category/data/repos/update_sub_category_repo.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSubCategoryCubit extends Cubit<UpdateSubCategoryState> {
  final UpdateSubCategoryRepo _updateSubCategoryRepo;
  UpdateSubCategoryCubit(
    this._updateSubCategoryRepo,
  ) : super(UpdateSubCategoryInitial());

  TextEditingController subCategoryNameController = TextEditingController(text: subCategoryNameControllerInGetIt);

  final formKey = GlobalKey<FormState>();

  void updatesubcategory(int subid, int parentid) async {
    emit(UpdateSubCategoryLoading());
    print(subCategoryNameController.text);
    final response = await _updateSubCategoryRepo.updatesubcategory(
      getIt.get<LoginResponse>().token!,
      subid,
      UpdateRequestSubCategory(
        subCategoryName: subCategoryNameController.text,
        parentCategoryId: parentid,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateSubCategorySuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateSubCategoryFailure(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}

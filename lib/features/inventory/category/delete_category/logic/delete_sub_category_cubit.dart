// import 'package:erp_system/features/inventory/category/delete_category/data/repos/delete_sub_category_repo.dart';
// import 'package:erp_system/features/inventory/category/delete_category/logic/delete_category_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DeleteSubCategoryCubit extends Cubit<DeleteCategoryState> {
//   final DeleteSubCategoryRepo _deletesubCategoryRepo;
//   DeleteSubCategoryCubit(this._deletesubCategoryRepo)
//       : super(DeleteCategoryInitial());

  // void deleteSubcategory(String token, int subCategoryId) async {
  //   emit(DeleteCategoryLoading());

  //   final response =
  //       await _deletesubCategoryRepo.deleteSubcategory(token, subCategoryId);

  //   response.when(
  //     success: (response) {
  //       emit(DeleteCategorySuccess(response));
  //     },
  //     failure: (error) {
  //       emit(DeleteCategoryFailure(error: error.apiErrorModel.message ?? ''));
  //     },
  //   );
  // }
// }

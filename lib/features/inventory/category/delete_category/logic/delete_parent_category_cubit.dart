// import 'package:erp_system/features/inventory/category/delete_category/data/repos/delete_parent_category_repo.dart';
// import 'package:erp_system/features/inventory/category/delete_category/logic/delete_category_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DeleteParentCategoryCubit extends Cubit<DeleteCategoryState> {
//   final DeleteParentCategoryRepo _deleteparentCategoryRepo;
//   DeleteParentCategoryCubit(this._deleteparentCategoryRepo)
//       : super(DeleteCategoryInitial());
//   void deleteparentcategory(String token, int parentCategoryId) async {
//     emit(DeleteCategoryLoading());

//     final response = await _deleteparentCategoryRepo.deleteParentCategory(
//       token,
//       parentCategoryId,
//     );

//     response.when(
//       success: (response) {
//         emit(DeleteCategorySuccess(response));
//       },
//       failure: (error) {
//         emit(DeleteCategoryFailure(error: error.apiErrorModel.message ?? ''));
//       },
//     );
//   }
// }

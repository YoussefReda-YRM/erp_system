import 'package:erp_system/features/inventory/product/get_all_product/data/repos/get_all_product_repo.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final GetAllProductRepo _getAllProductRepo;
  GetAllProductCubit(this._getAllProductRepo) : super(GetAllProductInitial());
  Future<void> getAllProduct(String? token) async {
    emit(GetAllProductLoading());
    var response = await _getAllProductRepo.getAllProduct(token!);
    response.when(
      success: (getAllProductResponse) {
        emit(GetAllProductSuccess(
          response: getAllProductResponse,
        ));
      },
      failure: (error) {
        emit(GetAllProductFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

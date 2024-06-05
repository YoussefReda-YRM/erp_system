import 'package:erp_system/features/inventory/product/details_product/data/repo/details_product_repo.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsProductCubit extends Cubit<DetailsProductState> {
  final DetailsProductRepo _detailsProductRepo;
  DetailsProductCubit(this._detailsProductRepo)
      : super(DetailsProductInitial());
  Future<void> getProductById(int? idProduct) async {
    emit(DetailsProductLoading());
    var response = await _detailsProductRepo.getProductById(idProduct!);
    response.when(
      success: (productDetails) {
        emit(DetailsProductSuccess(
          response: productDetails,
        ));
      },
      failure: (error) {
        emit(DetailsProductFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

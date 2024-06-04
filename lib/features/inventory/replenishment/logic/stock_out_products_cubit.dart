import 'package:erp_system/features/inventory/replenishment/data/repos/stock_out_products_repo.dart';
import 'package:erp_system/features/inventory/replenishment/logic/stock_out_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockOutProductsCubit extends Cubit<StockOutProductstState> {
  final StockOutProductsRepo _stockOutProductsRepo;
  StockOutProductsCubit(this._stockOutProductsRepo)
      : super(StockOutProductsInitial());
  Future<void> stockOutProducts() async {
    emit(StockOutProductsLoading());
    var response = await _stockOutProductsRepo.stockoutProducts();
    response.when(
      success: (getAllStockOutProducts) {
        emit(StockOutProductsSuccess(
          response: getAllStockOutProducts,
        ));
      },
      failure: (error) {
        emit(StockOutProductsFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/repos/order_details_repo.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/logic/order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo _orderDetailsRepo;
  OrderDetailsCubit(this._orderDetailsRepo) : super(OrderDetailsInitial());
  Future<void> getSpecificInventoryOrder(int orderId) async {
    emit(OrderDetailsLoading());
    var response = await _orderDetailsRepo.getSpecificInventoryOrder(
      orderId,
    );
    response.when(
      success: (getAllProductResponse) {
        emit(OrderDetailsSuccess(
          response: getAllProductResponse,
        ));
      },
      failure: (error) {
        emit(OrderDetailsFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

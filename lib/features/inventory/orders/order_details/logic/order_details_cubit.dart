import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/orders/order_details/data/repos/order_details_repo.dart';
import 'package:erp_system/features/inventory/orders/order_details/logic/order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo _orderDetailsRepo;
  OrderDetailsCubit(this._orderDetailsRepo) : super(OrderDetailsInitial());
  Future<void> getSpecificInventoryOrder(int orderId) async {
    emit(OrderDetailsLoading());
    var response = await _orderDetailsRepo.getSpecificInventoryOrder(
      getIt.get<LoginResponse>().token!,
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

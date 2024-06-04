import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/inventory_order/get_all_inventory_order/data/repos/get_all_inventory_orders_repo.dart';
import 'package:erp_system/features/inventory/inventory_order/get_all_inventory_order/logic/get_all_inventory_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInventoryOrdersCubit extends Cubit<GetAllInventoryOrdersState> {
  final GetAllInventoryOrdersRepo _getAllInventoryOrdersRepo;
  GetAllInventoryOrdersCubit(this._getAllInventoryOrdersRepo)
      : super(GetAllInventoryOrdersInitial());
  Future<void> getAllInventoryOrders() async {
    emit(GetAllInventoryOrdersLoading());
    var response = await _getAllInventoryOrdersRepo.getAllInventoryOrders(
      getIt.get<LoginResponse>().token!,
    );
    response.when(
      success: (getAllInventoryOrders) {
        emit(GetAllInventoryOrdersSuccess(
          response: getAllInventoryOrders,
        ));
      },
      failure: (error) {
        emit(GetAllInventoryOrdersFailure(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

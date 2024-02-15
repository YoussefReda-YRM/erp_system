import 'package:erp_system/features/inventory/inventory_home/data/repo/inventory_home_repo.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryHomeCubit extends Cubit<InventoryHomeState> {
  final InventoryHomeRepo _inventoryHomeRepo;
  InventoryHomeCubit(this._inventoryHomeRepo) : super(InventoryHomeInitial());
  Future<void> getNumberOfProductsAndReplenishment(String? token) async {
    emit(InventoryHomeLoading());
    var response = await _inventoryHomeRepo.getNumberOfProductsAndReplenishment(token!);
    response.when(
      success: (numbersOfProductsAndReplenishment) {
        emit(InventoryHomeSuccess(
          response: numbersOfProductsAndReplenishment,
        ));
      },
      failure: (error) {
        emit(InventoryHomeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

import 'package:erp_system/features/accounting/accept_or_reject_inventory_order/data/models/update_status_of_inventory_order_request.dart';
import 'package:erp_system/features/accounting/accept_or_reject_inventory_order/data/repos/update_status_of_inventory_order_repo.dart';
import 'package:erp_system/features/accounting/accept_or_reject_inventory_order/logic/update_status_of_inventory_order_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStatusOfInventoryOrderCubit
    extends Cubit<UpdateStatusOfInventoryOrderState> {
  final UpdateStatusOfInventoryOrderRepo _updateStatusOfInventoryOrderRepo;

  UpdateStatusOfInventoryOrderCubit(this._updateStatusOfInventoryOrderRepo)
      : super(UpdateStatusOfInventoryOrderInitial());

  final formKey = GlobalKey<FormState>();

  void updateStatusOfInventoryOrder(String orderId, int status) async {
    emit(UpdateStatusOfInventoryOrderLoading());
    final response =
        await _updateStatusOfInventoryOrderRepo.updateStatusOfInventoryOrder(
      orderId,
      UpdateStatusOfInventoryOrderRequest(
        status: status,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateStatusOfInventoryOrderSuccess());
      },
      failure: (error) {
        emit(
          UpdateStatusOfInventoryOrderFailure(
              error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

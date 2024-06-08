import 'package:erp_system/features/inventory/inventory_order/update_order/data/models/update_order_request.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/data/repos/update_order_repo.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  final UpdateOrderRepo _updateOrderRepo;

  UpdateOrderCubit(this._updateOrderRepo) : super(UpdateOrderInitial());

  TextEditingController accEmployeeIdController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  TextEditingController referenceController = TextEditingController();

    TextEditingController supplierIdController = TextEditingController();
  TextEditingController supplierNameController = TextEditingController();


  final formKey = GlobalKey<FormState>();

  void updateOrder(int orderId) async {
    emit(UpdateOrderLoading());
    final response = await _updateOrderRepo.updateOrder(
      orderId,
      UpdateOrderRequest(
        accEmployeeId: accEmployeeIdController.text,
        quantity: int.parse(quantityController.text),
        reference: referenceController.text,
                supplierId: int.parse(supplierIdController.text),

        
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateOrderSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateOrderFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

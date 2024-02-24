import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/orders/update_order/data/models/update_order_request.dart';
import 'package:erp_system/features/scm/orders/update_order/data/repos/update_order_repo.dart';
import 'package:erp_system/features/scm/orders/update_order/logic/update_order_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  final UpdateOrderRepo _updateOrderRepo;

  UpdateOrderCubit(this._updateOrderRepo) : super(UpdateOrderInitial());

  TextEditingController accEmployeeIdController =
      TextEditingController(text: accEmployeeIdControllerInGetIt.toString());

  TextEditingController quantityController =
      TextEditingController(text: quantityControllerInGetIt.toString());

  TextEditingController referenceController =
      TextEditingController(text: referenceControllerInGetIt.toString());

  final formKey = GlobalKey<FormState>();

  void updateOrder(int orderId) async {
    emit(UpdateOrderLoading());
    final response = await _updateOrderRepo.updateOrder(
      getIt.get<LoginResponse>().token!,
      orderId,
      UpdateOrderRequest(
        accEmployeeId: accEmployeeIdController.text,
        quantity: quantityController.text,
        reference: referenceController.text,
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

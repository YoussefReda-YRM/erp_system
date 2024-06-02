import 'package:erp_system/features/inventory/replenishment/data/models/re_order_request.dart';
import 'package:erp_system/features/inventory/replenishment/data/repos/re_order_repo.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReOrderCubit extends Cubit<ReOrderState> {
  final ReOrderRepo _reOrderRepo;

  // TextEditingController productIdController = TextEditingController();
  TextEditingController accEmployeeIdController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ReOrderCubit(this._reOrderRepo) : super(ReOrderInitial());
  Future<void> reOrder(int productId) async {
    emit(ReOrderLoading());
    var response = await _reOrderRepo.reOrder(
      ReorderRequest(
        accEmployeeId: accEmployeeIdController.text,
        productId: productId,
        quantity: int.parse(quantityController.text),
        reference: referenceController.text,
      ),
    );
    response.when(
      success: (s) {
        emit(
          ReOrderSuccess(),
        );
      },
      failure: (error) {
        emit(ReOrderFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

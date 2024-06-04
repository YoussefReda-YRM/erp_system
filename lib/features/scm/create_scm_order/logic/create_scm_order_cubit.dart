import 'package:erp_system/features/scm/create_scm_order/data/models/create_scm_order_request.dart';
import 'package:erp_system/features/scm/create_scm_order/data/repos/create_scm_order_repo.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateScmOrderCubit extends Cubit<CreateScmOrderState> {
  final CreateScmOrderRepo _createScmOrderRepo;

  TextEditingController accEmployeeIdController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CreateScmOrderCubit(this._createScmOrderRepo)
      : super(CreateScmOrderInitial());
  Future<void> createScmOrder(List<Product> products) async {
    emit(CreateScmOrderLoading());
    var response = await _createScmOrderRepo.createScmOrder(
      CreateScmOrderRequest(
        accEmployeeId: accEmployeeIdController.text,
        reference: referenceController.text,
        products: products,
      ),
    );
    response.when(
      success: (s) {
        emit(
          CreateScmOrderSuccess(),
        );
      },
      failure: (error) {
        emit(CreateScmOrderFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

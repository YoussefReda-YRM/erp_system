import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/data/models/AddScmOrderRequest.dart';
import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/data/repos/add_scm_order_repo.dart';
import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/logic/Add_scm_order_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScmOrderCubit extends Cubit<AddScmOrderState> {
  final AddScmOrderRepo _addScmOrderRepo;
  AddScmOrderCubit(this._addScmOrderRepo)
      : super(AddScmOrderInitial());



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addSupplier() async {
    emit(AddScmOrderLoading());
    /*final response = await _addScmOrderRepo.addScmOrder(AddScmOrderModel(
      accEmployeeId: ,
      products: List<>,
      reference:
    ), getIt.get<LoginResponse>().token!,)
    ;*/


  /*  response.when(
      success: (response) {
        emit(AddScmOrderSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddScmOrderFailure(error: error.apiErrorModel.message ?? ''),
        );
      },*/
   // );
  }
}

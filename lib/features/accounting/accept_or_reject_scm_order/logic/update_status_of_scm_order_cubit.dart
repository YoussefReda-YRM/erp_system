import 'package:erp_system/features/accounting/accept_or_reject_scm_order/data/models/update_status_of_scm_order_request.dart';
import 'package:erp_system/features/accounting/accept_or_reject_scm_order/data/repos/update_status_of_scm_order_repo.dart';
import 'package:erp_system/features/accounting/accept_or_reject_scm_order/logic/update_status_of_scm_order_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStatusOfScmOrderCubit extends Cubit<UpdateStatusOfScmOrderState> {
  final UpdateStatusOfScmOrderRepo _updateStatusOfScmOrderRepo;

  UpdateStatusOfScmOrderCubit(this._updateStatusOfScmOrderRepo)
      : super(UpdateStatusOfScmOrderInitial());

  final formKey = GlobalKey<FormState>();

  void updateStatusOfScmOrder(String orderId, int status) async {
    emit(UpdateStatusOfScmOrderLoading());
    final response = await _updateStatusOfScmOrderRepo.updateStatusOfScmOrder(
      orderId,
      UpdateStatusOfScmOrderRequest(
        status: status,
      ),
    );

    response.when(
      success: (response) {
        emit(UpdateStatusOfScmOrderSuccess());
      },
      failure: (error) {
        emit(
          UpdateStatusOfScmOrderFailure(
              error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

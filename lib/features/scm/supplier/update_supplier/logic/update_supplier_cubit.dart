import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/repos/update_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSupplierCubit extends Cubit<UpdateSupplierState> {
  final UpdateSupplierRepo _updateSupplierRepo;

  UpdateSupplierCubit(this._updateSupplierRepo)
      : super(UpdateSupplierInitial());

  TextEditingController supplierNameController = TextEditingController(text: supplierNameControllerInGetIt.toString());
  TextEditingController supplierEmailController = TextEditingController(text: supplierEmailControllerInGetIt.toString());
  TextEditingController supplierPhoneController = TextEditingController(text: supplierPhoneControllerInGetIt.toString());

  final formKey = GlobalKey<FormState>();

  void updateSupplier(int supplierId) async {
    emit(UpdateSupplierLoading());
    final response = await _updateSupplierRepo.updateSupplier(getIt.get<LoginResponse>().token!, supplierId, UpdateSupplierRequest(
      supplierName: supplierNameController.text,
      supplierEmail:supplierEmailController.text ,
      supplierPhone: supplierPhoneController.text
    ));

    response.when(
      success: (response) {
        emit(UpdateSupplierSuccess(response: response));
      },
      failure: (error) {
        emit(
          UpdateSupplierFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

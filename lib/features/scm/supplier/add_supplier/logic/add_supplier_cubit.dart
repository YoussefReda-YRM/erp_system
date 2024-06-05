import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/repos/add_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSupplierCubit extends Cubit<AddSupplierState> {
  final AddSupplierRepo _addSupplierRepo;
  AddSupplierCubit(this._addSupplierRepo) : super(AddSupplierInitial());

  TextEditingController supplierNameController = TextEditingController();
  TextEditingController supplierEmailController = TextEditingController();
  TextEditingController supplierPhoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addSupplier() async {
    emit(AddSupplierLoading());
    final response = await _addSupplierRepo.addSupplier(
      AddSupplierRequest(
        supplierName: supplierNameController.text,
        supplierEmail: supplierEmailController.text,
        supplierPhone: supplierPhoneController.text,
      ),
    );

    response.when(
      success: (response) {
        print("kkkkkk");
        emit(AddSupplierSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddSupplierFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

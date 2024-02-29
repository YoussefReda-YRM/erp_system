
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierResponse.dart';

abstract class AddSupplierState {}

class AddSupplierInitial extends AddSupplierState {}

class AddSupplierLoading extends AddSupplierState {}

class AddSupplierFailure extends AddSupplierState {
  final String error;

  AddSupplierFailure({required this.error});
}

class AddSupplierSuccess extends AddSupplierState {
  final AddSupplierResponse response;

  AddSupplierSuccess({
    required this.response,
  });
}

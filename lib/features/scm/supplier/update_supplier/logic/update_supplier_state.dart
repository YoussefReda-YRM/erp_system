import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierResponse.dart';

abstract class UpdateSupplierState {}

class UpdateSupplierInitial extends UpdateSupplierState {}

class UpdateSupplierLoading extends UpdateSupplierState {}

class UpdateSupplierSuccess extends UpdateSupplierState {
  final UpdateSupplierResponse response;

  UpdateSupplierSuccess({required this.response});
}

class UpdateSupplierFailure extends UpdateSupplierState {
  final String error;

  UpdateSupplierFailure({required this.error});
}

import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';

abstract class GetAllSupplierState {}

class GetAllSupplierInitial extends GetAllSupplierState {}

class GetAllSupplierLoading extends GetAllSupplierState {}

class GetAllSupplierFailure extends GetAllSupplierState {
  final String error;

  GetAllSupplierFailure({required this.error});
}

class GetAllSupplierSuccess extends GetAllSupplierState {
  final GetAllSupplierResponse response;

  GetAllSupplierSuccess({
    required this.response,
  });
}

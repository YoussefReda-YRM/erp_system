import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';

abstract class GetAllInvoicesOfSupplierState {}

class GetAllInvoicesOfSupplierInitial extends GetAllInvoicesOfSupplierState {}

class GetAllInvoicesOfSupplierLoading extends GetAllInvoicesOfSupplierState {}

class GetAllInvoicesOfSupplierFailure extends GetAllInvoicesOfSupplierState {
  final String error;

  GetAllInvoicesOfSupplierFailure({required this.error});
}

class GetAllInvoicesOfSupplierSuccess extends GetAllInvoicesOfSupplierState {
  final List<GetAllInvoicesOfSupplierResponse> response;

  GetAllInvoicesOfSupplierSuccess({
    required this.response,
  });
}

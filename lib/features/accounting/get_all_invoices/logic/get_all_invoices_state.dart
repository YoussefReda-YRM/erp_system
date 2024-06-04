import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';

abstract class GetAllInvoicesState {}

class GetAllInvoicesInitial extends GetAllInvoicesState {}

class GetAllInvoicesLoading extends GetAllInvoicesState {}

class GetAllInvoicesFailure extends GetAllInvoicesState {
  final String error;

  GetAllInvoicesFailure({required this.error});
}

class GetAllInvoicesSuccess extends GetAllInvoicesState {
  final List<GetAllInvoicesResponse> response;

  GetAllInvoicesSuccess({
    required this.response,
  });
}

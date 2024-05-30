import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/repos/get_all_invoices_of_supplier_repo.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/logic/get_all_invoices_of_supplier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInvoicesOfSupplierCubit
    extends Cubit<GetAllInvoicesOfSupplierState> {
  final GetAllInvoicesOfSupplierRepo _getAllInvoicesOfSupplierRepo;
  GetAllInvoicesOfSupplierCubit(
    this._getAllInvoicesOfSupplierRepo,
  ) : super(GetAllInvoicesOfSupplierInitial());
  Future<void> getAllInvoicesOfSupplier(int supplierId) async {
    emit(GetAllInvoicesOfSupplierLoading());
    var response = await _getAllInvoicesOfSupplierRepo
        .getAllInvoicesOfSupplier(supplierId);
    response.when(
      success: (getAllInvoices) {
        emit(
          GetAllInvoicesOfSupplierSuccess(
            response: getAllInvoices,
          ),
        );
      },
      failure: (error) {
        emit(GetAllInvoicesOfSupplierFailure(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

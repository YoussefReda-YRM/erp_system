import 'package:erp_system/features/accounting/get_all_invoices/data/repos/get_all_invoices_repo.dart';
import 'package:erp_system/features/accounting/get_all_invoices/logic/get_all_invoices_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInvoicesCubit extends Cubit<GetAllInvoicesState> {
  final GetAllInvoicesRepo _getAllInvoicesRepo;
  GetAllInvoicesCubit(
    this._getAllInvoicesRepo,
  ) : super(GetAllInvoicesInitial());
  Future<void> getAllInvoices() async {
    emit(GetAllInvoicesLoading());
    var response = await _getAllInvoicesRepo.getAllInvoices();
    response.when(
      success: (getAllInvoices) {
        emit(
          GetAllInvoicesSuccess(
            response: getAllInvoices,
          ),
        );
      },
      failure: (error) {
        emit(GetAllInvoicesFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

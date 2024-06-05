import 'package:erp_system/features/scm/supplier/get_all_suplier/data/repos/get_all_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllSupplierCubit extends Cubit<GetAllSupplierState> {
  final GetAllSupplierRepo _getAllSupplierRepo;
  GetAllSupplierCubit(this._getAllSupplierRepo)
      : super(GetAllSupplierInitial());
  Future<void> getAllSupplier() async {
    emit(GetAllSupplierLoading());
    var response = await _getAllSupplierRepo.getAllSupplier();
    response.when(
      success: (GetAllSupplierResponse) {
        emit(GetAllSupplierSuccess(
          response: GetAllSupplierResponse,
        ));
      },
      failure: (error) {
        emit(GetAllSupplierFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

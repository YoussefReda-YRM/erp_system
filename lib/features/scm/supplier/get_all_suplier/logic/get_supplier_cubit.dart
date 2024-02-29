import 'package:erp_system/features/scm/supplier/get_all_suplier/data/repos/get_all_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllSupplierCubit extends Cubit<GetAllSupplierState> {
  final GetAllSupplierRepo _getAllSupplierRepo;
  GetAllSupplierCubit(this._getAllSupplierRepo) : super(GetAllSupplierInitial());
  Future<void> getAllSupplier(String? token) async {
    emit(GetAllSupplierLoading());
    var response = await _getAllSupplierRepo.getAllSupplier(
        "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJtZW5uYSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1lbm5hQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkhSIiwiZXhwIjoxNzA4ODkyMzg5LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDY5IiwiYXVkIjoiTXlTZWN1cmVkQVBJVXNlcnMifQ.k110BFMuld2XE8kVwAzB2SlIabwVt7FBPhOJM4QK-wM");
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
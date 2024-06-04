import 'package:erp_system/features/accounting/taxes/get_all_taxes/data/repos/get_all_taxes_repo.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/logic/get_all_taxes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllTaxesCubit extends Cubit<GetAllTaxesState> {
  final GetAllTaxesRepo _allTaxesRepo;
  GetAllTaxesCubit(this._allTaxesRepo)
      : super(GetAllTaxesInitial());
  Future<void> getAllTaxes() async {
    emit(GetAllTaxesLoading());
    var response = await _allTaxesRepo.getAllTaxes();
    response.when(
      success: (getAllTaxes) {
        emit(GetAllTaxesSuccess(
          response: getAllTaxes,
        ));
      },
      failure: (error) {
        emit(GetAllTaxesFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

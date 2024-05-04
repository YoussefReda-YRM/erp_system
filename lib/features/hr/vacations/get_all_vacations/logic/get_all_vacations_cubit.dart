import 'package:erp_system/features/hr/vacations/get_all_vacations/data/repos/get_all_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/logic/get_all_vacations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllVacationsCubit extends Cubit<GetAllVacationsState> {
  final GetAllVacationRepo _getAllVacationRepo;
  GetAllVacationsCubit(this._getAllVacationRepo)
      : super(GetAllVacationsInitial());
  Future<void> getAllVacations() async {
    emit(GetAllVacationsLoading());
    var response = await _getAllVacationRepo.getAllVacations();
    response.when(
      success: (getAllVacations) {
        emit(GetAllVacationsSuccess(
          response: getAllVacations,
        ));
      },
      failure: (error) {
        emit(GetAllVacationsFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

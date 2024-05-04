import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';

abstract class GetAllVacationsState {}

class GetAllVacationsInitial extends GetAllVacationsState {}

class GetAllVacationsLoading extends GetAllVacationsState {}

class GetAllVacationsFailure extends GetAllVacationsState {
  final String error;

  GetAllVacationsFailure({required this.error});
}

class GetAllVacationsSuccess extends GetAllVacationsState {
  final List<GetAllVacationModel> response;

  GetAllVacationsSuccess({
    required this.response,
  });
}

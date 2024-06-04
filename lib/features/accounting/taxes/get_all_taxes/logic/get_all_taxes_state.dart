
import 'package:erp_system/features/accounting/taxes/get_all_taxes/data/models/GetAllTaxesModel.dart';

abstract class GetAllTaxesState {}

class GetAllTaxesInitial extends GetAllTaxesState {}

class GetAllTaxesLoading extends GetAllTaxesState {}

class GetAllTaxesFailure extends GetAllTaxesState {
  final String error;

  GetAllTaxesFailure({required this.error});
}

class GetAllTaxesSuccess extends GetAllTaxesState {
  final List<GetAllTaxesModel> response;

  GetAllTaxesSuccess({
    required this.response,
  });
}


import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesResponse.dart';

abstract class AddTaxesState {}

class AddTaxesInitial extends AddTaxesState {}

class AddTaxesLoading extends AddTaxesState {}

class AddTaxesFailure extends AddTaxesState {
  final String error;

  AddTaxesFailure({required this.error});
}

class AddTaxesSuccess extends AddTaxesState {
  final AddTaxesResponse response;

  AddTaxesSuccess({
    required this.response,
  });
}

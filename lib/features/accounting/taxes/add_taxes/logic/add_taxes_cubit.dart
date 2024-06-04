import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesRequest.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/repos/add_taxes_repo.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/logic/add_taxes_state.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaxesCubit extends Cubit<AddTaxesState> {
  final AddTaxesRepo _addTaxesRepo;
  AddTaxesCubit(this._addTaxesRepo) : super(AddTaxesInitial());

  TextEditingController taxNameController = TextEditingController();
  TextEditingController taxValueController = TextEditingController();
  TextEditingController taxTypeController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addTaxes() async {
    emit(AddTaxesLoading());
    final response = await _addTaxesRepo.addTaxes(AddTaxesRequest(taxName:taxNameController.text ,taxValue: taxValueController.text ,taxType: taxTypeController.text), getIt.get<LoginResponse>().token!,);
    response.when(
      success: (response) {
        emit(AddTaxesSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddTaxesFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

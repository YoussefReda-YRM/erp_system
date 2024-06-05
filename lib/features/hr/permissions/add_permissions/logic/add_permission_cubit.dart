import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/repos/add_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPermissionCubit extends Cubit<AddPermissionState> {
  final AddPermissionRepo _addPermissionRepo;
  AddPermissionCubit(this._addPermissionRepo) : super(AddPermissionInitial());

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addPermission() async {
    emit(AddPermissionLoading());
    final response =
        await _addPermissionRepo.addPermission(AddPermissionRequest(
      start: startTimeController.text,
      end: endTimeController.text,
      date: dateController.text,
      description: descriptionController.text,
    ));

    response.when(
      success: (response) {
        emit(AddPermissionSuccess(response: response));
      },
      failure: (error) {
        emit(
          AddPermissionFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

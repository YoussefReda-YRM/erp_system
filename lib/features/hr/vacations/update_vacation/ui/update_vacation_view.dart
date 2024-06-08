import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/ui/widget/update_vacation_body.dart';
import 'package:flutter/material.dart';

class UpdateVacationView extends StatelessWidget {
  const UpdateVacationView(
      {super.key, required this.getAllVacationModel, required this.title});
  final GetAllVacationModel getAllVacationModel;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateVacationBody(
        getAllVacationModel: getAllVacationModel,
        title: title,
      ),
    );
  }
}

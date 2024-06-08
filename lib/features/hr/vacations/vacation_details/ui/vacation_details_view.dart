import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/vacation_details/ui/widgets/vacation_details_view_body.dart';
import 'package:flutter/material.dart';

class VacationDetailsView extends StatelessWidget {
  const VacationDetailsView({
    super.key,
    required this.vacationModel,
  });
  final GetAllVacationModel vacationModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBarApp(
            title: "Vacation Details",
            iconLeading: CustomBackButton(),
          ),
          Expanded(
            child: CustomAppBody(
              child: VacationDetailsViewBody(vacationModel: vacationModel),
            ),
          ),
        ],
      ),
    );
  }
}

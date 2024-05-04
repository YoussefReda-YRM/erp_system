import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:flutter/material.dart';

class VacationDetailsViewBodyItems extends StatelessWidget {
  const VacationDetailsViewBodyItems({super.key, required this.vacationModel});
  final GetAllVacationModel vacationModel;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Employee Name: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text("${vacationModel.employee}",
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "From: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(vacationModel.start!, style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "To: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(vacationModel.end!, style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reason: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(vacationModel.description!,
                style: Styles.font13BlueSemiBold(context)
                // .copyWith(color: Colors.pink),
                ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Status: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              vacationModel.status == 0 ? "Pending" : "Finished",
              style: Styles.font13BlueSemiBold(context).copyWith(
                color: vacationModel.status == 0 ? Colors.orange : Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String paresDate(String dateString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Convert to local timezone
  dateTime = dateTime.toLocal();

  // Extract only the date
  return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
}

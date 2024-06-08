import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/vacation_details/ui/widgets/vacation_details_view_body_item.dart';
import 'package:flutter/material.dart';

class VacationDetailsViewBody extends StatelessWidget {
  const VacationDetailsViewBody({
    super.key,
    required this.vacationModel,
  });

  final GetAllVacationModel vacationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: ColorsApp.primaryColor),
              ),
              color: Colors.white,
              child: SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: VacationDetailsViewBodyItems(
                    vacationModel: vacationModel,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // AppTextButton(
            //   buttonText: "Edit",
            //   backgroundColor: Colors.green,
            //   textStyle: Styles.font13BlueSemiBold(context),
            //   onPressed: () {
            //     accEmployeeIdControllerInGetIt =
            //         state.response.data!.accEmployee.toString();
            //     quantityControllerInGetIt =
            //         state.response.data!.quantity.toString();
            //     referenceControllerInGetIt =
            //         state.response.data!.reference.toString();

            //     GoRouter.of(context).push(
            //       AppRouter.kUpdateOrderView,
            //       extra: state.response.data!.id,
            //     );
            //   },
            // ),

            // userRole == "HRAdmin" || userRole == "HREmployee"
            //     ? Row(
            //         children: [
            //           Expanded(
            //             child: AppTextButton(
            //               borderRadius: 8,
            //               buttonText: "Reject",
            //               backgroundColor: const Color(0xffFF7F74),
            //               textStyle: Styles.font13BlueSemiBold(context),
            //               onPressed: () {},
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Expanded(
            //             child: AppTextButton(
            //               borderRadius: 8,
            //               buttonText: "Accept",
            //               backgroundColor: const Color(0xff30BEB6),
            //               textStyle: Styles.font13BlueSemiBold(context),
            //               onPressed: () {},
            //             ),
            //           ),
            //         ],
            //       )
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

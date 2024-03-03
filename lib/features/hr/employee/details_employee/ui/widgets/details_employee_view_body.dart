import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/details_employee_view_body_items.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/edit_and_delete_button.dart';
import 'package:flutter/material.dart';

class DetailsEmployeeViewBody extends StatelessWidget {
  const DetailsEmployeeViewBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: ColorsApp.primaryColor),
              ),
              color: Colors.white,
              child: const SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: DetailsEmployeeViewBodyItems(
                        // detailsProductModel: state.response,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            EditAndDeleteButton(size: size),
          ],
        ),
      ),
    );
  }
}

import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/details_employee_view_body.dart';
import 'package:flutter/material.dart';

class DetailsEmployeeView extends StatelessWidget {
  const DetailsEmployeeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBarApp(
            title: "Employee Details",
            iconLeading: CustomBackButton(),
          ),
          Expanded(
            child: CustomAppBody(
              child: DetailsEmployeeViewBody(
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

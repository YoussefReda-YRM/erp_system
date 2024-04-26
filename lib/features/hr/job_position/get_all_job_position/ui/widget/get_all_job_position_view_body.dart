import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/ui/widget/get_all_job_position_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllJobPositionViewBody extends StatelessWidget {
  const GetAllJobPositionViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          title: 'All Job Position',
          iconLeading: CustomBackButton(
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        const Expanded(child: GetAllJobPositionBloc()),
      ],
    );
  }
}

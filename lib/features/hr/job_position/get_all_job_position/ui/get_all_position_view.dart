import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/ui/widget/get_all_job_position_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllJobPosition extends StatefulWidget {
  const GetAllJobPosition({super.key, required this.depId});

  final int depId;

  @override
  State<GetAllJobPosition> createState() => _GetAllJobPositionState();
}

class _GetAllJobPositionState extends State<GetAllJobPosition> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GetAllJobPositionViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: CustomFloatingActionButton(
        ctxt: context,
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddJobPositionsView, extra: widget.depId);
        },
      ),
    );
  }
}

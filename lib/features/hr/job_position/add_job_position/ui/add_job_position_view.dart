import 'package:erp_system/features/hr/job_position/add_job_position/ui/widget/add_job_position_body.dart';
import 'package:flutter/material.dart';

class AddJobPositionView extends StatelessWidget {
  const AddJobPositionView({super.key,required this.depId});
  final int depId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AddJobPositionBody(
        depId: depId,
      ),
    );
  }
}

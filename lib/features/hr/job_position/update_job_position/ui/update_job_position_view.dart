import 'package:erp_system/features/hr/job_position/update_job_position/ui/widget/update_job_position_view_body.dart';
import 'package:flutter/material.dart';

class UpdateJobPositionView extends StatelessWidget {
  const UpdateJobPositionView({super.key,required this.jobId,required this.depId/*,required this.jobName*/});
  final int jobId;
//  final String jobName;
  final int depId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpdateJobPositionViewBody(

        jobId:jobId ,
       // jobName: jobName,
        depId: depId,
      ),
    );
  }
}

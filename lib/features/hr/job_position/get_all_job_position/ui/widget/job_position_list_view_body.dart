import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobPositionListViewBody extends StatelessWidget{
  const JobPositionListViewBody({super.key,required this.response});
  final List<GetAllJobPositionResponse> response;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kDepartmentDetails,
              extra: response[index],
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  child: Text(
                    //response.data![index].id.toString() ?? "0"
                    response[index].id.toString(),
                  ),
                ),
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    response[index].jobName.toString(),

                    // response.data![index].departmentName??"non",
                    //response.childDepartment![index].departmentName.toString(),
                    style: Styles.font18DarkBlueBold(context),
                  ),
                ),
               // trailing:
                /* DepartmentPopupMenuButton(
                    departmentData: response[index]
                ),*/
              ),
            ),
          ),
        );
      },
    );
  }
}
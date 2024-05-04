import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/logic/delete_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobPositionListViewBody extends StatelessWidget {
  const JobPositionListViewBody(
      {super.key, required this.response, required this.depId});
  final int depId;
  final List<GetAllJobPositionResponse> response;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
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
              trailing: Row(
                mainAxisSize: MainAxisSize
                    .min, // Ensures the row only takes up needed space
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kUpdatePositionsView,
                        extra: {
                          "jobId": response[index].id,
                          "depId": depId,
                          "jobName": response[index].jobName,
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await deleteShowDialog(
                        context,
                        'Are you sure you want to delete this Job Position?',
                        () {
                          getIt.get<DeleteJobPositionCubit>().deleteJobPosition(response[index].id.toString(),
                              );
                          GoRouter.of(context).pop();

                          Future.delayed(const Duration(milliseconds: 200), () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.kGetAllJobPositionsView,extra: depId);
                          });
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

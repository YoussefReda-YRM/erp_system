import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/department/delete_department/logic/delete_department_cubit.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/GetAllDepartment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DepartmentDetails extends StatelessWidget {
  final String? departmentName;
  final String? departmentDescription;
  final int id;

// final  List<Employee>? employees;


 const DepartmentDetails({super.key,required this.departmentName,required this.departmentDescription,required this.id/*required this.employees*/});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBarApp(
              title: 'Department Details',
              iconLeading: const CustomBackButton(),
              iconTrailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  size: 34,
                  color: ColorsApp.lightGrey,
                ),
              ),
            ),
            CustomAppBody(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: ColorsApp.primaryColor),
                          ),
                          color: Colors.white,
                          child: SizedBox(
                            child: SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Department Name: ",
                                            style:
                                            Styles.font13BlueSemiBold(context),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            child: Text(
                                              departmentName.toString() ?? "none",
                                              style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Department Description: ",
                                            style:
                                            Styles.font13BlueSemiBold(context),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            child: Text(
                                              departmentDescription.toString() ?? "none",
                                              style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    /*  Row(
                                        children: [
                                          Text(
                                            "Supplier Phone: ",
                                            style:
                                            Styles.font13BlueSemiBold(context),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            child: Text(
                                              employee.toString(),
                                              style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                            ),
                                          ),
                                        ],
                                      ),*/
                               /* ListView.builder(
                                  itemCount: employees?.length ?? 0,
                                       itemBuilder: (context, index) {
                                         return ListTile(
                                           title: Text(employees![index].userName.toString()),
                                         );
                                         })*/
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            AppTextButton(
                              buttonText: "Edit",
                              width: MediaQuery.of(context).size.width / 2.5,
                              backgroundColor: Colors.green,
                              textStyle: Styles.font13BlueSemiBold(context),
                              onPressed: () {
                                departmentNameControllerInGetIt = departmentName ?? "none";
                                departmentDescriptionInGetIt =
                                    departmentDescription ?? "none";


                                GoRouter.of(context)
                                    .push(AppRouter.kUpdateDepartment, extra: {"id": id});
                                //showEditProductDialog(context, size);
                              },
                            ),
                            const Spacer(),
                            AppTextButton(
                              buttonText: "Delete",
                              width: MediaQuery.of(context).size.width / 2.5,
                              backgroundColor: Colors.red,
                              textStyle: Styles.font13BlueSemiBold(context),
                              onPressed: () {
                                deleteShowDialog(
                                  context,
                                  'Are you sure you want to delete this Department?',
                                      () {
                                    getIt.get<DeleteDepartmentCubit>().deleteDepartment( id
                                    );
                                    GoRouter.of(context).pop();
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      GoRouter.of(context)
                                          .pushReplacement(AppRouter.kAllDepartmentsView);
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                )

            )
          ],
        ));
  }
}

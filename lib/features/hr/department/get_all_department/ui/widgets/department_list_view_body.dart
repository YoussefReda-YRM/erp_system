import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/GetAllDepartment.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';

class DepartmentListViewBody extends StatelessWidget {
  GetAllDepartmentResponse response=GetAllDepartmentResponse();

  DepartmentListViewBody(this.response,{Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            /*GoRouter.of(context).push(
              AppRouter.kSupplierDetails,
              extra: {
                "supplierName": response.childDepartment![index].supplierName,
                "supplierEmail": response.childDepartment![index].supplierEmail,
                "supplierPhone": response.childDepartment![index].supplierPhone,
                "addedBy": response.childDepartment![index].addedBy,
                "id": response.childDepartment![index].id,
              },
            );*/
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
                  child: Text(response.data![index].id.toString() ?? "0"),
                ),
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    response.data![index].departmentName??"non",
                    //response.childDepartment![index].departmentName.toString(),
                    style: Styles.font18DarkBlueBold(context),
                  ),
                ),
                trailing: const CustomPopupMenuButton(
                  employeeId: "",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

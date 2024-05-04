import 'package:erp_system/features/hr/employee/details_employee/data/models/details_employee_model.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/details_employee_view_body_item.dart';
import 'package:flutter/material.dart';

class DetailsEmployeeViewBodyItems extends StatelessWidget {
  const DetailsEmployeeViewBodyItems({
    super.key,
    required this.detailsEmployeeModel,
  });

  final DetailsEmployeeModel detailsEmployeeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsEmployeeViewBodyItem(
          title: "Employee Name: ",
          titleData: detailsEmployeeModel.name.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Email: ",
          titleData: detailsEmployeeModel.email.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "phoneNumber: ",
          titleData: detailsEmployeeModel.phoneNumber.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Gender: ",
          titleData: detailsEmployeeModel.gender.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "BirthDate: ",
          titleData: detailsEmployeeModel.birthDate.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Employee Role: ",
          titleData: detailsEmployeeModel.role.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Employee Department: ",
          titleData: detailsEmployeeModel.employeeDepartment.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Address: ",
          titleData: detailsEmployeeModel.address.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Nationality: ",
          titleData: detailsEmployeeModel.nationality.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "identificationNo: ",
          titleData: detailsEmployeeModel.identificationNo.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Bank Account: ",
          titleData: detailsEmployeeModel.bankAccount.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Salary: ",
          titleData: detailsEmployeeModel.salary.toString(),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

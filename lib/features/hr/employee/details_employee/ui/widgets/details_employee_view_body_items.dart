import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/details_employee_view_body_item.dart';
import 'package:flutter/material.dart';

class DetailsEmployeeViewBodyItems extends StatelessWidget {
  const DetailsEmployeeViewBodyItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DetailsEmployeeViewBodyItem(
          title: "Employee Name: ",
          titleData: "Basma mohsen",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Email: ",
          titleData: "basmamohsen53@gmail.com",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "phoneNumber: ",
          titleData: "01014654026",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Gender: ",
          titleData: "Female",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "BirthDate: ",
          titleData: "3/3/2024",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Employee Role: ",
          titleData: "Super Admin",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Employee Department: ",
          titleData: "INVENTORY",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Address: ",
          titleData: "Saqara",
        ),
        
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Nationality: ",
          titleData: "Egyptian",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "identificationNo: ",
          titleData: "30207160105214",
        ),
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Bank Account: ",
          titleData: "30207160105214",
        ),
        
        SizedBox(
          height: 16,
        ),
        DetailsEmployeeViewBodyItem(
          title: "Salary: ",
          titleData: r"8500$",
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

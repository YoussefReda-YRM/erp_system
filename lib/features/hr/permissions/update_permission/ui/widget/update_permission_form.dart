import 'package:easy_localization/easy_localization.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePermissionForm extends StatefulWidget {
  const UpdatePermissionForm({super.key,required this.getPermissionOfSpecificEmployeeResponse});
  final GetPermissionOfSpecificEmployeeResponse getPermissionOfSpecificEmployeeResponse;

  @override
  State<UpdatePermissionForm> createState() => _UpdatePermissionFormState();
}

class _UpdatePermissionFormState extends State<UpdatePermissionForm> {
  @override
  Widget build(BuildContext context) {
  /*  context.read<UpdatePermissionCubit>().startTimeController.text =
        getPermissionOfSpecificEmployeeResponse.departmentName.toString();

    context.read<UpdateDepartmentCubit>().departmentDescriptionController.text =
        departmentData.description.toString();*/
    return Form(key: context.read<UpdatePermissionCubit>().formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          AppTextFormField(
            controller: context.read<UpdatePermissionCubit>().startTimeController,
            hintText: 'Select Start Time',
            suffixIcon: IconButton(
              onPressed: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {  // Checking if the user selected a time or cancelled
                  final formattedTime = formatTimeOfDay(time);
                  setState(() {
                    context.read<UpdatePermissionCubit>().startTimeController.text = formattedTime;
                  });
                }
              },
              icon: const Icon(
                Icons.access_time,
                color: ColorsApp.primaryColor,
              ),
            ),
            readOnly: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a time';
              }
              return null;  // Validation passed
            },
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            controller: context.read<UpdatePermissionCubit>().endTimeController,
            hintText: 'Select End Time',
            suffixIcon: IconButton(
              onPressed: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {  // Checking if the user selected a time or cancelled
                  final formattedTime = formatTimeOfDay(time);
                  setState(() {
                    context.read<UpdatePermissionCubit>().endTimeController.text = formattedTime;
                  });
                }
              },
              icon: const Icon(
                Icons.access_time,
                color: ColorsApp.primaryColor,
              ),
            ),
            readOnly: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a time';
              }
              return null;  // Validation passed
            },
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            controller: context.read<UpdatePermissionCubit>().dateController,
            hintText: 'Select Date',
            suffixIcon: IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2024).add(
                    const Duration(days: 365),
                  ),
                );
                final formattedDate = DateFormat("yyy-MM-dd").format(date!);
                setState(() {
                  context.read<UpdatePermissionCubit>().dateController.text =
                      formattedDate.toString();
                });
              },
              icon: const Icon(
                Icons.calendar_month_outlined,
                color: ColorsApp.primaryColor,
              ),
            ),
            readOnly: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter date';
              }
            },
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Description',
            keyboardType: TextInputType.emailAddress,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'Please enter description';
              }
            },
            controller: context.read<UpdatePermissionCubit>().descriptionController,
          ),


        ],
      ),
    );
  }
}
String formatTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('HH:mm').format(dateTime);  // "HH:mm" for 24-hour format
}
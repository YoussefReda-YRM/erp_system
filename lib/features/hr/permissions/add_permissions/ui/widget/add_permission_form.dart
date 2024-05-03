import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddPermissionForm extends StatefulWidget {
  const AddPermissionForm({super.key});

  @override
  State<AddPermissionForm> createState() => _AddPermissionFormState();
}

class _AddPermissionFormState extends State<AddPermissionForm> {
  @override
  Widget build(BuildContext context) {
    return Form(key: context.read<AddPermissionCubit>().formKey,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            AppTextFormField(
              controller: context.read<AddPermissionCubit>().startTimeController,
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
                      context.read<AddPermissionCubit>().startTimeController.text = formattedTime;
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
              controller: context.read<AddPermissionCubit>().endTimeController,
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
                      context.read<AddPermissionCubit>().endTimeController.text = formattedTime;
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
              controller: context.read<AddPermissionCubit>().dateController,
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
                    context.read<AddPermissionCubit>().dateController.text =
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
              controller: context.read<AddPermissionCubit>().descriptionController,
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

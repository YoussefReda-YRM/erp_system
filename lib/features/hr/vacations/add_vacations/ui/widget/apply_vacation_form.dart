import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ApplyVacationForm extends StatefulWidget {
  const ApplyVacationForm({super.key});

  @override
  State<ApplyVacationForm> createState() => _ApplyVacationFormState();
}

class _ApplyVacationFormState extends State<ApplyVacationForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ApplyVacationCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<ApplyVacationCubit>().startDateController,
            hintText: 'Start Date',
            suffixIcon: IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050).add(
                    const Duration(days: 365),
                  ),
                );
                final formattedDate = DateFormat("yyy-MM-dd").format(date!);
                setState(() {
                  context.read<ApplyVacationCubit>().startDateController.text =
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
                return 'Please select a start date';
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          AppTextFormField(
            controller: context.read<ApplyVacationCubit>().endDateController,
            hintText: 'End Date',
            suffixIcon: IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050).add(
                    const Duration(days: 365),
                  ),
                );
                final formattedDate = DateFormat("yyy-MM-dd").format(date!);
                setState(() {
                  context.read<ApplyVacationCubit>().endDateController.text =
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
                return 'Please select end date';
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          AppTextFormField(
            maxLines: 5,
            controller:
                context.read<ApplyVacationCubit>().descriptionController,
            hintText: "Reason for vacation",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a reason for vacation';
              }
            },
          ),
        ],
      ),
    );
  }
}

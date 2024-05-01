import 'package:easy_localization/easy_localization.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVacationForm extends StatefulWidget {
  const UpdateVacationForm({super.key,required this.getAllVacationModel});
  final GetAllVacationModel getAllVacationModel;


  @override
  State<UpdateVacationForm> createState() => _UpdateVacationFormState();
}

class _UpdateVacationFormState extends State<UpdateVacationForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpdateVacationCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<UpdateVacationCubit>().startDateController,
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
                  context.read<UpdateVacationCubit>().startDateController.text =
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
            controller: context.read<UpdateVacationCubit>().endDateController,
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
                  context.read<UpdateVacationCubit>().endDateController.text =
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
            context.read<UpdateVacationCubit>().descriptionController,
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

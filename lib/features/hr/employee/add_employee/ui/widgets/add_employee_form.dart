import 'package:erp_system/core/helpers/app_regex.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/employee/add_employee/ui/widgets/custom_intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEmployeeForm extends StatefulWidget {
  const AddEmployeeForm({super.key});

  @override
  State<AddEmployeeForm> createState() => _AddEmployeeFormState();
}

class _AddEmployeeFormState extends State<AddEmployeeForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  final TextEditingController dateContoller = TextEditingController();
  String gender = 'male';

  @override
  // void initState() {
  //   super.initState();
  //   passwordController = context.read<SignupCubit>().passwordController;
  //   setupPasswordControllerListener();
  // }

  // void setupPasswordControllerListener() {
  //   passwordController.addListener(() {
  //     setState(() {
  //       hasLowercase = AppRegex.hasLowerCase(passwordController.text);
  //       hasUppercase = AppRegex.hasUpperCase(passwordController.text);
  //       hasSpecialCharacters =
  //           AppRegex.hasSpecialCharacter(passwordController.text);
  //       hasNumber = AppRegex.hasNumber(passwordController.text);
  //       hasMinLength = AppRegex.hasMinLength(passwordController.text);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: context.read<SignupCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'User Name',
            keyboardType: TextInputType.name,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid user name';
              }
            },
            // controller: context.read<SignupCubit>().nameController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Name',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Email',
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
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            // controller: context.read<SignupCubit>().emailController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            // controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                size: 15,
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            // controller:
            //     context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                size: 15,
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              } else if (value != passwordController.text) {
                return 'The password is not the same';
              }
            },
          ),
          const SizedBox(height: 18),
          const CustomIntlPhoneField(),
          const SizedBox(height: 18),
          AppTextFormField(
            controller: dateContoller,
            hintText: 'Select DOB',
            suffixIcon: IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2050).add(
                    const Duration(days: 365),
                  ),
                );
                final formattedDate = DateFormat("dd-MM-yyy").format(date!);
                setState(() {
                  dateContoller.text = formattedDate.toString();
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
                return 'Please enter an employee job';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          Text(
            "Select Gender",
            style: Styles.font14BlueSemiBold(context),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: ColorsApp.primaryColor,
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: Styles.font14BlueSemiBold(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: ColorsApp.primaryColor,
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    Text(
                      "FeMale",
                      style: Styles.font14BlueSemiBold(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Employee job',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an employee job';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Enter role',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an employee role';
              }
            },
            // controller: context.read<SignupCubit>().roleController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Employee Department',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an employee department';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Address',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an address';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Nationality',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Nationality';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Identification Number',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valide Identification Number';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Bank Account',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valide bank account';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Salary',
            keyboardType: TextInputType.number,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valide Salary';
              }
            },
            // controller: context.read<SignupCubit>().employeeJobController,
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

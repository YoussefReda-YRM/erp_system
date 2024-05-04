import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/helpers/app_regex.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/core/widgets/custom_intl_phone_field.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/get_all_roles_model.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String gender = 'male';

  late GetAllDepartmentResponse _selectedDepartment;
  List<GetAllDepartmentResponse> departments = getAllDepartmentGetIt;

  late GetAllRolesResponse _selectedRole;
  List<GetAllRolesResponse> roles = getAllRolesGetIt;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<AddEmployeeCubit>().passwordController;
    setupPasswordControllerListener();
    _selectedDepartment = departments[0];
    _selectedRole = roles[0];
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<JobPosition>? jobPositions = _selectedDepartment.jobPositions;
    JobPosition selectedJobPosition = jobPositions!.isEmpty
        ? JobPosition(id: 0, jobName: "No Job")
        : jobPositions[0];

    return Form(
      key: context.read<AddEmployeeCubit>().formKey,
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
            controller: context.read<AddEmployeeCubit>().userNameController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            hintText: 'Name',
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
                return 'Please enter a valid name';
              }
            },
            controller: context.read<AddEmployeeCubit>().nameController,
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
            controller: context.read<AddEmployeeCubit>().emailController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            controller: context.read<AddEmployeeCubit>().passwordController,
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
            controller:
                context.read<AddEmployeeCubit>().passwordConfirmationController,
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
          CustomIntlPhoneField(
            phoneController:
                context.read<AddEmployeeCubit>().phoneNumberController,
          ),
          const SizedBox(height: 18),
          AppTextFormField(
            controller: context.read<AddEmployeeCubit>().birthDateController,
            hintText: 'Select DOB',
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
                  context.read<AddEmployeeCubit>().birthDateController.text =
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
                return 'Please enter an employee job';
              }
            },
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
                      value: 'M',
                      groupValue:
                          context.read<AddEmployeeCubit>().genderNotifier.value,
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<AddEmployeeCubit>()
                              .updateGender(value.toString());
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
                      value: 'F',
                      groupValue:
                          context.read<AddEmployeeCubit>().genderNotifier.value,
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<AddEmployeeCubit>()
                              .updateGender(value.toString());
                        });
                      },
                    ),
                    Text(
                      "Female",
                      style: Styles.font14BlueSemiBold(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<GetAllRolesResponse>(
            value: _selectedRole,
            items: roles.map((role) {
              return DropdownMenuItem<GetAllRolesResponse>(
                value: role,
                child: Text(role.roleName!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
                context.read<AddEmployeeCubit>().roleController =
                    _selectedRole.roleName;
              });
            },
            decoration: const InputDecoration(labelText: 'Employee Role'),
            validator: (value) {
              if (value == null) {
                return 'Please select a job position';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<GetAllDepartmentResponse>(
            value: _selectedDepartment,
            items: departments.map((department) {
              return DropdownMenuItem<GetAllDepartmentResponse>(
                value: department,
                child: Text(department.departmentName),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDepartment = value!;
                context.read<AddEmployeeCubit>().employeeDepartmentId =
                    _selectedDepartment.id;
              });
            },
            decoration: const InputDecoration(labelText: 'Department'),
            validator: (value) {
              if (value == null) {
                return 'Please select a department';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<JobPosition>(
            value: selectedJobPosition,
            items: jobPositions.map((job) {
              return DropdownMenuItem<JobPosition>(
                value: job,
                child: Text(job.jobName),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedJobPosition = value!;
                context.read<AddEmployeeCubit>().employeeJobController =
                    selectedJobPosition.jobName.toString();
              });
            },
            decoration: const InputDecoration(labelText: 'Job Position'),
            validator: (value) {
              if (value == null) {
                return 'Please select a Job Position';
              }
              return null;
            },
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
            controller: context.read<AddEmployeeCubit>().addressController,
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
            controller: context.read<AddEmployeeCubit>().nationalityController,
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
            controller:
                context.read<AddEmployeeCubit>().identificationNoController,
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
            controller: context.read<AddEmployeeCubit>().bankAccountController,
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
            controller: context.read<AddEmployeeCubit>().salaryController,
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

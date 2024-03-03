import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_body.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/repos/Add_employee_repo.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  final AddEmployeeRepo _addEmployeeRepo;
  AddEmployeeCubit(this._addEmployeeRepo) : super(AddEmployeeInitial());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController employeeJobController = TextEditingController();
  TextEditingController employeeDepartmentIdController =
      TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController identificationNoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addEmployee() async {
    emit(AddEmployeeLoading());
    final response = await _addEmployeeRepo.addEmployee(
      AddEmployeeRequestBody(
        userName: "YRM15555", //nameController.text,
        email: "yrm@gmail.com", //emailController.text,
        password: r"P@$$w0rd", //passwordController.text,
        confirmPassword: r"P@$$w0rd", //passwordConfirmationController.text,
        employeeJob: "test", //employeeJobController.text,
        employeeDepartmentId: 1,
        role: "HRAdmin", //roleController.text,
        address: "String", //addressController.text,
        birthDate: "2024-02-25", //birthDateController.text,
        gender: "male",
        identificationNo: "222222222222222", // identificationNoController.text,
        name: "string", // nameController.text,
        nationality: "string", // nationalityController.text,
        phoneNumber: "string",
        bankAccount: "string", //bankAccountController.text,
        salary: 12000.5,
      ),
    );
    response.when(
      success: (loginResponse) {
        emit(AddEmployeeSuccess(loginResponse));
      },
      failure: (error) {
        emit(AddEmployeeFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

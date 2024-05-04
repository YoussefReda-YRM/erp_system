import 'package:flutter/src/material/dropdown.dart';

class GetAllDepartmentResponse {
  int id;
  String departmentName;
  String description;
  List<JobPosition>? jobPositions;
  List<Employee>? employees;

  GetAllDepartmentResponse({
    required this.id,
    required this.departmentName,
    required this.description,
    this.jobPositions,
    this.employees,
  });

  factory GetAllDepartmentResponse.fromJson(Map<String, dynamic> json) {
    List<Employee> employees = [];
    if (json['employees'] != null) {
      employees = List<Employee>.from(
          json['employees'].map((e) => Employee.fromJson(e)));
    }

    List<JobPosition> jobPositions = [];
    if (json['jobPositions'] != null) {
      jobPositions = List<JobPosition>.from(
          json['jobPositions'].map((e) => JobPosition.fromJson(e)));
    }

    return GetAllDepartmentResponse(
      id: json['id'],
      departmentName: json['departmentName'],
      description: json['description'],
      jobPositions: jobPositions,
      employees: employees,
    );
  }
}

class Employee {
  String id;
  String userName;
  String? employeeJob;

  Employee({
    required this.id,
    required this.userName,
    this.employeeJob,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json['id'],
        userName: json['userName'],
        employeeJob: json['employeeJob'],
      );
}

class JobPosition {
  int id;
  String jobName;

  JobPosition({
    required this.id,
    required this.jobName,
  });

  factory JobPosition.fromJson(Map<String, dynamic> json) => JobPosition(
        id: json['id'],
        jobName: json['jobName'],
      );

  map(DropdownMenuItem<JobPosition> Function(dynamic job) param0) {}
}

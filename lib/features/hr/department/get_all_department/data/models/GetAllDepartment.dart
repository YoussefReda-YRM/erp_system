class GetAllDepartmentResponse {
  int id;
  String departmentName;
  String description;
  List? jobPositions;
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
    return GetAllDepartmentResponse(
      id: json['id'],
      departmentName: json['departmentName'],
      description: json['description'],
      jobPositions: json['jobPositions'],
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

// class GetAllDepartmentResponse {
//   GetAllDepartmentResponse({
//     this.pageIndex,
//     this.pageSize,
//     this.count,
//     this.data,
//   });

//   GetAllDepartmentResponse.fromJson(dynamic json) {
//     pageIndex = json['pageIndex'];
//     pageSize = json['pageSize'];
//     count = json['count'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(GetAllDepartment.fromJson(v));
//       });
//     }
//   }

//   int? pageIndex;
//   int? pageSize;
//   int? count;
//   List<GetAllDepartment>? data;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['pageIndex'] = pageIndex;
//     map['pageSize'] = pageSize;
//     map['count'] = count;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// class GetAllDepartment {
//   GetAllDepartment({
//     this.id,
//     this.departmentName,
//     this.description,
//     this.jobPositions,
//     this.employees,
//   });

//   GetAllDepartment.fromJson(dynamic json) {
//     id = json['id'];
//     departmentName = json['departmentName'];
//     description = json['description'];
//     if (json['jobPositions'] != null) {
//       jobPositions = [];
//       json['jobPositions'].forEach((v) {
//         jobPositions?.add(JobPosition.fromJson(v));
//       });
//     }
//     if (json['employees'] != null) {
//       employees = [];
//       json['employees'].forEach((v) {
//         employees?.add(Employees.fromJson(v));
//       });
//     }
//   }

//   int? id;
//   String? departmentName;
//   String? description;
//   List<JobPosition>? jobPositions;
//   List<Employees>? employees;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['departmentName'] = departmentName;
//     map['description'] = description;
//     if (jobPositions != null) {
//       map['jobPositions'] = jobPositions?.map((v) => v.toJson()).toList();
//     }
//     if (employees != null) {
//       map['employees'] = employees?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// class Employees {
//   Employees({
//     this.id,
//     this.userName,
//     this.employeeJob,
//   });

//   Employees.fromJson(dynamic json) {
//     id = json['id'];
//     userName = json['userName'];
//     employeeJob = JobPosition.fromJson(json['employeeJob']);
//   }

//   String? id;
//   String? userName;
//   JobPosition? employeeJob;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['userName'] = userName;
//     map['employeeJob'] = employeeJob?.toJson();
//     return map;
//   }
// }

// class JobPosition {
//   JobPosition({
//     this.id,
//     this.positionName,
//   });

//   JobPosition.fromJson(dynamic json) {
//     id = json['id'];
//     positionName = json['positionName'];
//   }

//   String? id;
//   String? positionName;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['positionName'] = positionName;
//     return map;
//   }
// }

class GetAllDepartmentResponse {
  GetAllDepartmentResponse({
    this.pageIndex,
    this.pageSize,
    this.count,
    this.data,
  });

  GetAllDepartmentResponse.fromJson(dynamic json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetAllDepartment.fromJson(v));
      });
    }
  }

  int? pageIndex;
  int? pageSize;
  int? count;
  List<GetAllDepartment>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageIndex'] = pageIndex;
    map['pageSize'] = pageSize;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class GetAllDepartment {
  GetAllDepartment({
    this.id,
    this.departmentName,
    this.jobPositions,
    this.employees,
    this.parentDepartmentId,
    this.parentDepartmentName,
    this.childDepartment,
  });

  GetAllDepartment.fromJson(dynamic json) {
    id = json['id'];
    departmentName = json['departmentName'];
    if (json['jobPositions'] != null) {
      jobPositions = [];
      json['jobPositions'].forEach((v) {
        jobPositions?.add(JobPosition.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = [];
      json['employees'].forEach((v) {
        employees?.add(Employees.fromJson(v));
      });
    }
    parentDepartmentId = json['parentDepartmentId'];
    parentDepartmentName = json['parentDepartmentName'];
    if (json['childDepartment'] != null) {
      childDepartment = [];
      json['childDepartment'].forEach((v) {
        childDepartment?.add(GetAllDepartment.fromJson(v));
      });
    }
  }

  int? id;
  String? departmentName;
  List<JobPosition>? jobPositions;
  List<Employees>? employees;
  dynamic parentDepartmentId;
  dynamic parentDepartmentName;
  List<GetAllDepartment>? childDepartment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['departmentName'] = departmentName;
    if (jobPositions != null) {
      map['jobPositions'] = jobPositions?.map((v) => v.toJson()).toList();
    }
    if (employees != null) {
      map['employees'] = employees?.map((v) => v.toJson()).toList();
    }
    map['parentDepartmentId'] = parentDepartmentId;
    map['parentDepartmentName'] = parentDepartmentName;
    if (childDepartment != null) {
      map['childDepartment'] = childDepartment?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Employees {
  Employees({
    this.id,
    this.userName,
    this.employeeJob,
  });

  Employees.fromJson(dynamic json) {
    id = json['id'];
    userName = json['userName'];
    employeeJob = json['employeeJob'];
  }

  String? id;
  String? userName;
  dynamic employeeJob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['employeeJob'] = employeeJob;
    return map;
  }
}

class JobPosition {
  JobPosition({
    this.id,
    this.positionName,
    // Add other fields if needed
  });

  JobPosition.fromJson(dynamic json) {
    id = json['id'];
    positionName = json['positionName'];
    // Parse other fields if needed
  }

  String? id;
  String? positionName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['positionName'] = positionName;
    // Add other fields if needed
    return map;
  }
}

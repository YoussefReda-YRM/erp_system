class GetAllAccountingEmployeeModel {
  final String? userID;
  final String? name;
  final String? userName;

  GetAllAccountingEmployeeModel({
    this.userID,
    this.name,
    this.userName,
  });

  factory GetAllAccountingEmployeeModel.fromJson(Map<String, dynamic> json) =>
      GetAllAccountingEmployeeModel(
        userID: json['userID'],
        name: json['name'],
        userName: json['username'],
      );
}

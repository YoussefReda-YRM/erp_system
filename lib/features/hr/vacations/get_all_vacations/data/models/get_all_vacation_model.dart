class GetAllVacationModel {
  final int? id;
  final String? employee;
  final String? description;
  final String? start;
  final String? end;
  final int? status;

  GetAllVacationModel({
    this.id,
    this.employee,
    this.description,
    this.start,
    this.end,
    this.status,
  });

  factory GetAllVacationModel.fromJson(Map<String, dynamic> json) =>
      GetAllVacationModel(
        id: json['id'],
        employee: json['employee'],
        description: json['description'],
        start: json['start'],
        end: json['end'],
        status: json['status'],
      );
}

class AddPermissionRequest {
  final String? start;
  final String? end;
  final String? date;
  final String? description;

  AddPermissionRequest({
    this.start,
    this.end,
    this.date,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
      'date': date,
      'description': description,
    };
  }
}

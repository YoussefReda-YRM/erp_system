class AddPermissionRequest {
  final String start;
  final String end;
  final String date;
  final String description;

  AddPermissionRequest({
    required this.start,
    required this.end,
    required this.date,
    required this.description,
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

class ApplyVacationRequest {
  String? startDate;
  String? endDate;
  String? description;

  ApplyVacationRequest({
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'start': startDate,
      'end': endDate,
      'description': description,
    };
  }
}

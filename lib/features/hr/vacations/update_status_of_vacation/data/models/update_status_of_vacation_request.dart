class UpdateStatusOfVacationRequest {
  int? status;

  UpdateStatusOfVacationRequest({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}

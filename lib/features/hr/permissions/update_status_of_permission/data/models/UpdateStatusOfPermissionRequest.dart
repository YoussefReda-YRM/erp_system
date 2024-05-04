class UpdateStatusOfPermissionRequest {
  int? status;

  UpdateStatusOfPermissionRequest({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}

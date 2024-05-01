class UpdateStatusOfPermissionRequest {
  UpdateStatusOfPermissionRequest({
      this.status,});

  UpdateStatusOfPermissionRequest.fromJson(dynamic json) {
    status = json['status'];
  }
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }

}
class UpdateStatusOfScmOrderRequest {
  int? status;

  UpdateStatusOfScmOrderRequest({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}

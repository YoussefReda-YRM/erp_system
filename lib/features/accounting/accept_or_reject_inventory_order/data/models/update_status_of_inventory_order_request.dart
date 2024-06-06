class UpdateStatusOfInventoryOrderRequest {
  int? status;

  UpdateStatusOfInventoryOrderRequest({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}

class GetAllScmOrderStatusResponse {
  final int? orderId;
  final int? status;

  GetAllScmOrderStatusResponse({
    this.orderId,
    this.status,
  });

  factory GetAllScmOrderStatusResponse.fromJson(Map<String, dynamic> json) =>
      GetAllScmOrderStatusResponse(
        orderId: json['orderId'],
        status: json['status'],
      );
}

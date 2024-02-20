class ResponseDeleteCategory {
  int? status;
  String? message;

  ResponseDeleteCategory({
    this.status,
    this.message,
  });

  factory ResponseDeleteCategory.fromJson(Map<String, dynamic> json) {
    return ResponseDeleteCategory(
      status: json['status'],
      message: json['message'],
    );
  }
}

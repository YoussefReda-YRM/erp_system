class ApiErrorModel {
  final List? errors;
  final int? statusCode;
  final String? message;

  ApiErrorModel({
    this.errors,
    this.statusCode,
    required this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        errors: json['errors'] as List?,
        statusCode: json['statusCode'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'errors': errors,
        'statusCode': statusCode,
        'message': message,
      };
}

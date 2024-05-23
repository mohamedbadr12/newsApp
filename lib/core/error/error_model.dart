import '../api/end_point.dart';

class ErrorModel {
  final String status;
  final String code;
  final String message;

  const ErrorModel({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        status: jsonData[ApiKeys.status],
        code: jsonData[ApiKeys.code],
        message: jsonData[ApiKeys.message]);
  }
}

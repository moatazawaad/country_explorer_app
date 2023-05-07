import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;
  final String message;

  const ErrorMessageModel(
      {required this.statusCode,
        required this.statusMessage,
        required this.success,
        required this.message,
      });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
      message: json["message"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,
    statusMessage,
    success,
  ];
}

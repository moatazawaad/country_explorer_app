import 'package:country_explorer/core/utils/app_strings.dart';
import 'package:country_explorer/features/all_countries/domain/entities/postal_code.dart';

class PostalCodeModel extends PostalCode {
  PostalCodeModel({required super.format, required super.regex});

  factory PostalCodeModel.fromJson(Map<String, dynamic> json) =>
      PostalCodeModel(
        format: json['format'] ?? AppStrings.notAvailable,
        regex: json['regex'] ?? AppStrings.notAvailable,
      );
}

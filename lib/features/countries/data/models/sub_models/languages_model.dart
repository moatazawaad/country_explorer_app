import '../../../../../core/utils/app_strings.dart';

class LanguagesModel {
  final String? name;

  const LanguagesModel({required this.name});

  factory LanguagesModel.fromJson(Map<String, dynamic>? json) =>
      LanguagesModel(name: json?.entries.first.value ?? AppStrings.notAvailable);
}


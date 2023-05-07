import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/flags.dart';

class FlagsModel extends Flags {
  FlagsModel({required super.png, required super.svg, required super.alt});

  factory FlagsModel.fromJson(Map<String, dynamic> json) => FlagsModel(
        png: json["png"] ?? AppStrings.notAvailable,
        svg: json["svg"] ?? AppStrings.notAvailable,
        alt: json["alt"] ?? AppStrings.notAvailable,
      );
}

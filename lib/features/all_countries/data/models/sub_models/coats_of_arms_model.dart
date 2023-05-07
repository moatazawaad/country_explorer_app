import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/flags.dart';

class CoatsOfArmsModel extends Flags {
  CoatsOfArmsModel({required super.png, required super.svg});

  factory CoatsOfArmsModel.fromJson(Map<String, dynamic> json) =>
      CoatsOfArmsModel(
        png: json["png"] ?? AppStrings.notAvailable,
        svg: json["svg"] ?? AppStrings.notAvailable,
      );
}

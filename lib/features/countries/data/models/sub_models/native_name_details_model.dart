
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/name_common_official.dart';

class NativeNameDetailsModel extends NameCommonOfficial {
  const NativeNameDetailsModel(
      {required super.common, required super.official});

  factory NativeNameDetailsModel.fromJson(Map<String, dynamic> json) =>
      NativeNameDetailsModel(
        common: json['common'] ?? AppStrings.notAvailable,
        official: json['official'] ?? AppStrings.notAvailable,
      );
}

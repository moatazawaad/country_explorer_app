import 'package:country_explorer/features/all_countries/domain/entities/name_common_official.dart';

import '../../../../../core/utils/app_strings.dart';

class NativeNameDetailsModel extends NameCommonOfficial {
  const NativeNameDetailsModel(
      {required super.common, required super.official});

  factory NativeNameDetailsModel.fromJson(Map<String, dynamic> json) =>
      NativeNameDetailsModel(
        common: json['common'] ?? AppStrings.notAvailable,
        official: json['official'] ?? AppStrings.notAvailable,
      );
}

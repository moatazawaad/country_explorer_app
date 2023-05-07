import 'package:country_explorer/features/all_countries/data/models/sub_models/native_name_model.dart';
import 'package:country_explorer/features/all_countries/domain/entities/name_common_official.dart';

import '../../../../../core/utils/app_strings.dart';

class NameModel extends NameCommonOfficial {
  final NativeNameModel nativeName;

  const NameModel(
      {required super.common,
      required super.official,
      required this.nativeName});

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        common: json['common'] ?? AppStrings.notAvailable,
        official: json['official'] ?? AppStrings.notAvailable,
        nativeName: NativeNameModel.fromJson(json['nativeName']),
  );
}

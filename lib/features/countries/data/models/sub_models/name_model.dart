
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/name_common_official.dart';
import 'native_name_model.dart';

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

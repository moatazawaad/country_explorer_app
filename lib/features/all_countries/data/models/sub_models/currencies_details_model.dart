import 'package:country_explorer/features/all_countries/domain/entities/currencies.dart';

import '../../../../../core/utils/app_strings.dart';

class CurrenciesDetailsModel extends Currencies {
  const CurrenciesDetailsModel({required super.name, required super.symbol});

  factory CurrenciesDetailsModel.fromJson(Map<String, dynamic> json) =>
      CurrenciesDetailsModel(
        name: json['name'] ?? AppStrings.notAvailable,
        symbol: json['symbol'] ?? AppStrings.notAvailable,
      );
}

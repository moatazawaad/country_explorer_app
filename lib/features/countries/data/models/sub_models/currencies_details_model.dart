
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/currencies.dart';

class CurrenciesDetailsModel extends Currencies {
  const CurrenciesDetailsModel({required super.name, required super.symbol});

  factory CurrenciesDetailsModel.fromJson(Map<String, dynamic> json) =>
      CurrenciesDetailsModel(
        name: json['name'] ?? AppStrings.notAvailable,
        symbol: json['symbol'] ?? AppStrings.notAvailable,
      );
}

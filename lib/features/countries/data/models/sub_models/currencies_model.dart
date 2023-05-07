
import 'currencies_details_model.dart';

class CurrenciesModel {
  CurrenciesDetailsModel? currenciesDetailsModel;

  CurrenciesModel({this.currenciesDetailsModel});

  factory CurrenciesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CurrenciesModel(currenciesDetailsModel: null);
    }

    return CurrenciesModel(
      currenciesDetailsModel: json.entries.first.value != null
          ? CurrenciesDetailsModel.fromJson(json.entries.first.value)
          : null,
    );
  }
}

import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';

abstract class ApiConsumer {
  Future<List<CountriesModel>> get(String path, {Map<String, dynamic>? queryParameters});
}
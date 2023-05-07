import 'package:country_explorer/core/api/api_consumer.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../domain/usecases/search_countries_name_usecase.dart';

abstract class CountryRemoteDatasource {
  Future<List<CountriesModel>> getAllCountries();

  Future<List<CountriesModel>> searchCountriesByName(NameParameters params);
}

class CountryRemoteDatasourceImpl extends CountryRemoteDatasource {
  final ApiConsumer apiConsumer;

  CountryRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<List<CountriesModel>> getAllCountries() async {
    final response = await apiConsumer.get(EndPoints.allCountries);
    return List<CountriesModel>.from(response);
  }

  // @override
  // Future<List<CountriesModel>> getAllCountries() async {
  //   final response = await Dio().get(EndPoints.allCountries);
  //   if (response.statusCode == 200) {
  //     return List<CountriesModel>.from(
  //         (response.data).map((e) => CountriesModel.fromJson(e)));
  //   } else {
  //     throw ServerException(
  //         errorMessageModel: ErrorMessageModel.fromJson(response.data));
  //   }
  // }

  @override
  Future<List<CountriesModel>> searchCountriesByName(NameParameters params) async {
    final response = await apiConsumer.get(EndPoints.searchByName(params.name));
    return List<CountriesModel>.from(response);
  }

  // @override
  // Future<List<CountriesModel>> searchCountriesByName(
  //     NameParameters params) async {
  //   final response = await Dio().get(EndPoints.searchByName(params.name));
  //   print(response.data);
  //   if (response.statusCode == 200) {
  //     return List<CountriesModel>.from((response.data)
  //         .map((e) => CountriesModel.fromJson(e)));
  //   } else {
  //     throw ServerException(
  //         errorMessageModel: ErrorMessageModel.fromJson(response.data));
  //   }
  // }
}

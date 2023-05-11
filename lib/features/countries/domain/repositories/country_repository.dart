import 'package:country_explorer/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/countries_model.dart';
import '../usecases/search_countries_name_usecase.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountriesModel>>> getAllCountries();

  Future<Either<Failure, List<CountriesModel>>> searchCountriesByName(
      NameParameters params);
}

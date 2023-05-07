import 'package:country_explorer/core/error/full_failure.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:dartz/dartz.dart';

import '../usecases/search_countries_name_usecase.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountriesModel>>> getAllCountries();

  Future<Either<Failure, List<CountriesModel>>> searchCountriesByName(
      NameParameters params);
}

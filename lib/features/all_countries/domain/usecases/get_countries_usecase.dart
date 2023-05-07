import 'package:country_explorer/core/error/full_failure.dart';
import 'package:country_explorer/core/usecases/usecases.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:country_explorer/features/all_countries/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountriesUseCase implements UseCase<List<CountriesModel>, NoParameters> {
  final CountryRepository countryRepository;

  GetCountriesUseCase({required this.countryRepository});

  @override
  Future<Either<Failure, List<CountriesModel>>> call(NoParameters params) async {
    return await countryRepository.getAllCountries();
  }
}
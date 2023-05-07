import 'package:country_explorer/core/error/full_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/countries_model.dart';
import '../repositories/country_repository.dart';

class SearchCountriesNameUseCase implements UseCase<List<CountriesModel>, NameParameters> {
  final CountryRepository countryRepository;

  SearchCountriesNameUseCase({required this.countryRepository});

  @override
  Future<Either<Failure, List<CountriesModel>>> call(NameParameters params) async {
    return await countryRepository.searchCountriesByName(params);
  }
}

class NameParameters extends Equatable {
  final String name;

  const NameParameters(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

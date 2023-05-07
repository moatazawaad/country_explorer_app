import 'package:country_explorer/core/error/full_failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/full_exception.dart';
import '../../../../core/network/remote/network_info.dart';
import '../../domain/repositories/country_repository.dart';
import '../../domain/usecases/search_countries_name_usecase.dart';
import '../datasource/country_remote_datasource.dart';
import '../models/countries_model.dart';

class CountryRepositoryImpl extends CountryRepository {
  final NetworkInfo networkInfo;
  final CountryRemoteDatasource countryRemoteDatasource;

  CountryRepositoryImpl(
      {required this.networkInfo, required this.countryRemoteDatasource});

  @override
  Future<Either<Failure, List<CountriesModel>>> getAllCountries() async {
    try {
      final result = await countryRemoteDatasource.getAllCountries();
      return Right(result);
    } on ServerFullException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CountriesModel>>> searchCountriesByName(
      NameParameters params) async {
    try {
      final result =
          await countryRemoteDatasource.searchCountriesByName(params);
      return Right(result);
    } on ServerFullException {
      return Left(ServerFailure());
    }
  }
}

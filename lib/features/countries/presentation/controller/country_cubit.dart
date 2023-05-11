import 'package:bloc/bloc.dart';
import 'package:country_explorer/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/countries_model.dart';
import '../../domain/usecases/get_countries_usecase.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final GetCountriesUseCase countriesUseCase;

  static CountryCubit get(context) => BlocProvider.of(context);


  CountryCubit(this.countriesUseCase,) : super(CountryInitial());


  Future<void> getCountries() async {
    emit(CountryLoading());
    Either<Failure, List<CountriesModel>> response = await countriesUseCase(NoParameters());
    emit(response.fold(
            (failure) => CountryError(msg: _mapFailureToMsg(failure)),
            (country) => CountrySuccess(country: country)));
  }


  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server failure';

      default:
        return 'unexpected error';
    }
  }
}

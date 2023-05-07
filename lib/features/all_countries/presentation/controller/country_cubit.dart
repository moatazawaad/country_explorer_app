import 'package:bloc/bloc.dart';
import 'package:country_explorer/core/usecases/usecases.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/full_failure.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../domain/usecases/get_countries_usecase.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final GetCountriesUseCase countriesUseCase;
  // final SearchCountriesNameUseCase searchCountriesNameUseCase;

  static CountryCubit get(context) => BlocProvider.of(context);


  CountryCubit(this.countriesUseCase,) : super(CountryInitial());


  Future<void> getCountries() async {
    emit(CountryLoading());
    Either<Failure, List<CountriesModel>> response = await countriesUseCase(NoParameters());
    emit(response.fold(
            (failure) => CountryError(msg: _mapFailureToMsg(failure)),
            (country) => CountrySuccess(country: country)));
  }

  // Future<void> searchCountriesName(String? name) async {
  //   emit(CountryLoading());
  //   Either<Failure, List<CountriesModel>> response = await searchCountriesNameUseCase(NameParameters(name!));
  //   emit(response.fold(
  //           (failure) => CountryError(msg: _mapFailureToMsg(failure)),
  //           (country) => CountrySuccess(country: country)));
  // }


  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server failure';
      // case CacheFailure:
      //   return 'cache failure';

      default:
        return 'unexpected error';
    }
  }

  // bool isDark = false;
  //
  //
  // void changeAppTheme({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(ChangeAppThemeState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
  //       emit(ChangeAppThemeState());
  //     });
  //   }
  // }
}

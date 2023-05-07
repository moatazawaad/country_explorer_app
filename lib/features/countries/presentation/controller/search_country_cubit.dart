import 'package:bloc/bloc.dart';
import 'package:country_explorer/core/error/full_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/countries_model.dart';
import '../../domain/usecases/search_countries_name_usecase.dart';

part 'search_country_state.dart';

class SearchCountryCubit extends Cubit<SearchCountryState> {
   final SearchCountriesNameUseCase searchCountriesNameUseCase;
  SearchCountryCubit(this.searchCountriesNameUseCase) : super(SearchCountryInitial());

   static SearchCountryCubit get(context) => BlocProvider.of(context);

   Future<void> searchCountriesName(String? text) async {
     emit(SearchCountryLoading());
     Either<Failure, List<CountriesModel>> response = await searchCountriesNameUseCase(NameParameters(text!));
     emit(response.fold(
             (failure) => SearchCountryError(msg: _mapFailureToMsg(failure)),
             (country) => SearchCountrySuccess(country: country)));
   }


   String _mapFailureToMsg(Failure failure) {
     switch (failure.runtimeType) {
       case ServerFailure:
         return 'server failure';
       case CacheFailure:
         return 'cache failure';

       default:
         return 'unexpected error';
     }
   }

}



part of 'search_country_cubit.dart';

@immutable
abstract class SearchCountryState extends Equatable {
  const SearchCountryState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class SearchCountryInitial extends SearchCountryState {}

class SearchCountryLoading extends SearchCountryState {}

class SearchCountryError extends SearchCountryState {
  final String msg;

  const SearchCountryError({required this.msg});

  @override
  List<Object> get props => [msg];
}

class SearchCountrySuccess extends SearchCountryState {
  final List<CountriesModel> country;

  const SearchCountrySuccess({required this.country});

  // final List<CountriesModel> country;
  //
  // SearchCountrySuccess(this.country);

  @override
  List<Object> get props => [country];
}


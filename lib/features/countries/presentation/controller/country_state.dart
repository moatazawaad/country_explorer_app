part of 'country_cubit.dart';

@immutable
abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountrySuccess extends CountryState {
  final List<CountriesModel> country;

  const CountrySuccess({required this.country});

  @override
  List<Object> get props => [country];
}

class CountryError extends CountryState {
  final String msg;

  const CountryError({required this.msg});

  @override
  List<Object> get props => [msg];
}

import 'package:country_explorer/features/all_countries/data/datasource/country_remote_datasource.dart';
import 'package:country_explorer/features/all_countries/data/repositories/country_repository_impl.dart';
import 'package:country_explorer/features/all_countries/domain/repositories/country_repository.dart';
import 'package:country_explorer/features/all_countries/domain/usecases/get_countries_usecase.dart';
import 'package:country_explorer/features/all_countries/presentation/controller/app_cubit.dart';
import 'package:country_explorer/features/all_countries/presentation/controller/country_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/remote/network_info.dart';
import 'features/all_countries/domain/usecases/search_countries_name_usecase.dart';
import 'features/all_countries/presentation/controller/search_country_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<CountryCubit>(() => CountryCubit(getIt()));
  getIt.registerLazySingleton<AppCubit>(()=> AppCubit());
  getIt.registerLazySingleton<SearchCountryCubit>(
      () => SearchCountryCubit(getIt()));
  getIt.registerLazySingleton<GetCountriesUseCase>(
      () => GetCountriesUseCase(countryRepository: getIt()));
  getIt.registerLazySingleton<SearchCountriesNameUseCase>(
      () => SearchCountriesNameUseCase(countryRepository: getIt()));
  getIt.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(
      networkInfo: getIt(), countryRemoteDatasource: getIt()));
  getIt.registerLazySingleton<CountryRemoteDatasource>(
      () => CountryRemoteDatasourceImpl(apiConsumer: getIt()));
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() =>Dio());

}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 20);
  dio.options.receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}

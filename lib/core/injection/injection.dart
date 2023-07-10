import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/countries/data/datasource/country_remote_datasource.dart';
import '../../features/countries/data/repositories/country_repository_impl.dart';
import '../../features/countries/domain/repositories/country_repository.dart';
import '../../features/countries/domain/usecases/get_countries_usecase.dart';
import '../../features/countries/domain/usecases/search_countries_name_usecase.dart';
import '../../features/countries/presentation/controller/app_theme_cubit.dart';
import '../../features/countries/presentation/controller/country_cubit.dart';
import '../../features/countries/presentation/controller/search_country_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../network/remote/network_info.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<CountryCubit>(() => CountryCubit(getIt()));
  getIt.registerLazySingleton<AppThemeCubit>(() => AppThemeCubit());
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
  getIt.registerLazySingleton(() => Dio());
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

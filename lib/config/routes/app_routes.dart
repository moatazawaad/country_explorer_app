import 'package:country_explorer/features/all_countries/presentation/screens/country_details_screen.dart';
import 'package:country_explorer/features/all_countries/presentation/screens/search_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/all_countries/data/models/countries_model.dart';
import '../../features/all_countries/presentation/controller/country_cubit.dart';
import '../../features/all_countries/presentation/screens/all_coutries_screen.dart';
import '../../features/all_countries/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../injection.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/homeScreen';
  static const String allCountriesScreen = '/allCountriesScreen';
  static const String countryDetails = '/countryDetails';
  static const String searchNameScreen = '/searchNameScreen';
}

/// on generate route better for all projects specially for big one
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return  HomeScreen();
        });

      case Routes.allCountriesScreen:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => getIt<CountryCubit>()..getCountries()),
            child: const AllCountriesScreen(),
          );
        }));

      case Routes.searchNameScreen:
        return MaterialPageRoute(builder: (context) {
          return SearchNameScreen();
        });

      case Routes.countryDetails:
        final country = routeSettings.arguments as CountriesModel;
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => getIt<CountryCubit>()),
            child:  CountryDetailsScreen(country: country),
          );
        }));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('no route found'),
              ),
            )));
  }
}

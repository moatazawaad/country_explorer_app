import 'package:country_explorer/core/widget/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_strings.dart';
import '../../features/countries/data/models/countries_model.dart';
import '../../features/countries/presentation/components/my_app_bar.dart';
import '../../features/countries/presentation/controller/country_cubit.dart';
import '../../features/countries/presentation/screens/all_coutries_screen.dart';
import '../../features/countries/presentation/screens/country_details_screen.dart';
import '../../features/countries/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../injection.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/homeScreen';
  static const String allCountriesScreen = '/allCountriesScreen';
  static const String countryDetails = '/countryDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });

      case Routes.allCountriesScreen:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => getIt<CountryCubit>()..getCountries()),
            child: const AllCountriesScreen(),
          );
        }));

      case Routes.countryDetails:
        final country = routeSettings.arguments as CountriesModel;
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => getIt<CountryCubit>()),
            child: CountryDetailsScreen(country: country),
          );
        }));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) =>  Scaffold(
              appBar: MyAppBar(showThemeButton: false,),
          body: ErrorScreen(context,text: AppStrings.wrong, text2: AppStrings.noRouteFound),
            )));
  }
}

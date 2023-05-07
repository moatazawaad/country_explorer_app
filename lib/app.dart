import 'package:country_explorer/config/themes/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/thene_data_dark.dart';
import 'core/utils/app_strings.dart';
import 'features/countries/presentation/controller/app_cubit.dart';
import 'injection.dart';

class CountryExplorer extends StatelessWidget {
  const CountryExplorer({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AppCubit>()..changeAppTheme(fromShared: isDark),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: getThemeDataLight(),
            darkTheme: getThemeDataDark(),
            themeMode: AppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            // themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}

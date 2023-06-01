import 'package:country_explorer/core/utils/assets_manager.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/features/countries/presentation/components/countries_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/no_connection_screen.dart';
import '../../data/models/countries_model.dart';
import '../components/my_app_bar.dart';
import '../controller/country_cubit.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  getAllCountries() => BlocProvider.of<CountryCubit>(context).getCountries();

  @override
  void initState() {
    super.initState();
    getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    List<String> countryNameToExclude = ['Israel', 'Antarctica'];
    List<CountriesModel> countries = [];
    List<CountriesModel> filteredCountries = [];

    return BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
      if (state is CountrySuccess) countries = state.country;
      filteredCountries = countries
          .where(
              (country) => !countryNameToExclude.contains(country.name.common))
          .toList();
      return Scaffold(
        appBar: MyAppBar(
          showThemeButton: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state is CountrySuccess)
              Expanded(
                child: CountriesGrid(context, filteredCountries),
              ),
            if (state is CountryLoading)
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: Image.asset(
                    GifAssets.spinningGlobe640,
                    height: context.height / 3,
                  ),
                ),
              ),
            if (state is CountryError)
              NoConnectionScreen(
                onPress: () {
                  getAllCountries();
                },
              ),
          ],
        ),
      );
    });
  }
}

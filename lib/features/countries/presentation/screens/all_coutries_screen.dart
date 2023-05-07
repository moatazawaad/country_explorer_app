import 'package:country_explorer/core/utils/asstes_manager.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widget/no_connection_screen.dart';
import '../../data/models/countries_model.dart';
import '../components/app_bar.dart';
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
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  // crossAxisSpacing: 10.0,
                  // mainAxisSpacing: 5.0,
                  // first is width / second is height
                  childAspectRatio: 1 / 0.85,
                  children: List.generate(filteredCountries.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.countryDetails,
                              arguments: filteredCountries[index]);
                        },
                        child: Material(
                          elevation: 20,
                          color: Theme.of(context).hintColor,
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: GifAssets.spinningGlobe640,
                                    image: filteredCountries[index].flags.png,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              // SizedBox(height: context.height * 0.01,),
                              Text(
                                filteredCountries[index].name.common,
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
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

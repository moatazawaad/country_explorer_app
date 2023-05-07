import 'package:country_explorer/core/utils/asstes_manager.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:country_explorer/features/all_countries/presentation/components/app_bar.dart';
import 'package:country_explorer/features/all_countries/presentation/controller/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widget/no_connection_screen.dart';

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
    List<String> countryNameToExclude = [
      'Israel',
      'Antarctica'
    ]; // the country name you want to exclude

    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {
        // if (state is CountryError) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text("Sorry, Please try again later")),
        //   );
        // }
      },
      builder: (context, state) {
        if (state is CountrySuccess) {
          List<CountriesModel> countries = state.country;
          List<CountriesModel> filteredCountries = countries
              .where((country) =>
                  !countryNameToExclude.contains(country.name.common))
              .toList();
          return Scaffold(
            appBar: MyAppBar(showLeadingIcon: false,),
            body: GridView.count(
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
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: FadeInImage.assetNetwork(
                              placeholder: GifAssets.spinningGlobe,
                              image: filteredCountries[index].flags.png,
                              height: context.height / 7,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // SizedBox(height: context.height * 0.01,),
                          Text(
                            filteredCountries[index].name.common,
                            style: Theme.of(context).textTheme.bodySmall,
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
          );
        } else if (state is CountryLoading) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Image.asset(
                GifAssets.spinningGlobe,
                height: context.height / 3,
              ),
            ),
          );
        } else {
          return NoConnectionScreen(onPress: () {getAllCountries();},);
        }
      },
    );
  }
}

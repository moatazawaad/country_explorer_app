import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:country_explorer/features/all_countries/presentation/controller/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asstes_manager.dart';
import '../../../../core/utils/format_population.dart';
import '../../../../web_view_screen.dart';
import '../components/app_bar.dart';

class CountryDetailsScreen extends StatelessWidget {
  CountryDetailsScreen({Key? key, required this.country}) : super(key: key);
  final CountriesModel country;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar:  MyAppBar(showLeadingIcon: false,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    country.name.common.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Latitude: ${country.latitudeLongitude?.join(', Longitude: ') ?? AppStrings.notAvailable}',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Material(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(12),
                      child: FadeInImage.assetNetwork(
                        placeholder: GifAssets.spinningGlobe,
                        image: country.flags.png,
                        height: context.height / 5,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(width: 2, color: Theme.of(context).primaryColor)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          width: double.infinity,
                          child: Text(
                            AppStrings.nativeName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(AppStrings.official,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,),
                        Text(country.name.official.toString(),
                            textAlign: TextAlign.center,
                            // softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(AppStrings.common,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,),
                        Text(country.name.common.toString(),
                            textAlign: TextAlign.center,
                            // softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.altOfSpelling,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(country.altSpellings?.join(',') ?? AppStrings.notAvailable,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.capital,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            country.capital?.join(', ') ??
                                AppStrings.notAvailable,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text('Latitude: ${country.capitalInfo.latitudeLongitude?.join(AppStrings.longitude) ?? AppStrings.notAvailable}',
                            style: Theme.of(context).textTheme.bodySmall,                     textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.language,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(country.languages.name.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.currency,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            country
                                .currencies.currenciesDetailsModel?.name
                                .toString() ?? AppStrings.notAvailable,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(
                            country
                                .currencies.currenciesDetailsModel?.symbol
                                .toString() ?? AppStrings.notAvailable,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.region,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(country.region.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.subRegion,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(country.subRegion.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.area,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            '${IntUtils.formatInt(country.area!.toInt())} Square Kilometers',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.borders,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            country.borders?.join(', ') ??
                                AppStrings.notAvailable,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.population,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          IntUtils.formatInt(country.population?.toInt()),
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.startOfWeek,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          country.startOfWeek.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              width: context.width * 0.5,
                              child: Text(
                                AppStrings.map,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WebViewScreen(
                                      url: country.maps.googleMaps,
                                    ),
                              ),
                            );
                          },
                          child: Text(AppStrings.browseTheLocation),),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

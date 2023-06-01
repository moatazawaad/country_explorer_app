import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/core/web_view/web_view_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/format_population.dart';
import '../../data/models/countries_model.dart';

Widget CountryDetailsColumn(BuildContext context, CountriesModel country) =>
    Column(
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          AppStrings.official,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(country.name.official.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
        Text(
          AppStrings.common,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(country.name.common.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
          country.altSpellings?.join(',') ?? AppStrings.notAvailable,
          style: Theme.of(context).textTheme.bodyLarge,
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
                style: Theme.of(context).textTheme.titleLarge,
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
        Text(country.capital?.join(', ') ?? AppStrings.notAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
        Text(
          'Latitude: ${country.capitalInfo.latitudeLongitude?.join(AppStrings.longitude) ?? AppStrings.notAvailable}',
          style: Theme.of(context).textTheme.bodyLarge,
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
                AppStrings.language,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
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
          country.languages.name.toString(),
          style: Theme.of(context).textTheme.bodyLarge,
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
                style: Theme.of(context).textTheme.titleLarge,
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
            country.currencies.currenciesDetailsModel?.name.toString() ??
                AppStrings.notAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
        Text(
            country.currencies.currenciesDetailsModel?.symbol.toString() ??
                AppStrings.notAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
        Text('${IntUtils.formatInt(country.area!.toInt())} Square Kilometers',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
        Text(country.borders?.join(', ') ?? AppStrings.notAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
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
                style: Theme.of(context).textTheme.titleLarge,
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
          style: Theme.of(context).textTheme.bodyLarge,
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
                style: Theme.of(context).textTheme.titleLarge,
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
          style: Theme.of(context).textTheme.bodyLarge,
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
                AppStrings.coatOfArms,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            child: FadeInImage.assetNetwork(
              placeholder: GifAssets.spinningGlobe640,
              image: country.coatsOfArms.png,
              height: context.height / 5,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
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
                style: Theme.of(context).textTheme.titleLarge,
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
                builder: (BuildContext context) => WebViewScreen(
                  url: country.maps.googleMaps,
                ),
              ),
            );
          },
          child: Text(
            AppStrings.fullScreen,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IgnorePointer(
              ignoring: true,
              child: WebViewScreen(url: country.maps.googleMaps)),
        ),
      ],
    );

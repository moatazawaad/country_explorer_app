import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/features/countries/data/models/countries_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import 'country_details_column.dart';

Widget CountryDetailsBody(BuildContext context, CountriesModel country) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              country.name.common.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Latitude: ${country.latitudeLongitude?.join(', Longitude: ') ?? AppStrings.notAvailable}',
              style: Theme.of(context).textTheme.bodyLarge,
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
                child: FadeInImage.assetNetwork(
                  placeholder: GifAssets.spinningGlobe640,
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
            Text(
              country.flags.alt.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: CountryDetailsColumn(context, country),
            ),
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../data/models/countries_model.dart';

Widget CountriesGrid(
        BuildContext context, List<CountriesModel> filteredCountries) =>
    GridView.count(
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
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
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 12,
                      shadowColor: AppColors.grey,
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: GifAssets.spinningGlobe640,
                          image: filteredCountries[index].flags.png,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(ImageAssets.imageError);
                          },
                        ),
                      ),
                    ),
                  ),
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
    );

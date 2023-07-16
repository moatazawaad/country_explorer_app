import 'package:country_explorer/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_hex_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widget/error_screen.dart';
import '../../../../core/widget/no_connection_screen.dart';
import '../../data/models/countries_model.dart';
import '../controller/search_country_cubit.dart';
import 'countries_grid.dart';
import 'my_elevated_button.dart';

List<String> countryNameToExclude = ['Israel'];
List<CountriesModel> country = [];
List<CountriesModel> filteredCountries = [];

Widget HomeScreenBody(
        BuildContext context,
        List<CountriesModel> country,
        bool isConnected,
        FocusNode focusNode,
        TextEditingController searchController) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Image.asset(
            ImageAssets.galaxyMap,
            width: double.infinity,
            height: context.height / 3,
            fit: BoxFit.contain,
          ),
          MyElevatedButton(
            context,
            text: AppStrings.browseAllCountries,
            onPressed: () {
              searchController.clear();
              country.clear();
              Navigator.pushNamed(context, Routes.allCountriesScreen);
            },
          ),
          BlocProvider(
            create: (context) => getIt<SearchCountryCubit>(),
            child: BlocBuilder<SearchCountryCubit, SearchCountryState>(
              builder: (context, state) {
                if (state is SearchCountrySuccess) country = state.country;
                filteredCountries = country
                    .where((country) =>
                        !countryNameToExclude.contains(country.name.common))
                    .toList();
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onSubmitted: (String? text) {
                          if (text != null && text.isNotEmpty) {
                            String message = text.trim();
                            SearchCountryCubit.get(context)
                                .searchCountriesName(message);
                          }
                        },
                        focusNode: focusNode,
                        controller: searchController,
                        autofillHints: [AutofillHints.countryName],
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.search,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          hintText: AppStrings.searchHintText,
                          filled: true,
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (searchController.text.isNotEmpty) {
                                String message = searchController.text.trim();
                                SearchCountryCubit.get(context)
                                    .searchCountriesName(message);
                              }
                            },
                            icon: Icon(
                              Icons.search,
                              color: AppHexColors.darkBlue,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.searchNote,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          if (state is SearchCountrySuccess &&
                              country.isNotEmpty &&
                              isConnected == true &&
                              (searchController.text.contains(AppStrings.Isr) ||
                                  searchController.text
                                      .contains(AppStrings.isr)))
                            InkWell(
                              child: Text(
                                AppStrings.palestineCorrection,
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                    decoration: TextDecoration.none),
                              ),
                              onTap: () {
                                searchController.text = AppStrings.palestine;
                                SearchCountryCubit.get(context)
                                    .searchCountriesName(AppStrings.palestine);
                              },
                            ),
                        ],
                      ),
                      if (state is SearchCountryLoading)
                        Container(
                          child: Center(
                            child: Image.asset(
                              GifAssets.spinningGlobe640,
                              height: context.height / 3,
                            ),
                          ),
                        ),
                      if (state is SearchCountrySuccess &&
                          country.isNotEmpty &&
                          isConnected == true)
                        CountriesGrid(context, filteredCountries),
                      if (isConnected == false)
                        NoConnectionScreen(
                          onPress: () {
                            String? text = searchController.text.trim();
                            if (text.isNotEmpty) {
                              SearchCountryCubit.get(context)
                                  .searchCountriesName(text);
                            }
                          },
                        ),
                      if (state is SearchCountryError && isConnected == true)
                        ErrorScreen(context,
                            text: AppStrings.countryNotFound(
                                searchController.text),
                            text2: AppStrings.tryAnotherCountry),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

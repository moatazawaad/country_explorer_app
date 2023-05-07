import 'package:country_explorer/config/routes/app_routes.dart';
import 'package:country_explorer/core/utils/app_hex_colors.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:country_explorer/core/widget/no_connection_screen.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:country_explorer/features/all_countries/presentation/components/app_bar.dart';
import 'package:country_explorer/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asstes_manager.dart';
import '../../../../core/widget/error_screen.dart';
import '../controller/search_country_cubit.dart';
import 'package:connectivity/connectivity.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();

    // listen for changes in connectivity status
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  void dispose() {
    _focusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CountriesModel> country = [];
    return Scaffold(
      appBar: MyAppBar(showLeadingIcon: true),
      // drawer: MyDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              ImageAssets.galaxyMap,
              width: double.infinity,
              height: context.height / 3,
              fit: BoxFit.contain,
            ),
            ElevatedButton(
              onPressed: () {
                searchController.clear();
                //  SearchCountryCubit.get(context).close();
                country.clear();
                Navigator.pushNamed(context, Routes.allCountriesScreen);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                AppStrings.browseAllCountries,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            BlocProvider(
              create: (context) => getIt<SearchCountryCubit>(),
              child: BlocBuilder<SearchCountryCubit, SearchCountryState>(
                builder: (context, state) {
                  if (state is SearchCountrySuccess) country = state.country;
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Padding(
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
                            focusNode: _focusNode,
                            controller: searchController,
                            autofillHints: [AutofillHints.countryName],
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: 'Type a word to search',
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: Colors.grey[300],
                              hintStyle: const TextStyle(
                                color: AppHexColors.darkBlue,
                                fontSize: 14,
                              ),
                              suffixIcon: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      if (searchController.text.isNotEmpty) {
                                        String message =
                                            searchController.text.trim();
                                        SearchCountryCubit.get(context)
                                            .searchCountriesName(message);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      color: AppHexColors.darkBlue,
                                    ),
                                  )),
                            ),
                          ),
                          Text(
                            '*Note: Use english language for search',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
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
                              _isConnected == true)
                            GridView.count(
                              shrinkWrap: true,
                              primary: false,
                              physics: const BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 0.85,
                              children: List.generate(country.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.countryDetails,
                                          arguments: country[index]);
                                    },
                                    child: Material(
                                      elevation: 20,
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    GifAssets.spinningGlobe640,
                                                image: country[index].flags.png,
                                                // height: context.height /7,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: context.height * 0.01,),
                                          Text(
                                            country[index].name.common,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
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
                          if (state is SearchCountryError &&
                              _isConnected == false)
                            NoConnectionScreen(
                              onPress: () {
                                String? text = searchController.text.trim();
                                if (text.isNotEmpty) {
                                  SearchCountryCubit.get(context)
                                      .searchCountriesName(text);
                                }
                              },
                            ),
                          if (state is SearchCountryError &&
                              _isConnected == true)
                            ErrorScreen(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

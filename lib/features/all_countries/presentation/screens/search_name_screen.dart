import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../data/models/countries_model.dart';
import '../controller/search_country_cubit.dart';

class SearchNameScreen extends StatelessWidget {
  SearchNameScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CountriesModel> country = [];
    return BlocProvider(
      create: (context) =>
          getIt<SearchCountryCubit>(),
      child: BlocConsumer<SearchCountryCubit, SearchCountryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SearchCountrySuccess) {
            country = (state).country;
          }
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      enabled: true,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onFieldSubmitted: (String? text) {
                        SearchCountryCubit.get(context).searchCountriesName(text);
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Write a country name',
                        hintStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        prefixIcon: const Icon(Icons.search,),
                        suffixIcon: const Icon(Icons.coronavirus_rounded) !=
                            null
                            ? IconButton(onPressed: () {}, icon:
                        const Icon(Icons.ring_volume))
                            : null,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (state is SearchCountryLoading)
                      const Center(
                          child: CircularProgressIndicator()),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchCountrySuccess && country.isNotEmpty)
                      Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          // crossAxisSpacing: 10.0,
                          // mainAxisSpacing: 5.0,
                          // first is width / second is height
                          childAspectRatio: 1 / 0.9,
                          children: List.generate(country.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                // onTap:() {
                                //   navigateTo(context, const HomeScreen());
                                // },
                                // onHover: (value) {
                                //   if (value) {
                                //     navigateTo(context, const HomeScreen());
                                //   }
                                //},

                                child: Material(
                                  elevation: 20,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/gif/red_dot.gif',
                                          image: country[index].flags.png,
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(country[index].name.common),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

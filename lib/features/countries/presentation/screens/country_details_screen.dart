import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/countries_model.dart';
import '../components/country_details_body.dart';
import '../components/my_app_bar.dart';
import '../controller/country_cubit.dart';

class CountryDetailsScreen extends StatelessWidget {
  CountryDetailsScreen({Key? key, required this.country}) : super(key: key);
  final CountriesModel country;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            showThemeButton: false,
          ),
          body: CountryDetailsBody(context, country),
        );
      },
    );
  }
}

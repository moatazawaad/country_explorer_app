import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:country_explorer/features/all_countries/presentation/controller/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CountriesModel> country = [];
    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {
        if (state is CountryError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sorry, Please try again later")),
          );
        }
      },
      builder: (context, state) {
        if (state is CountrySuccess) {
          country = (state).country;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Test"),
            ),
            body: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(
                    country[index].name.common.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(country[index].name.nativeName.nativeNameDetails?.common.toString() ?? 'Oops',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black
                    ),
                  ),
                  // subtitle: Text( NativeNameModel == null ? 'Oops!' :
                  // country[index].name.nativeName.nativeNameDetails!.official.toString(),
                  //   style: const TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black
                  //   ),
                  // ),
                  leading: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)),
                    // child: Text(
                    //   viewModel.listDataModel[index].id.toString(),
                    // ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 0.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: country.length,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}

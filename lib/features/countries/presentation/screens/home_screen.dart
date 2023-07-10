import 'package:connectivity/connectivity.dart';
import 'package:country_explorer/features/countries/presentation/components/home_screen_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/countries_model.dart';
import '../components/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final focusNode = FocusNode();
  bool isConnected = true;

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  void dispose() {
    focusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CountriesModel> country = [];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MyAppBar(showThemeButton: true),
        body: HomeScreenBody(
            context, country, isConnected, focusNode, searchController),
      ),
    );
  }
}

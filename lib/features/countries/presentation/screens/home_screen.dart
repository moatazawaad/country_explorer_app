import 'package:connectivity/connectivity.dart';
import 'package:country_explorer/core/utils/app_hex_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/models/countries_model.dart';
import '../components/home_screen_body.dart';
import '../components/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final focusNode = FocusNode();
  bool isConnected = false;

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppHexColors.dark2,
        title: Text(
          AppStrings.quite,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        content: Text(
          AppStrings.quiteAppText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppHexColors.darkBlue)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  AppStrings.cancel,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Spacer(),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.redAccent),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(
                  AppStrings.quite,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          )
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    List<CountriesModel> country = [];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: MyAppBar(showThemeButton: true),
          body: HomeScreenBody(
            context,
            country,
            isConnected,
            focusNode,
            searchController,
          ),
        ),
      ),
    );
  }
}

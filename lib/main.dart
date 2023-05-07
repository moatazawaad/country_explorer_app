import 'package:bloc/bloc.dart';
import 'package:country_explorer/bloc_observer.dart';
import 'package:country_explorer/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  initGetIt();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark') ?? false;
  runApp(CountryExplorer(isDark: isDark,));
}



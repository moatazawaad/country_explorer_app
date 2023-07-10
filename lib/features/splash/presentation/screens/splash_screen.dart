import 'dart:async';

import 'package:country_explorer/features/splash/presentation/components/splash_screen_body.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.homeScreen);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(context),
    );
  }
}

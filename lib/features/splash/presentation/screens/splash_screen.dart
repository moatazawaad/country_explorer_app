import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:country_explorer/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/asstes_manager.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(ImageAssets.global,),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                AppStrings.exploreTheWorld,
              textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

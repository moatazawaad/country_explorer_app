import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asstes_manager.dart';

Widget SplashScreenBody(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageAssets.global,
          ),
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
    );

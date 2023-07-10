import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

Widget SplashScreenBody(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageAssets.global,
          ),
        ),
        Text(
          AppStrings.exploreTheWorld,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );

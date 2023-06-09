import 'package:country_explorer/core/utils/assets_manager.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:flutter/material.dart';

Widget ErrorScreen(
  BuildContext context, {
  required String text,
  required String text2,
}) =>
    Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(GifAssets.searchError),
              height: context.height * 0.2,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );

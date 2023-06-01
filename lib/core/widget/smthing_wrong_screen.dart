import 'package:flutter/material.dart';

Widget SomethingWrongScreen(BuildContext context,{required String text, required String text2,}) =>
    Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 130,
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


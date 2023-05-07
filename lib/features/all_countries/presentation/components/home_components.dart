import 'package:country_explorer/core/utils/asstes_manager.dart';
import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ), (route) {
  return false;
});

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
  child: Container(
    width: double.infinity,
    height: 2.0,
    color: Colors.grey[300],
  ),
);

Image placeHolder() => Image.asset(GifAssets.spinningGlobe, height: 100, width: double.infinity, fit: BoxFit.contain,);
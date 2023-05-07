import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_hex_colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Ok',
              ),
            ),
          ],
        ));
  }

  static void showToast({
    required message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: color ?? AppHexColors.violet,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}

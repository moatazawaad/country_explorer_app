import 'package:country_explorer/core/utils/app_hex_colors.dart';
import 'package:country_explorer/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import '../utils/app_strings.dart';

class NoConnectionScreen extends StatelessWidget {
  final VoidCallback? onPress;
  final String? message;
  final Function(String)? onRetry;

  const NoConnectionScreen({Key? key, this.onPress, this.message, this.onRetry
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).scaffoldBackgroundColor,
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
              AppStrings.noInternet,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Text(
            AppStrings.tryAgain,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Container(
            height: context.height * 0.05,
            width: context.width * 0.55,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                AppStrings.reloadScreen,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              // onPressed: () {
              //   if (onPress != null) {
              //     onPress!();
              //   }
              // },
              onPressed: () {
                // onRetry!(message!);
                onPress!();
              },
            ),
          )
        ],
      ),
    );
  }
}
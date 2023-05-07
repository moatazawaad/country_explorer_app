import 'package:flutter/material.dart';
import '../utils/app_strings.dart';

class ErrorScreen extends StatelessWidget {

  const ErrorScreen({Key? key
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
              Icons.error_outline,
              color: Colors.redAccent,
              size: 130,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              AppStrings.notFound,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Text(
            AppStrings.tryAgain,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

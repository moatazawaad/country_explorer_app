import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_hex_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asstes_manager.dart';
import '../controller/app_theme_cubit.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key, required this.showThemeButton}) : super(key: key);
  final bool showThemeButton;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(ImageAssets.global),
      ),
    ];
    return AppBar(
      iconTheme: IconThemeData(color: AppHexColors.darkBlue),
      title: const Text(
        AppStrings.appName,
      ),
      leading: showThemeButton
          ? IconButton(
        icon: AppThemeCubit.get(context).isDark
            ? const Icon(Icons.nightlight_outlined)
            : const Icon(Icons.wb_sunny_outlined),
        onPressed: () {
          AppThemeCubit.get(context).changeAppTheme();
        },
      )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

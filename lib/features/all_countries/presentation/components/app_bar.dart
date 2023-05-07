import 'package:country_explorer/features/all_countries/presentation/controller/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_hex_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asstes_manager.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key, required this.showLeadingIcon}) : super(key: key);
  final bool showLeadingIcon;

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
      leading: IconButton(
        icon: AppCubit.get(context).isDark
            ? const Icon(Icons.wb_sunny_outlined)
            : const Icon(Icons.nightlight_outlined),
        onPressed: () {
          // Scaffold.of(context).openDrawer();
          AppCubit.get(context).changeAppTheme();
        },
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

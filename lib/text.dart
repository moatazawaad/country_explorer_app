// import 'package:country_explorer/core/utils/asstes_manager.dart';
// import 'package:country_explorer/core/utils/media_query.dart';
// import 'package:flutter/material.dart';
// import 'core/utils/app_strings.dart';
//
// class MyDrawer extends StatelessWidget {
//   const MyDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width / 1.7,
//       child: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Text(
//                   AppStrings.appName,
//                 ),
//                 Image.asset(
//                   ImageAssets.global,
//                   width: context.width * 0.1,
//                   fit: BoxFit.contain,
//                 )
//               ]),
//             ),
//             InkWell(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(AppStrings.lightTheme, style: Theme.of(context).textTheme.bodySmall,),
//                   Icon(Icons.sunny)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

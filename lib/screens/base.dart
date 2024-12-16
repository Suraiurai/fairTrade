import 'package:dubai_project/screens/MapPage/map_screen.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MapScreen(),
        Container(color: AppColors.blackCustom, height: 15, width: 300,)
      ],),
    );
  }
}








// import 'package:dubai_project/screens/HomePage/UI/home_screen.dart';
// import 'package:dubai_project/screens/chat_page/chat_screen.dart';
// import 'package:dubai_project/screens/search_page/search_screen.dart';
// import 'package:flutter/material.dart';
// import '../utilities/assets.dart';
// import '../utilities/theme.dart';
// import 'ProfilePage/profile_screen.dart';

// class BasePage extends StatefulWidget {
//   const BasePage({super.key});

//   @override
//   State<BasePage> createState() => __BasePageState();
// }

// class __BasePageState extends State<BasePage> {
//   final pages = [
//      HomeScreen(),
//     const SearchScreen(),
//     const ChatScreen(),
//     const ProfileScreen(),
//   ];

//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         body: pages[currentIndex],
//         bottomNavigationBar: Container(
//           color: AppColors.light100,
//           child: SizedBox(
//             height: 83,
//             child: BottomNavigationBar(
//               onTap: (value) {
//                 currentIndex = value;
//                 setState(() {
//                   //no-op
//                 });
//               },
//               currentIndex: currentIndex,
//               type: BottomNavigationBarType.fixed,
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               selectedFontSize: 0,
//               unselectedFontSize: 0,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: AppIcons.homeTab.svgPicture(
//                     color: AppColors.blackCustom,
//                   ),
//                   label: "",
//                   activeIcon: AppIcons.homeSelectedTab.svgPicture(),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AppIcons.searchTab.svgPicture(
//                     color: AppColors.blackCustom,
//                   ),
//                   label: "",
//                   activeIcon: AppIcons.searchSelectedTab.svgPicture(),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AppIcons.messageTab.svgPicture(
//                     color: AppColors.blackCustom,
//                   ),
//                   label: "",
//                   activeIcon: AppIcons.messageSelectedTab.svgPicture(),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AppIcons.profileTab.svgPicture(
//                     color: AppColors.blackCustom,
//                   ),
//                   label: "",
//                   activeIcon: AppIcons.profileSelectedTab.svgPicture(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

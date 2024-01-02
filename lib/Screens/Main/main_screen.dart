// import 'package:animon/Screens/Discover/DiscoverScreen.dart';
// import 'package:animon/Screens/Home/HomeScreen.dart';
// import 'package:animon/Screens/Login/LoginScreen.dart';
// import 'package:animon/Screens/MyList/MyListScreen.dart';
// import 'package:animon/Screens/Profile/ProfileScreen.dart';
// import 'package:animon/utils/constants.dart';
// import 'package:animon/utils/toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MainScreen extends StatefulWidget {
//   static String routeName = "/";

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   static List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     DiscoverScreen(),
//     MyListScreen(),
//     ProfileScreen()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void signOut() async {
//     await FirebaseAuth.instance.signOut();
//     showToast(message: "Logout success");
//     Navigator.pushNamed(context, LoginScreen.routeName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: kPrimaryColor,
//         title: Row(
//           children: [
//             SizedBox(
//               height: 32,
//               width: 32,
//               child: Image.asset(
//                 "assets/images/animon_icon_2.png",
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(width: 12),
//             Text(
//               "Animon",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: GoogleFonts.varelaRound().fontFamily),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               signOut();
//               Navigator.pushNamed(context, LoginScreen.routeName);
//             },
//             child: Icon(
//               Icons.exit_to_app,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(width: 12),
//         ],
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: kPrimaryColor,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search_rounded),
//             label: 'Discover',
//             backgroundColor: kPrimaryColor,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_rounded),
//             label: 'MyList',
//             backgroundColor: kPrimaryColor,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//             backgroundColor: kPrimaryColor,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

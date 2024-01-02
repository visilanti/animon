// // ignore_for_file: unused_import

// import 'package:animon/size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProfileScreen extends StatelessWidget {
//   static String routeName = "/profile";

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Halaman Profile"),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.of(context).pushNamed("/sign_in");
//               },
//               child: Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

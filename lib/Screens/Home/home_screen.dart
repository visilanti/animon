// import 'package:animon/Components/Home/HomeComponent.dart';
// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ListTileExample(),
    );
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/animon_icon_2.png",
                height: 32,
                width: 32,
              ),
              title: const Text('Two-line ListTile'),
              subtitle: const Text('Here is a second line'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/animon_icon_2.png",
                height: 32,
                width: 32,
              ),
              title: const Text('Three-line ListTile'),
              subtitle: const Text(
                  'A sufficiently long subtitle warrants three lines.'),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}

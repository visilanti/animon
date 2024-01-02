// import 'package:animon/Components/Discover/DiscoverComponent.dart';

import 'package:animon/size_config.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  static String routeName = "/discover";

  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Text(
        "Halaman Discover",
        style: TextStyle(fontSize: 32, color: Colors.deepOrange[300]),
      ),
    );
  }
}

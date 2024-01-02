// import 'package:animon/Components/MyList/MyListComponent.dart';
import 'package:animon/size_config.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  static String routeName = "/my_list";

  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Text("Halaman MyList"),
    );
  }
}

import 'package:animon/movie/components/Edit/edit_component.dart';
import 'package:animon/size_config.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  static String routeName = "/edit";

  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
      ),
      body: const EditComponent(),
    );
  }
}

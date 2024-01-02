import 'package:animon/movie/components/Register/register_component.dart';
import 'package:animon/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: const RegisterComponent());
  }
}

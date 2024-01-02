// ignore_for_file: unused_local_variable, unused_import

import 'package:animon/Screens/Discover/discover_screen.dart';
import 'package:animon/Screens/Edit/edit_screen.dart';
import 'package:animon/Screens/Home/home_screen.dart';
import 'package:animon/Screens/Login/login_screen.dart';
import 'package:animon/Screens/MyList/my_list_screen.dart';
import 'package:animon/Screens/Profile/profile_screen.dart';
import 'package:animon/Screens/Register/register_screen.dart';
import 'package:animon/movie/pages/movie_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/sign_in":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/sign_up":
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const MoviePage());
      case "/edit":
        return MaterialPageRoute(builder: (_) => const EditScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}

import 'dart:io';

import 'package:animon/injector.dart';
import 'package:animon/movie/providers/movie_get_detail_provider.dart';
import 'package:animon/movie/providers/movie_get_discover_provider.dart';
import 'package:animon/movie/providers/movie_get_popular_provides.dart';
import 'package:animon/movie/providers/movie_search_povider.dart';
import 'package:animon/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future main() async {
  //splash screen
  await dotenv.load();

  String apiKey = dotenv.get('API_KEY');
  String appId = dotenv.get('APP_ID');
  String messagingSenderId = dotenv.get('MESSAGING_SENDER_ID');
  String projectId = dotenv.get('PROJECT_ID');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: apiKey,
              appId: appId,
              messagingSenderId: messagingSenderId,
              projectId: projectId),
        )
      : await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetDiscoverProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => sl<MovieGetPopularProvider>()),
        ChangeNotifierProvider(create: (_) => sl<MovieGetDetailProvider>()),
        ChangeNotifierProvider(create: (_) => sl<MovieSearchProvider>()),
      ],
      child: MaterialApp(
        title: 'Animon',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: user == null ? "/sign_in" : "/home",
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

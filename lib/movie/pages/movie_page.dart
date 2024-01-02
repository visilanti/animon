// ignore_for_file: prefer_const_constructors

import 'package:animon/Screens/Edit/edit_screen.dart';
import 'package:animon/Screens/Login/login_screen.dart';
import 'package:animon/movie/components/movie_discover_component.dart';
import 'package:animon/movie/components/movie_popular_componen.dart';
import 'package:animon/movie/pages/movie_pagination_page.dart';
import 'package:animon/movie/pages/movie_search_page.dart';
import 'package:animon/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePage extends StatefulWidget {
  static String routeName = "/home";
  const MoviePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/animon_icon_2.png'),
                  ),
                ),
                const Text(
                  'Animon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
          ),
          _WidgetTitle(
            title: 'Popular Anime',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.discover,
                  ),
                ),
              );
            },
          ),
          const MovieDiscoverComponent(),
          _WidgetTitle(
            title: 'Popular Movie',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.popular,
                  ),
                ),
              );
            },
          ),
          const MoviePopularComponent(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue.shade600,
        unselectedItemColor: Colors.blue.shade600,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                // Navigate to Home
                // You can replace this with the actual navigation logic
                break;
              case 1:
                // Navigate to Search
                showSearch(
                  context: context,
                  delegate: MovieSearchPage(),
                );
                break;
              case 2:
                // Navigate to Account Management
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AccountPage()),
                );
                break;
            }
          });
        },
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onPressed;

  const _WidgetTitle({required this.title, required this.onPressed});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.black54,
                ),
              ),
              child: const Text('See All'),
            )
          ],
        ),
      );
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    void navigateToLoginScreen() {
      Navigator.popAndPushNamed(context, LoginScreen.routeName);
    }

    void signOut() async {
      await FirebaseAuth.instance.signOut();
      showToast(message: "Logout success");
      navigateToLoginScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // _buildTextField('Username'),
                // _buildTextField('Email'),
                // _buildTextField('Password', isPassword: true),
                ClipOval(
                  child: Image.asset(
                    "assets/images/defaultPhotoURL.jpg",
                    width: 150,
                    height: 150,
                  ),
                ),

                SizedBox(height: 20),
                user != null && user.displayName != null
                    ? Text(
                        '${user.displayName}',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.kanit().fontFamily),
                      )
                    : Text(
                        'Just a User',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.kanit().fontFamily),
                      ),
                if (user != null && user.email != null)
                  Text(
                    '${user.email}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: GoogleFonts.kanit().fontFamily),
                  ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            signOut();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.exit_to_app,
                                  color: Colors.white), // Add your icon here
                              SizedBox(
                                  width:
                                      8), // Adjust the space between icon and text
                              Text(
                                'Log Out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, EditScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.edit,
                                  color: Colors.white), // Add your icon here
                              SizedBox(
                                  width:
                                      8), // Adjust the space between icon and text
                              Text(
                                'Edit Account',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            deleteUserAccount(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.delete_outline,
                                  color: Colors.white), // Add your icon here
                              SizedBox(
                                  width:
                                      8), // Adjust the space between icon and text
                              Text(
                                'Delete Account',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteUserAccount(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete your account?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add code to delete the user's account here
                // For example:
                if (user != null) user.delete();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, // Route name for your login screen
                  (Route<dynamic> route) =>
                      false, // Remove all routes in history
                );
                // Show a toast or navigate to a different screen to indicate successful deletion
                showToast(message: 'Account deleted');
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:animon/Auth/firebase_auth.dart';
import 'package:animon/Screens/Login/login_screen.dart';
import 'package:animon/movie/components/custom_surfix_icon.dart';
import 'package:animon/movie/components/default_button_custom_color.dart';
import 'package:animon/movie/pages/movie_page.dart';
import 'package:animon/size_config.dart';
import 'package:animon/utils/constants.dart';
import 'package:animon/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isSigningUp = false;

  String? username;
  String? email;
  String? password;
  bool? remember = false;
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    txtUsername.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  void navigateToMoviePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MoviePage.routeName, // Route name for your login screen
      (Route<dynamic> route) => false, // Remove all routes in history
    );
  }

  void signUp() async {
    setState(() {
      isSigningUp = true;
    });

    // ignore: unused_local_variable
    String email = txtEmail.text;
    String password = txtPassword.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    updateProfile();

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      navigateToMoviePage();
    } else {
      showToast(message: "Some error happend");
    }
  }

  void updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String username = txtUsername.text;
    if (user != null) {
      try {
        await user.updateDisplayName(username);
        // Additional properties like displayName and photoURL are set
      } catch (e) {
        showToast(message: 'Error updating profile: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildUsername(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Sign Up",
          press: () {
            signUp();
          },
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "Log In Here",
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: kPrimaryColor, // Change color if needed
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Add your Log-in navigation or action here
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
              ),
            ],
          ),
        )
      ],
    ));
  }

  TextFormField buildUsername() {
    return TextFormField(
        controller: txtUsername,
        keyboardType: TextInputType.text,
        style: mTitleStyle,
        decoration: InputDecoration(
            labelText: "Username",
            hintText: "Enter your username",
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/User.svg",
            )));
  }

  TextFormField buildEmail() {
    return TextFormField(
        controller: txtEmail,
        keyboardType: TextInputType.emailAddress,
        style: mTitleStyle,
        decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email address",
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/Mail.svg",
            )));
  }

  TextFormField buildPassword() {
    return TextFormField(
        controller: txtPassword,
        obscureText: true,
        style: mTitleStyle,
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )));
  }
}

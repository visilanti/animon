import 'package:animon/Auth/firebase_auth.dart';
import 'package:animon/Screens/Register/register_screen.dart';
import 'package:animon/movie/components/custom_surfix_icon.dart';
import 'package:animon/movie/components/default_button_custom_color.dart';
import 'package:animon/movie/pages/movie_page.dart';
import 'package:animon/size_config.dart';
import 'package:animon/utils/constants.dart';
import 'package:animon/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isSigningIn = false;
  String? email;
  String? password;
  bool? remember = false;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
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

  void signIn() async {
    setState(() {
      isSigningIn = true;
    });

    // ignore: unused_local_variable
    String email = txtEmail.text;
    String password = txtPassword.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigningIn = false;
    });
    if (user != null) {
      showToast(message: "Login success");
      navigateToMoviePage();
    } else {
      showToast(message: "Login failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Log In",
          press: () {
            signIn();
          },
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "Sign Up Here",
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: kPrimaryColor, // Change color if needed
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Add your sign-up navigation or action here
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
              ),
            ],
          ),
        )
      ],
    ));
  }

  TextFormField buildEmail() {
    return TextFormField(
        controller: txtEmail,
        keyboardType: TextInputType.emailAddress,
        style: mTitleStyle,
        decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/User.svg",
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
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}

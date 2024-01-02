import 'package:animon/movie/components/custom_surfix_icon.dart';
import 'package:animon/movie/components/default_button_custom_color.dart';
import 'package:animon/movie/pages/movie_page.dart';
import 'package:animon/size_config.dart';
import 'package:animon/utils/constants.dart';
import 'package:animon/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditForm();
}

class _EditForm extends State<EditForm> {
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  bool isEdited = false;
  String? username;
  String? email;
  String? password;
  bool? remember = false;
  TextEditingController txtUsername = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    txtUsername.dispose();
    super.dispose();
  }

  void navigateToMoviePage() {
    Navigator.popAndPushNamed(context, MoviePage.routeName);
  }

  void updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String username = txtUsername.text;
    // String password = txtPassword.text;
    if (user != null) {
      try {
        if (username.isNotEmpty) {
          await user.updateDisplayName(username);
        }
        showToast(message: 'Account update success');
        navigateToMoviePage();
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
        SizedBox(height: getProportionateScreenHeight(20)),
        SizedBox(height: getProportionateScreenHeight(30)),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Submit",
          press: () {
            updateProfile();
          },
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    ));
  }

  TextFormField buildUsername() {
    return TextFormField(
        controller: txtUsername,
        keyboardType: TextInputType.text,
        style: mTitleStyle,
        decoration: InputDecoration(
            labelText: "New Username",
            hintText: "Enter your new username",
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(
              svgIcon: "assets/icons/User.svg",
            )));
  }
}

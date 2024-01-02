import 'package:animon/movie/components/Login/login_form.dart';
import 'package:animon/size_config.dart';
import 'package:animon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            SimpleShadow(
              opacity: 0.5,
              color: kSecondaryColor,
              offset: const Offset(5, 5),
              sigma: 2,
              child: SvgPicture.asset(
                "assets/images/login_icon.svg",
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 24,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.kanit().fontFamily),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SignInForm()
          ]),
        ),
      ),
    ));
  }
}

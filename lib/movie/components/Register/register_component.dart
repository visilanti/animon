import 'package:animon/movie/components/Register/register_form.dart';
import 'package:animon/size_config.dart';
import 'package:animon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({super.key});

  @override
  State<RegisterComponent> createState() => _RegisterComponent();
}

class _RegisterComponent extends State<RegisterComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                SimpleShadow(
                  opacity: 0.5,
                  color: kSecondaryColor,
                  offset: const Offset(5, 5),
                  sigma: 2,
                  child: SvgPicture.asset(
                    "assets/images/sign_up_icon.svg",
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
                        "Register",
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
                const SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

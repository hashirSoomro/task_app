import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/Screens/signin.dart';

import '../AppTextField.dart';
import '../TitleAppBar.dart';
import '../circleIcon.dart';
import '../gradientButton.dart';
import '../headings.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Sign Up"),
        leading: CircleIcon(
          img: 'assets/icons/Stroke.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(headingText: "Create Account"),
              const SizedBox(
                height: 14,
              ),
              SubHeadingText(
                  subHeadingText:
                      "Please enter your information\nto create your account."),
              const SizedBox(
                height: 40,
              ),
              AppTextField(
                hintText: "Enter your name",
                obscureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(hintText: "Enter your email", obscureText: false),
              const SizedBox(
                height: 30,
              ),
              AppTextField(hintText: "Enter your password", obscureText: true),
              const SizedBox(
                height: 34,
              ),
              Center(
                child: GradientButton(
                  onPressed: () {
                    // Add your button's onPressed functionality here
                    /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );*/
                  },
                  gradientColors: const [Color(0xFF756EF3), Color(0xFF756EF3)],
                  width:
                      MediaQuery.of(context).size.width * 0.85, // Set the width
                  height: 60.0,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ), // Set the height
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Sign Up With",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF868D95),
                      height: 1.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Add your onPressed logic here
                    },
                    child: Image.asset(
                      'assets/images/Google.png',
                      width: 55.0,
                      height: 55.0,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // Add your onPressed logic here
                    },
                    child: Image.asset(
                      'assets/images/Apple.png',
                      width: 55.0,
                      height: 55.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account? ",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868D95),
                        height: 1.3,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignIn()));
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF756EF3),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

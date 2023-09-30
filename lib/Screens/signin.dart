import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/Screens/signup.dart';
import '../AppTextField.dart';
import '../TitleAppBar.dart';
import '../circleIcon.dart';
import '../gradientButton.dart';
import '../headings.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Sign In"),
        leading: CircleIcon(
          img: 'assets/icons/Stroke.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 36, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(headingText: "Welcome Back"),
              SizedBox(
                height: 14,
              ),
              SubHeadingText(
                  subHeadingText:
                      "Please enter your email address\nand password for login."),
              SizedBox(
                height: 40,
              ),
              AppTextField(
                hintText: "Enter your email",
                obscureText: false,
              ),
              SizedBox(
                height: 30,
              ),
              AppTextField(hintText: "Enter your password", obscureText: true),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF002055),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 34,
              ),
              Center(
                child: GradientButton(
                  onPressed: () {
                    // Add your button's onPressed functionality here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  gradientColors: [Color(0xFF756EF3), Color(0xFF756EF3)],
                  width:
                      MediaQuery.of(context).size.width * 0.85, // Set the width
                  height: 60.0, // Set the height
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Sign In With",
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
              SizedBox(
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
                      'assets/images/Google.png', // Replace with your image asset path
                      width: 55.0, // Set the width of the image
                      height: 55.0, // Set the height of the image
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // Add your onPressed logic here
                    },
                    child: Image.asset(
                      'assets/images/Apple.png', // Replace with your image asset path
                      width: 55.0, // Set the width of the image
                      height: 55.0, // Set the height of the image
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not registered yet? ",
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
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
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

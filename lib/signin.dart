import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/signup.dart';

import 'gradientButton.dart';

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
        title: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width *
                  0.22), // Adjust the left padding as needed
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Color(0xFF002055),
                height: 1.2,
              ),
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(7),
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromARGB(255, 218, 222, 228),
              width: 1.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 1.0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 14,
              ),
              color: Color(0xFF002055),
            ),
          ),
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
              Text(
                "Welcome Back",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF002055),
                    height: 25.0 / 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Please enter your email address\nand password for login.",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF868D95),
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                  cursorColor: Color(0xFF756EF3),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868D95),
                        height: 1.3,
                      ),
                      decorationColor: Color(0xFF756EF3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 202, 209, 221))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF002055),
                      height: 1.3,
                    ),
                    decorationColor: Color(0xFF756EF3),
                  )),
              SizedBox(
                height: 30,
              ),
              TextField(
                  obscureText: true,
                  cursorColor: Color(0xFF756EF3),
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868D95),
                        height: 1.3,
                      ),
                      decorationColor: Color(0xFF756EF3),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 202, 209, 221))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF002055),
                      height: 1.3,
                    ),
                    decorationColor: Color(0xFF756EF3),
                  )),
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
                    /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );*/
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

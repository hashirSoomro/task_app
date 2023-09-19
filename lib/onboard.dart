import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int _currentPage = 0;
  final Color customSelectedColor = Color(0xFF5451D6);
  final Color customNonSelectedColor = Color(0x665451D6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 4,
            bottom: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Gallery1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.1,
            right: 0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Management',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10, // Use width to add horizontal spacing
                  ),
                  Text(
                    "Let's create a",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF002055),
                        height: 1.2,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "space",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF756EF3),
                            height: 1.2,
                          ),
                        ),
                      ),
                      Text(
                        " for your",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF002055),
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "workflows.",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF002055),
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        child: Container(
                          width: _currentPage == index ? 25.0 : 6.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: _currentPage == index
                                ? BorderRadius.circular(12.0)
                                : BorderRadius.circular(5.0),
                            color: _currentPage == index
                                ? customSelectedColor // Use custom selected color
                                : customNonSelectedColor, // Use custom non-selected color
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
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
            ),
          ),
          Positioned(
            right: -40,
            bottom: 0,
            child: Container(
              height: 145,
              width: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/blob.png'),
                ),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

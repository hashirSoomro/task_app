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
  final imgs = [
    'assets/images/Gallery1.png',
    'assets/images/Gallery2.png',
    'assets/images/Gallery3.png'
  ];
  final text1 = ["Let's create a", "Work more", "Manage your"];
  final text2 = ["Space ", "Structured ", "Tasks "];
  final text3 = ["for your", "and", "quickly for"];
  final text4 = ["Workflows.", "Organized.", "Results."];
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
              child: ImageWidget(
                currentPage: _currentPage,
                imgs: imgs,
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
                  Container(
                      child: TextWidget(
                          currentPage: _currentPage,
                          text1: text1,
                          text2: text2,
                          text3: text3,
                          text4: text4)),
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
                  onPressed: () {
                    setState(() {
                      if (_currentPage < imgs.length - 1) {
                        _currentPage++;
                        print(_currentPage);
                      } else {
                        _currentPage = 0;
                      }
                    });
                  },
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

class ImageWidget extends StatefulWidget {
  final int currentPage;
  final List<String> imgs;

  ImageWidget({required this.currentPage, required this.imgs});

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            widget.currentPage >= 0 && widget.currentPage < widget.imgs.length
                ? widget.imgs[widget.currentPage]
                : 'assets/images/Gallery1.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  final int currentPage;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;

  TextWidget(
      {required this.currentPage,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          widget.currentPage >= 0 && widget.currentPage < widget.text1.length
              ? widget.text1[widget.currentPage]
              : "Let's create a",
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
              widget.currentPage >= 0 &&
                      widget.currentPage < widget.text2.length
                  ? widget.text2[widget.currentPage]
                  : "space",
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
              widget.currentPage >= 0 &&
                      widget.currentPage < widget.text3.length
                  ? widget.text3[widget.currentPage]
                  : " for your",
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
          widget.currentPage >= 0 && widget.currentPage < widget.text4.length
              ? widget.text4[widget.currentPage]
              : "workflows.",
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
      ],
    );
  }
}

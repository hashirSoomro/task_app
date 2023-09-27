import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatefulWidget {
  String headingText;
  HeadingText({required this.headingText});

  @override
  State<HeadingText> createState() => _HeadingTextState();
}

class _HeadingTextState extends State<HeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.headingText,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Color(0xFF002055),
          height: 25.0 / 20.0,
        ),
      ),
    );
  }
}

class SubHeadingText extends StatefulWidget {
  String subHeadingText;

  SubHeadingText({required this.subHeadingText});
  @override
  State<SubHeadingText> createState() => _SubHeadingTextState();
}

class _SubHeadingTextState extends State<SubHeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.subHeadingText,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF868D95),
          height: 1.3,
        ),
      ),
    );
  }
}

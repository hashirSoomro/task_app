import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAppBar extends StatefulWidget {
  String titleText;

  TitleAppBar({required this.titleText});
  @override
  State<TitleAppBar> createState() => _TitleAppBarState();
}

class _TitleAppBarState extends State<TitleAppBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.titleText,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Color(0xFF002055),
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

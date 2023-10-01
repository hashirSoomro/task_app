import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatefulWidget {
  String first;
  String second;
  String third;

  TabWidget({
    required this.first,
    required this.second,
    required this.third,
  });
  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int _selectedTabIndex = 0;

  Widget buildTabButton(String label, int index) {
    bool isSelected = _selectedTabIndex == index;

    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? Color(0xFF756EF3) : Colors.transparent,
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Color(0xFF002055) : Color(0xFF848A94),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTabButton(widget.first, 0),
        SizedBox(
          width: 7,
        ),
        buildTabButton(widget.second, 1),
        SizedBox(
          width: 7,
        ),
        buildTabButton(widget.third, 2),
      ],
    );
  }
}

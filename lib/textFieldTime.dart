import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectionTextField extends StatefulWidget {
  const TimeSelectionTextField({super.key});

  @override
  _TimeSelectionTextFieldState createState() => _TimeSelectionTextFieldState();
}

class _TimeSelectionTextFieldState extends State<TimeSelectionTextField> {
  final TextEditingController _timeController = TextEditingController();
  TimeOfDay? _selectedTime;

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (selected != null) {
      setState(() {
        _selectedTime = selected;
        _timeController.text = selected.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _timeController,
      readOnly: true,
      onTap: () {
        _showTimePicker(context);
      },
      cursorColor: const Color(0xFF756EF3),
      decoration: InputDecoration(
        hintText: "Select Time",
        hintStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF868D95),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(255, 202, 209, 221)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFF756EF3),
          ),
        ),
      ),
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF002055),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TextFieldCalendar extends StatefulWidget {
  const TextFieldCalendar({super.key});

  @override
  _TextFieldCalendarState createState() => _TextFieldCalendarState();
}

class _TextFieldCalendarState extends State<TextFieldCalendar> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? _focusedDate;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Future<void> _showCalendar(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2023, 12, 31),
                  focusedDay: _focusedDay,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: const TextStyle(
                      color: Color(0xFF848A94),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    weekendStyle: const TextStyle(
                      color: Color(0xFF848A94),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    dowTextFormatter: (date, locale) =>
                        DateFormat.E(locale).format(date)[0],
                  ),
                  calendarFormat: _calendarFormat,
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF002055),
                    ),
                    selectedTextStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF756EF3), // Color for the selected date
                    ),
                    todayTextStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF756EF3),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xFF756EF3),
                      ),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xFF756EF3),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF756EF3),
                    ),
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = selectedDay;
                      _updateSelectedDate(selectedDay);
                      Navigator.of(context).pop();
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateSelectedDate(DateTime selectedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _dateController.text = DateFormat('MMMM dd, yyyy').format(selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,
      onTap: () {
        _showCalendar(context);
      },
      cursorColor: const Color(0xFF756EF3),
      decoration: InputDecoration(
        hintText: "Tap to select the date",
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

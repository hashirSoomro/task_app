import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime currentDate = DateTime.now();
    // Calculate the first day of the month
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    // Calculate the last day of the month
    DateTime lastDayOfMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0);

    // Calculate the number of days in the month
    int numberOfDaysInMonth =
        lastDayOfMonth.difference(firstDayOfMonth).inDays + 1;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        height: 118,
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numberOfDaysInMonth,
            itemBuilder: ((context, index) {
              // Calculate the date for the current item
              DateTime currentDate = firstDayOfMonth.add(Duration(days: index));
              // Get the day of the week (e.g., Mon, Tue)
              String dayOfWeek = DateFormat('E').format(currentDate);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedContainerIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 118,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selectedContainerIndex == index
                          ? Colors.transparent
                          : Color.fromARGB(255, 218, 230, 250),
                    ),
                    color: selectedContainerIndex == index
                        ? Color(0xFF756EF3)
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "${currentDate.day}",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: selectedContainerIndex == index
                                  ? Colors.white
                                  : Color(0xFF848A94),
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          dayOfWeek,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: selectedContainerIndex == index
                                  ? Colors.white
                                  : Color(0xFF848A94),
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

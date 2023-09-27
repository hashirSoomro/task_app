import 'package:flutter/material.dart';
import 'package:task_app/Screens/todayTask.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../TitleAppBar.dart';
import '../bottomBar.dart';
import '../calendarWidget.dart';
import '../circleIcon.dart';
import '../headings.dart';

class MonthlyTask extends StatefulWidget {
  const MonthlyTask({super.key});

  @override
  State<MonthlyTask> createState() => _MonthlyTaskState();
}

class _MonthlyTaskState extends State<MonthlyTask> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar(
            titleText: "Monthly Task",
          ),
          actions: [
            CircleIcon(
              img: 'assets/icons/Edit.png',
              onPressed: () {},
            ),
          ],
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
        body: Container(
            padding: EdgeInsets.only(top: 10, left: 24, right: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              HeadingText(headingText: "October, 20"),
                              SizedBox(
                                height: 5,
                              ),
                              SubHeadingText(subHeadingText: "15 task today"),
                            ]),
                        Container(
                          margin: EdgeInsets.all(7),
                          width: 42.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF756EF3),
                            radius: 1.0,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TodayTask()));
                              },
                              icon: ImageIcon(
                                AssetImage('assets/icons/Calendar.png'),
                                size: 16,
                              ),
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ]),
                  CalendarWidget(),
                  Flexible(
                    child: Container(
                      height: 298,
                      margin: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE9F1FF),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TableCalendar(
                        rowHeight: 40,
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2023, 12, 31),
                        focusedDay: _focusedDay,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Color(0xFF848A94),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          weekendStyle: TextStyle(
                            color: Color(0xFF848A94),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          dowTextFormatter: (date, locale) =>
                              DateFormat.E(locale).format(date)[0],
                        ),
                        calendarFormat: _calendarFormat,
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF002055),
                            height: 25.0 / 20.0,
                          ),
                          selectedTextStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF756EF3),
                            height: 25.0 / 20.0,
                          ),
                          todayTextStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF756EF3),
                            height: 25.0 / 20.0,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Color(0xFF756EF3),
                            ),
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Color(0xFF756EF3),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF756EF3),
                            height: 25.0 / 20.0,
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
                            _focusedDay =
                                focusedDay; // Update the focused day when a day is selected
                          });
                        },
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                      ),
                    ),
                  ),
                ])),
        bottomNavigationBar: BottomBar());
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/bottomBar.dart';
import 'package:task_app/Screens/monthlyTask.dart';

import '../TitleAppBar.dart';
import '../calendarWidget.dart';
import '../circleIcon.dart';
import '../headings.dart';

class TodayTask extends StatefulWidget {
  const TodayTask({super.key});

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    List ProfileImages = [
      'assets/images/photo.jpg',
      'assets/images/photo.jpg',
      'assets/images/photo.jpg'
    ];
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(
          titleText: "Today's Task",
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
                        SubHeadingText(subHeadingText: "15 task today")
                      ],
                    ),
                    CircleIcon(
                        img: 'assets/icons/Calendar.png',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MonthlyTask()));
                        })
                  ],
                ),
                CalendarWidget(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 24,
                    itemBuilder: ((context, index) {
                      return Stack(
                        children: [
                          Divider(
                            height: 20,
                            thickness: 0.8,
                            endIndent: 0,
                            color: Color.fromARGB(255, 218, 222, 228),
                          ),
                          Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "10 am",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF002055),
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.17,
                            child: Container(
                              width: 253,
                              height: 78,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, top: 12, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Warefare Elements",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF),
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            for (int i = 0;
                                                i < ProfileImages.length;
                                                i++)
                                              Align(
                                                widthFactor: 0.8,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 14,
                                                  child: CircleAvatar(
                                                    radius: 13,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/photo.jpg'),
                                                  ),
                                                ),
                                              )
                                          ],
                                        ),
                                        Text(
                                          "10am-11am",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFFFFFF),
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ])),
      bottomNavigationBar: BottomBar(),
    );
  }
}

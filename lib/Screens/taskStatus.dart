import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/bottomBar.dart';
import 'package:fl_chart/fl_chart.dart';

import '../TitleAppBar.dart';
import '../circleIcon.dart';

class DoughnutChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3, // Adjust the aspect ratio as needed
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 65,
          pieTouchData: PieTouchData(),
          sections: [
            PieChartSectionData(
              color: Color(0xFF756EF3),
              radius: 30,
            ),
            PieChartSectionData(
              color: Color(0xFFB1D199),
              radius: 30, // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: Color(0xFFFFB35A),
              radius: 30, // Adjust the radius as needed
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStatus extends StatefulWidget {
  @override
  State<TaskStatus> createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  List Text1 = ["Completed", "In Progress", "Todo"];
  List Text2 = ["18 Task now ", "2 Task now ", "6 Task now "];
  List Text3 = [" 18 Task Completed", " 1 Started", " 1 Upcoming"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Task Status"),
        actions: [CircleIcon(img: "assets/icons/Filter.png", onPressed: () {})],
        leading: CircleIcon(
            img: "assets/icons/Stroke.png",
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                DoughnutChart(),
                Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 82,
                    ),
                    Text(
                      " 65%",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF002055),
                        ),
                      ),
                    ),
                    Text(
                      " Complete",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF848A94),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 20, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Color(0xFFB1D199), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "To Do",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF002055),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFB35A), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "In Progress",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF002055),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Color(0xFF756EF3), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Completed",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF002055),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Monthly",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF002055),
                  height: 25.0 / 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 327,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFFE9F1FF))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16, bottom: 14, top: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Text1[index],
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF002055),
                                        height: 25.0 / 20.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Text2[index],
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF848A94),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF848A94),
                                            shape: BoxShape.circle),
                                      ),
                                      Text(
                                        Text3[index],
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF848A94),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage("assets/icons/More.png"),
                                  color: Color(0xFF848A94),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

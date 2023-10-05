import 'package:flutter/material.dart';
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
          pieTouchData: PieTouchData(),
          sections: [
            PieChartSectionData(
              color: Color(0xFF756EF3),
              value: 40,
              radius: 50,
            ),
            PieChartSectionData(
              color: Color(0xFFB1D199),
              value: 30,
              radius: 50, // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: Color(0xFFFFB35A),
              value: 20,
              radius: 50, // Adjust the radius as needed
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStatus extends StatefulWidget {
  const TaskStatus({super.key});

  @override
  State<TaskStatus> createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Chat"),
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
      body: Column(
        children: [
          Center(
            child: DoughnutChart(),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

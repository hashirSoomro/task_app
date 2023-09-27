import 'package:flutter/material.dart';
import 'package:task_app/TitleAppBar.dart';
import 'package:task_app/circleIcon.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Add Task"),
        leading: CircleIcon(img: "assets/icons/Stroke.png", onPressed: () {}),
      ),
    );
  }
}

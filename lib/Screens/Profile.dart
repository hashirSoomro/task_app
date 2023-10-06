import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../TitleAppBar.dart';
import '../circleIcon.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Task Status"),
        leading: CircleIcon(
            img: "assets/icons/Stroke.png",
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
    );
  }
}

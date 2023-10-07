import 'package:flutter/material.dart';
import 'package:task_app/Screens/chat.dart';
import 'package:task_app/Screens/projects.dart';

import 'Screens/Profile.dart';
import 'Screens/home.dart';
import 'addButton.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color homeIconColor = Color(0xFF848A94);
  Color folderIconColor = Color(0xFF848A94);
  Color chatIconColor = Color(0xFF848A94);
  Color profileIconColor = Color(0xFF848A94);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 13.0, right: 13.0, top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              setState(() {
                folderIconColor = Color(0xFF848A94);
                homeIconColor = Color(0xFF756EF3);
                chatIconColor = Color(0xFF848A94);
                profileIconColor = Color(0xFF848A94);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                AssetImage('assets/icons/Home.png'),
                size: 24,
                color: homeIconColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Projects()));

              folderIconColor = Color(0xFF756EF3);
              homeIconColor = Color(0xFF848A94);
              chatIconColor = Color(0xFF848A94);
              profileIconColor = Color(0xFF848A94);
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                AssetImage('assets/icons/Folder.png'),
                size: 24,
                color: folderIconColor,
              ),
            ),
          ),
          AddButton(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chat()));
              setState(() {
                folderIconColor = Color(0xFF848A94);
                homeIconColor = Color(0xFF848A94);
                chatIconColor = Color(0xFF756EF3);
                profileIconColor = Color(0xFF848A94);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                AssetImage('assets/icons/Chat.png'),
                size: 24,
                color: chatIconColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
              setState(() {
                folderIconColor = Color(0xFF848A94);
                homeIconColor = Color(0xFF848A94);
                chatIconColor = Color(0xFF848A94);
                profileIconColor = Color(0xFF756EF3);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                AssetImage('assets/icons/Profile.png'),
                size: 24,
                color: profileIconColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

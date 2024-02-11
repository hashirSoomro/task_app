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
  Color homeIconColor = const Color(0xFF848A94);
  Color folderIconColor = const Color(0xFF848A94);
  Color chatIconColor = const Color(0xFF848A94);
  Color profileIconColor = const Color(0xFF848A94);
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
                  context, MaterialPageRoute(builder: (context) => const Home()));
              setState(() {
                folderIconColor = const Color(0xFF848A94);
                homeIconColor = const Color(0xFF756EF3);
                chatIconColor = const Color(0xFF848A94);
                profileIconColor = const Color(0xFF848A94);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                const AssetImage('assets/icons/Home.png'),
                size: 24,
                color: homeIconColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Projects()));

              folderIconColor = const Color(0xFF756EF3);
              homeIconColor = const Color(0xFF848A94);
              chatIconColor = const Color(0xFF848A94);
              profileIconColor = const Color(0xFF848A94);
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                const AssetImage('assets/icons/Folder.png'),
                size: 24,
                color: folderIconColor,
              ),
            ),
          ),
          const AddButton(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Chat()));
              setState(() {
                folderIconColor = const Color(0xFF848A94);
                homeIconColor = const Color(0xFF848A94);
                chatIconColor = const Color(0xFF756EF3);
                profileIconColor = const Color(0xFF848A94);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                const AssetImage('assets/icons/Chat.png'),
                size: 24,
                color: chatIconColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Profile()));
              setState(() {
                folderIconColor = const Color(0xFF848A94);
                homeIconColor = const Color(0xFF848A94);
                chatIconColor = const Color(0xFF848A94);
                profileIconColor = const Color(0xFF756EF3);
              });
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.transparent,
              child: ImageIcon(
                const AssetImage('assets/icons/Profile.png'),
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

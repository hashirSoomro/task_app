import "dart:ui";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:task_app/Screens/addTask.dart";
import "package:task_app/Screens/addTeam.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddButton extends StatefulWidget {
  const AddButton({super.key});
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 70,
      onPressed: () {
        showModalBottomSheet(
            barrierColor: Colors.black26,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) => Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Rectangle.png",
                              color: Color(0xFFE9F1FF)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTask()));
                            },
                            child: AddButtonContainer(
                                icon: "assets/icons/EditSquare.png",
                                text: "Create Task"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: AddButtonContainer(
                                icon: "assets/icons/Plus.png",
                                text: "Create Project"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTeam()));
                            },
                            child: AddButtonContainer(
                                icon: "assets/icons/Users.png",
                                text: "Create Team"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: AddButtonContainer(
                                icon: "assets/icons/TimeCircle.png",
                                text: "Create Event"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Color(0xFF756EF3),
                              child: ImageIcon(
                                AssetImage('assets/icons/Close.png'),
                                size: 24,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
      },
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Color(0xFF756EF3),
        child: ImageIcon(
          AssetImage('assets/icons/Add.png'),
          size: 24,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}

class AddButtonContainer extends StatefulWidget {
  final String icon;
  final String text;

  AddButtonContainer({required this.icon, required this.text});

  @override
  State<AddButtonContainer> createState() => _AddButtonContainerState();
}

class _AddButtonContainerState extends State<AddButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 327,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE9F1FF)),
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Row(
          children: [
            Image.asset(
              widget.icon,
              width: 18.84,
              height: 18.87,
            ),
            SizedBox(
              width: 13,
            ),
            Text(
              widget.text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF002055),
                  height: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

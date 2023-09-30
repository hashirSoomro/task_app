import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppTextField.dart';
import '../TitleAppBar.dart';
import '../circleIcon.dart';
import '../textFieldCalendar.dart';
import '../textFieldTime.dart';

class TeamMember {
  final String name;
  final String imageUrl;
  bool isSelected;

  TeamMember(this.name, this.imageUrl, {this.isSelected = false});
}

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<TeamMember> selectedMembers = [];
  List<TeamMember> availableMembers = [
    TeamMember("Hashir", "assets/images/photo.jpg"),
    TeamMember("Mehmood", "assets/images/person1.png"),
    TeamMember("Ubaid", "assets/images/person2.png"),
    TeamMember("Ghafoor", "assets/images/photo.jpg"),
    TeamMember("Ilyas", "assets/images/person1.png"),
    TeamMember("Waseem", "assets/images/person2.png"),
    // Add more available members as needed
  ];

  void _showSelectMembersDialog(BuildContext context) async {
    List<TeamMember> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Select Team Members'),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var member in availableMembers)
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(member.imageUrl),
                              ),
                              title: Text(member.name),
                              trailing: Checkbox(
                                value: member.isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    member.isSelected = value!;
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        List<TeamMember> selected =
                            availableMembers.where((member) {
                          return member.isSelected;
                        }).toList();
                        Navigator.of(context).pop(selected);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedMembers = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Add Task"),
        leading: CircleIcon(
          img: "assets/icons/Stroke.png",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
            AppTextField(hintText: "Enter task name", obscureText: false),
            SizedBox(height: 16),
            Text(
              "Team Members",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF756EF3))),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _showSelectMembersDialog(context);
                      },
                      child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF756EF3),
                          ))),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var member in selectedMembers)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: AssetImage(
                                    member.imageUrl,
                                  ),
                                ),
                                Text(
                                  member.name,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF868D95),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Date",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
            TextFieldCalendar(),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF868D95),
                          ),
                        ),
                      ),
                      TimeSelectionTextField(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End Time",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF868D95),
                          ),
                        ),
                      ),
                      TimeSelectionTextField()
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Board",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

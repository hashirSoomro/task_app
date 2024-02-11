import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../AppTextField.dart';
import '../TitleAppBar.dart';
import '../circleIcon.dart';
import '../gradientButton.dart';
import '../tabWidget.dart';
import 'addTask.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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

  void showSelectMembersDialog(BuildContext context) async {
    List<TeamMember> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Select Team Members'),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        List<TeamMember> selected =
                            availableMembers.where((member) {
                          return member.isSelected;
                        }).toList();
                        Navigator.of(context).pop(selected);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    setState(() {
      selectedMembers = result;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Create Team"),
        leading: CircleIcon(
          img: "assets/icons/Stroke.png",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _getImageFromGallery,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(color: const Color(0xFF756EF3))),
                      child: _imageFile == null
                          ? const ImageIcon(
                              AssetImage("assets/images/logo.png"),
                              size: 40,
                              color: Color(0xFF756EF3),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Image.file(_imageFile!,
                                  width: 83, height: 83, fit: BoxFit.fill),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Upload logo file",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF002055),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your logo will publish always",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF868D95),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Team Name",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
            AppTextField(hintText: "Enter team name", obscureText: false),
            const SizedBox(
              height: 15,
            ),
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
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF756EF3))),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        showSelectMembersDialog(context);
                      },
                      child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF756EF3),
                          ))),
                ),
                const SizedBox(width: 8),
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
            const SizedBox(
              height: 5,
            ),
            Text(
              "Type",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF868D95),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TabWidget(
              first: "Private",
              second: "Public",
              third: "Secret",
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GradientButton(
                onPressed: () {},
                gradientColors: const [Color(0xFF756EF3), Color(0xFF756EF3)],
                width: MediaQuery.of(context).size.width * 0.70,
                height: 60.0,
                child: const Text(
                  'Create Team',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

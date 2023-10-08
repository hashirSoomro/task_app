import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:task_app/AppTextField.dart';

import '../TitleAppBar.dart';
import '../circleIcon.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _imageFile;
  final picker = ImagePicker();
  List headings = ["My Projects", "Join a Team", "Settings", "My Task"];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar(titleText: "Edit Profile"),
          actions: [
            Container(
              height: 30,
              width: 65,
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Save",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          leading: CircleIcon(
              img: "assets/icons/Stroke.png",
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF002055),
          shadowColor: Colors.transparent,
        ),
        body: Column(children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Column(children: [
                      GestureDetector(
                        onTap: _getImageFromGallery,
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(color: Colors.transparent)),
                          child: _imageFile == null
                              ? Image.asset(
                                  "assets/images/user.png",
                                  width: 80,
                                  height: 80,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.file(_imageFile!,
                                      width: 83, height: 83, fit: BoxFit.fill),
                                ),
                        ),
                      ),
                    ])),
                    SizedBox(height: 25),
                    Text(
                      "Name",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868D95),
                        ),
                      ),
                    ),
                    AppTextField(hintText: "Enter name", obscureText: false),
                    SizedBox(height: 16),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868D95),
                        ),
                      ),
                    ),
                    AppTextField(hintText: "Enter email", obscureText: false),
                    SizedBox(height: 16),
                    Text(
                      "Username",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868D95),
                        ),
                      ),
                    ),
                    AppTextField(
                        hintText: "Enter username", obscureText: false),
                    SizedBox(height: 16),
                    Text(
                      "Phone Number",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868D95),
                        ),
                      ),
                    ),
                    AppTextField(
                        hintText: "Enter phone number", obscureText: false),
                    SizedBox(height: 16),
                  ]))
        ]));
  }
}

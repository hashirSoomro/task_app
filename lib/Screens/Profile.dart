import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_app/Screens/editProfile.dart';
import 'package:task_app/bottomBar.dart';

import '../TitleAppBar.dart';
import '../circleIcon.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List headings = ["My Projects", "Join a Team", "Settings", "My Task"];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleAppBar(titleText: "Profile"),
          leading: CircleIcon(
              img: "assets/icons/Stroke.png",
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF002055),
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
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
                                        width: 83,
                                        height: 83,
                                        fit: BoxFit.fill),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Hashir Soomro",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF002055),
                            ),
                          ),
                        ),
                        Text(
                          "@hashir.soomro",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF868D95),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const EditProfile())));
                          },
                          child: Container(
                            height: 28,
                            width: 54,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFF756EF3))),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF002055),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                        height: 24,
                                        width: 24,
                                        "assets/icons/TimeSquare.png"),
                                    Text(
                                      "5",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF002055),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "On Going",
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
                                const VerticalDivider(
                                  indent: 5,
                                  endIndent: 5,
                                  color: Color(0xFFE9F1FF),
                                  width: 60,
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        height: 24,
                                        width: 24,
                                        "assets/icons/TickSquare.png"),
                                    Text(
                                      "25",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF002055),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Total Completed",
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
                              ],
                            ),
                          ),
                        )
                      ]))
                    ])),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, right: 16, left: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Settings(),
                              ));
                        },
                        child: Container(
                          width: 327,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFE9F1FF)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 10, bottom: 10, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  headings[index],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF002055),
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: const ImageIcon(AssetImage(
                                        "assets/icons/StrokeBack.png")))
                              ],
                            ),
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
        bottomNavigationBar: const BottomBar());
  }
}

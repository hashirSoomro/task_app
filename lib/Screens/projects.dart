import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/bottomBar.dart';

import '../TitleAppBar.dart';
import '../circleIcon.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int _selectedTabIndex = 0; // Initially, "Favorites" is selected.
  List ProfileImages = [
    'assets/images/photo.jpg',
    'assets/images/photo.jpg',
    'assets/images/photo.jpg',
    'assets/images/photo.jpg'
  ];
  final List<Color> ProgressBarColor = [
    const Color(0xFFB0D97F),
    const Color(0xFFFFE1AC),
    const Color(0xFF96C2FF),
    const Color(0xFFB0D97F)
  ];
  final List<Color> ProgressLeftColor = [
    const Color(0xFFECF4E5),
    const Color(0xFFF4F0E4),
    const Color(0xFFE8EDF4),
    const Color(0xFFECF4E5)
  ];
  List ProjectHeading = [
    "Unity Dashboard",
    "Flutter App",
    "Blog Writing",
    "Data Pipelines"
  ];
  List ProjectSubHeading = [
    "Design",
    "Development",
    "Content Writing",
    "Data Science"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(
          titleText: "Projects",
        ),
        actions: [
          CircleIcon(
            img: 'assets/icons/Add.png',
            onPressed: () {},
          ),
        ],
        leading: CircleIcon(
          img: 'assets/icons/Stroke.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 202, 209, 221),
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF868D95),
                  ),
                ),
                prefixIcon: const ImageIcon(AssetImage('assets/icons/Search.png')),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF002055),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                buildTabButton("Favorites", 0),
                const SizedBox(
                  width: 7,
                ),
                buildTabButton("Recent", 1),
                const SizedBox(
                  width: 7,
                ),
                buildTabButton("All", 2),
              ],
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                            width: 327,
                            height: 93,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: const Color(0xFFE9F1FF))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 3, left: 16, right: 16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ProjectHeading[index],
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF002055),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 46,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              border: Border.all(
                                                  color:
                                                      ProgressBarColor[index])),
                                          child: Center(
                                            child: Text(
                                              "10/20",
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF002055),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      ProjectSubHeading[index],
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF848A94),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                for (int i = 0;
                                                    i < ProfileImages.length;
                                                    i++)
                                                  Align(
                                                    widthFactor: 0.65,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 13,
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundImage:
                                                            AssetImage(
                                                                ProfileImages[
                                                                    index]),
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              height: 8,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10.0), // Adjust the radius as needed
                                                child: LinearProgressIndicator(
                                                  value: 0.5,
                                                  backgroundColor:
                                                      ProgressLeftColor[index],
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    ProgressBarColor[index],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                            )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Widget buildTabButton(String label, int index) {
    bool isSelected = _selectedTabIndex == index;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF756EF3) : Colors.transparent,
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF002055) : const Color(0xFF848A94),
            ),
          ),
        ),
      ),
    );
  }
}

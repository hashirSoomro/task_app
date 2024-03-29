import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/Screens/sideMenu.dart';
import 'package:task_app/Screens/todayTask.dart';
import '../TitleAppBar.dart';
import '../bottomBar.dart';
import '../circleIcon.dart';
import '../headings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List ProfileImages = [
    'assets/images/photo.jpg',
    'assets/images/photo.jpg',
    'assets/images/photo.jpg'
  ];
  int _currentPage = 0;
  double progress = 0.6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(
          titleText: "Friday, 26",
        ),
        actions: [
          CircleIcon(
            img: 'assets/icons/Notifications.png',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TodayTask()));
            },
          )
        ],
        leading: CircleIcon(
          img: 'assets/icons/Category.png',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SideMenu()));
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: HeadingText(headingText: "Let's make a\nhabit together")),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 140.0,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 10,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  aspectRatio: 2.2,
                  enlargeCenterPage: false,
                  viewportFraction: 79 / 100),
              itemBuilder: (context, index, realIndex) {
                Color containerColor =
                    (index == _currentPage) ? const Color(0xFF756EF3) : Colors.white;
                Color textColorMain = (index == _currentPage)
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF002055);
                Color textColorSub = (index == _currentPage)
                    ? const Color(0xFFC5DAFD)
                    : const Color(0xFFA0BAC5);
                Color textColorSub2 =
                    (index == _currentPage) ? Colors.white : Colors.transparent;
                Color ProgressBarColor = (index == _currentPage)
                    ? const Color.fromARGB(255, 184, 188, 196)
                    : Colors.transparent;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 35.0,
                      ),
                      height: 140,
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(
                        color: containerColor, // Purple color
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded borders
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23, left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Application Design",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: textColorMain,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "UI Design Kit",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: textColorSub,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    for (int i = 0;
                                        i < ProfileImages.length;
                                        i++)
                                      const Align(
                                        widthFactor: 0.8,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 15,
                                          child: CircleAvatar(
                                            radius: 14,
                                            backgroundImage: AssetImage(
                                                'assets/images/photo.jpg'),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Progress",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: textColorSub,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          "50/80",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: textColorSub2,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 5.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the radius as needed
                                        child: LinearProgressIndicator(
                                          value:
                                              0.5, // Set the progress value between 0.0 and 1.0
                                          backgroundColor:
                                              ProgressBarColor, // Background color
                                          valueColor: const AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors.white), // Progress color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
                child: Row(
                  children: [
                    Text(
                      "In Progress",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF002055),
                          height: 1.2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              )
            ],
          ),
          Expanded(
            child: Container(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 13),
                      child: Container(
                        height: 80,
                        width: 327,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: const Color.fromARGB(255, 218, 230, 250))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Productivity Mobile App",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF848A94),
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Create Detail Booking",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF002055),
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "2 min ago",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF848A94),
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: progress,
                                      backgroundColor: const Color(0xFFD1E2FE),
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF756EF3)),
                                    ),
                                    Text(
                                      '${(progress * 100).toStringAsFixed(0)}%',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF002055),
                                          height: 1.2,
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
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

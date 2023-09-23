import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/rendering/box.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.22,
          ),
          child: Text(
            "Friday, 26",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Color(0xFF002055),
                height: 1.2,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(7),
            width: 42.0,
            height: 42.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromARGB(255, 218, 222, 228),
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 1.0,
              child: IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage('assets/icons/Notifications.png'),
                  size: 16,
                ),
                color: Color(0xFF002055),
              ),
            ),
          ),
        ],
        leading: Container(
          margin: EdgeInsets.all(7),
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromARGB(255, 218, 222, 228),
              width: 1.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 1.0,
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/icons/Category.png'),
                size: 16,
              ),
              color: Color(0xFF002055),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Let's make a\nhabit together",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF002055),
                  height: 1.2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 140.0,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 10, // Adjust the number of containers as needed
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  aspectRatio: 2.2, // Adjust the aspect ratio as needed
                  enlargeCenterPage: false,
                  viewportFraction: 76 / 100),
              itemBuilder: (context, index, realIndex) {
                // Calculate the container's color
                Color containerColor =
                    (index == _currentPage) ? Color(0xFF756EF3) : Colors.white;
                Color textColorMain = (index == _currentPage)
                    ? Color(0xFFFFFFFF)
                    : Color(0xFF002055);
                Color textColorSub = (index == _currentPage)
                    ? Color(0xFFC5DAFD)
                    : Color(0xFFA0BAC5);
                Color textColorSub2 =
                    (index == _currentPage) ? Colors.white : Colors.transparent;
                Color ProgressBarColor = (index == _currentPage)
                    ? Color.fromARGB(255, 184, 188, 196)
                    : Colors.transparent;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 35.0,
                    ),
                    height: 140,
                    width: 260,
                    decoration: BoxDecoration(
                      color: containerColor, // Purple color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded borders
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 23, left: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(
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
                                  for (int i = 0; i < ProfileImages.length; i++)
                                    Align(
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
                                    MediaQuery.of(context).size.width * 0.028,
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
                                      SizedBox(
                                        width: 15,
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 90,
                                    height: 5.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the radius as needed
                                      child: LinearProgressIndicator(
                                        value:
                                            0.5, // Set the progress value between 0.0 and 1.0
                                        backgroundColor:
                                            ProgressBarColor, // Background color
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                );
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
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
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Color(0xFF756EF3),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 3, // Adjust the number of containers as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                    child: Container(
                      height: 80,
                      width: 327,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 230, 250))
                          // Change the color as desired
                          ),
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
                            Spacer(),
                            CircularProgressIndicator(
                              value: 0.6,
                              backgroundColor: Color(0xFFD1E2FE),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF756EF3)),
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
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage('assets/icons/home.png'),
                    size: 24,
                    color: Color(0xFF848A94),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage('assets/icons/Folder.png'),
                    size: 24,
                    color: Color(0xFF848A94),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFF756EF3),
                    child: ImageIcon(
                      AssetImage('assets/icons/add.png'),
                      size: 24,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage('assets/icons/chat.png'),
                    size: 24,
                    color: Color(0xFF848A94),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage('assets/icons/profile.png'),
                    size: 24,
                    color: Color(0xFF848A94),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

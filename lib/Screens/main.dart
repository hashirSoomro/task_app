import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../gradientButton.dart';
import 'onboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color customPrimaryColor =
      Color(0xFF756EF3); // Replace with your hex code

  // Create a custom primary swatch
  MaterialColor get customPrimarySwatch =>
      MaterialColor(customPrimaryColor.value, <int, Color>{
        50: customPrimaryColor.withOpacity(0.1),
        100: customPrimaryColor.withOpacity(0.2),
        200: customPrimaryColor.withOpacity(0.3),
        300: customPrimaryColor.withOpacity(0.4),
        400: customPrimaryColor.withOpacity(0.5),
        500: customPrimaryColor.withOpacity(0.6),
        600: customPrimaryColor.withOpacity(0.7),
        700: customPrimaryColor.withOpacity(0.8),
        800: customPrimaryColor.withOpacity(0.9),
        900: customPrimaryColor.withOpacity(1.0),
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager App',
      theme: ThemeData(
        primarySwatch: customPrimarySwatch,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  final Color customSelectedColor = Color(0xFF5451D6);
  final Color customNonSelectedColor = Color(0x665451D6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom:
                MediaQuery.of(context).size.height * 0.45, // 55% of the screen
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/top_corn.png'),
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.45, // Overlaps the first container by 5%
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFFF8F6FF)),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          child: Container(
                            width: _currentPage == index ? 25.0 : 6.0,
                            height: 6.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: _currentPage == index
                                  ? BorderRadius.circular(12.0)
                                  : BorderRadius.circular(5.0),
                              color: _currentPage == index
                                  ? customSelectedColor // Use custom selected color
                                  : customNonSelectedColor, // Use custom non-selected color
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Taskcy',
                      style: GoogleFonts.pollerOne(
                        textStyle: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF756EF3),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      'Building Better\nWorkplaces',
                      style: TextStyle(
                          fontSize: 37,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2F394B)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Create a unique emotional story that\ndescribes better than words',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.8,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8D8D8D).withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GradientButton(
                      onPressed: () {
                        // Add your button's onPressed functionality here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onboard()),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      gradientColors: [Color(0xFF8B78FF), Color(0xFF5451D6)],
                      width: MediaQuery.of(context).size.width *
                          0.85, // Set the width
                      height: 60.0, // Set the height
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

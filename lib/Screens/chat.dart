import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/Screens/taskStatus.dart';
import 'package:task_app/TitleAppBar.dart';
import 'package:task_app/bottomBar.dart';
import 'package:task_app/circleIcon.dart';

class ChatPerson {
  final String name;
  final String imageUrl;
  final String activeStatus;

  ChatPerson(this.name, this.imageUrl, this.activeStatus);
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatPerson> chatMembers = [
    ChatPerson("Alex", "assets/images/person1.png", "Active now"),
    ChatPerson("Team Taskcy", "assets/images/LogoImage.png", "Active 1h ago"),
    ChatPerson("Jefferson", "assets/images/person2.png", "Active 1h ago"),
    ChatPerson("John", "assets/images/person1.png", "Active 7m ago"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(titleText: "Chat"),
        actions: [
          CircleIcon(
              img: "assets/icons/Add.png",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const TaskStatus())));
              })
        ],
        leading: CircleIcon(
            img: "assets/icons/Stroke.png",
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF002055),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(children: [
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
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                          radius: 22,
                          child: Image.asset(chatMembers[index].imageUrl)),
                      title: Text(chatMembers[index].name),
                      subtitle: Text(chatMembers[index].activeStatus),
                      trailing:
                          const ImageIcon(AssetImage("assets/icons/camera.png")));
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFFE9F1FF),
                  thickness: 0.6,
                ),
              ),
            )
          ])),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

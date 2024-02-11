import 'package:flutter/material.dart';

class CircleIcon extends StatefulWidget {
  String img;
  VoidCallback? onPressed;
  CircleIcon({super.key, required this.img, required this.onPressed});

  @override
  State<CircleIcon> createState() => _CircleIconState();
}

class _CircleIconState extends State<CircleIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      width: 42.0,
      height: 42.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 218, 222, 228),
          width: 1.0,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 1.0,
        child: IconButton(
          onPressed: widget.onPressed,
          icon: ImageIcon(
            AssetImage(widget.img),
            size: 16,
          ),
          color: const Color(0xFF002055),
        ),
      ),
    );
  }
}

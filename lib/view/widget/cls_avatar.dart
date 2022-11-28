import 'package:flutter/material.dart';

class ClsAvatar extends StatelessWidget {
  const ClsAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 58, 101, 182),
      maxRadius: 30,
      child: Text(
        "A",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ClsAvatar extends StatelessWidget {
  const ClsAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.deepPurple[200],
      maxRadius: 30,
      child: const Text(
        "A",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

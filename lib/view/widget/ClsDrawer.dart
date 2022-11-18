import 'package:flutter/material.dart';

class ClsDrawer extends StatelessWidget {
  const ClsDrawer({Key? key}) : super(key: key);

  /// @brief Drawer personalizado para vizualizar en multiples ventanas
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[DrawerHeader(child: Text("TODO:Usuario"))],
      ),
    );
  }
}

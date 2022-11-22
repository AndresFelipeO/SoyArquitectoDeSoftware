import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/UsuarioSuscrito.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';

class IntComentario extends StatefulWidget {
  UsuarioSuscrito userCapsula;
  UsuarioSuscrito userLogin;
  int index;
  IntComentario(
      {super.key,
      required this.userCapsula,
      required this.userLogin,
      required this.index});
  @override
  State<IntComentario> createState() => _IntComentarioState(
      userCapsula: userCapsula, userLogin: userLogin, index: index);
}

class _IntComentarioState extends State<IntComentario> {
  UsuarioSuscrito userCapsula;
  UsuarioSuscrito userLogin;
  int index;
  _IntComentarioState(
      {required this.userCapsula,
      required this.userLogin,
      required this.index});

  @override
  void initState() {
    super.initState();
    testWindowSize();
  }

  testWindowSize() async {
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClsAppbar(
        prmTitulo: 'Comentario',
      ),
      drawer: const ClsDrawer(),
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}

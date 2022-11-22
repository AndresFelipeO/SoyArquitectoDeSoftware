import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/Usuario.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/CapsulasContenido.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';

import '../controller/UsuarioSuscrito.dart';

class Perfil extends StatefulWidget {
  UsuarioSuscrito usuario;
  Perfil({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState(usuario: usuario);
}

class _PerfilState extends State<Perfil> {
  UsuarioSuscrito usuario;
  _PerfilState({required this.usuario});

  @override
  void initState() {
    super.initState();
    testWindowSize();
  }

  /// @brief metodo asincrono donde se predefine el tamaño minimo de la ventana de la aplicacion
  testWindowSize() async {
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClsAppbar(
        prmTitulo: 'Perfil',
      ),
      drawer: const ClsDrawer(),
      body: body(),
    );
  }

  Widget body() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccesoRapido(
          usuario: usuario,
        ),
        const VerticalDivider(),
        contenido(),
        const VerticalDivider(),
        const Text("TODO: sugerencias")
      ],
    );
  }

  Widget contenido() {
    return SizedBox(
        width: 600,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: usuario.misCapsulas.length,
              itemBuilder: (context, index) => CapsulasContenido(
                usuerLogin: usuario,
                usuario: usuario,
                index: index,
              ),
            ))
          ],
        ));
  }
}

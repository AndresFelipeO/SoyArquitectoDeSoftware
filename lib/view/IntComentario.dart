import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/UsuarioSuscrito.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/CapsulasContenido.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccesoRapido(
          usuario: userLogin,
        ),
        const VerticalDivider(),
        contenido(),
        const VerticalDivider(),
        const Text("TODO: sugerencias")
      ],
    );
  }
  
  Widget contenido() {return SizedBox(
        width: 600,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CapsulasContenido(usuario: userCapsula, usuerLogin: userLogin, index: index),
              Text("Comentarios",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              comentarioCap(),
              Divider(),
              Expanded(child: ListView.builder(
                itemCount: userCapsula.misCapsulas[index].misComentarios.length,
                itemBuilder: (context, i) =>Column(
                  
          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                               CircleAvatar(
              foregroundImage: const NetworkImage(
                  "https://1.bp.blogspot.com/-08Hd-uA_ODY/WdkJC8aOiII/AAAAAAAAD8o/ioV5zTHh2O4-MVLiDcdiD8WLlnXihWU8QCLcBGAs/s1600/distros%2Bmas%2Bbonitas%2Bde%2Blinux.png"),
              backgroundColor: Colors.deepPurple[200],
              maxRadius: 20,
              child: const Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              userCapsula.misCapsulas[index].misComentarios[i].nombreUsuario,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
                      ],
                    ),
                    SelectableText(userCapsula.misCapsulas[index].misComentarios[i].contenido,
                )
                  ],
                ) ,

              ))
            ],
          ),
        ),
        );}
  Widget comentarioCap()=>Row(
      children: [
          CircleAvatar(
              foregroundImage: const NetworkImage(
                  "https://1.bp.blogspot.com/-08Hd-uA_ODY/WdkJC8aOiII/AAAAAAAAD8o/ioV5zTHh2O4-MVLiDcdiD8WLlnXihWU8QCLcBGAs/s1600/distros%2Bmas%2Bbonitas%2Bde%2Blinux.png"),
              backgroundColor: Colors.deepPurple[200],
              maxRadius: 20,
              child: const Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            ),
        const SizedBox(
            height: 40,
            width: 300,
            child: TextField(
              style: TextStyle(fontSize: 15, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 10),
                  filled: true,
                  fillColor: Colors.white,
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none)),
            ),
          ),
      ],
  );
}
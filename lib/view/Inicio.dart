import 'dart:math';

import 'package:flutter/material.dart';
import 'package:soy_arquitecto/model/Datos.dart';
import 'package:soy_arquitecto/view/Edicion.dart';
import 'package:soy_arquitecto/view/widget/CapsulasContenido.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/ClsAvatar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';
import 'package:desktop_window/desktop_window.dart';
import '../controller/UsuarioSuscrito.dart';

class Inicio extends StatefulWidget {
  UsuarioSuscrito usuario;
  Inicio({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState(usuario: usuario);
}

class _InicioState extends State<Inicio> {
  Datos datos = Datos();
  //cambia el color del IconButton
  bool colorFavorito = false;
  UsuarioSuscrito usuario;
  _InicioState({required this.usuario});
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
        prmTitulo: "Inicio",
      ),
      drawer: const ClsDrawer(),
      body: body(),
    );
  }

  /// @brief lugar donde se va a vizualizar el acceso rapido, contenido y sugerencias de la aplicacion
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

  /// @brief Muestra el contenido de la aplicacion
  /// @note mustra las capsulas de conocimiento y permite agregar una publicacion rapida
  Widget contenido() {
    return SizedBox(
        width: 600,
        child: Column(
          children: [publicacionRapida(), capsulasContenido()],
        ));
  }

  /// @brief Contiene la interfaz grafica de una publicacion rapida
  Widget publicacionRapida() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          child: Row(
            children: [
              ClsAvatar(),
              Container(
                  margin: const EdgeInsets.only(top: 0, left: 30),
                  height: 100,
                  width: 490,
                  child: InkWell(
                    child: TextField(
                      enabled: false,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edicion(
                                      usuario: usuario,
                                    )));
                      },
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 10,
                      decoration: const InputDecoration(
                          labelText: "Agregar una publicación"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edicion(
                                    usuario: usuario,
                                  )));
                    },
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 35),
          // height: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edicion(
                                usuario: usuario,
                              )));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text("Publicar"),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }

  /// @brief Contiene la interfaz grafica de las capsulas de conocimiento
  Widget capsulasContenido() {
    Random random = Random();
    return Expanded(
        child: ListView.builder(
      itemCount: datos.usuariosPrueba.length,
      itemBuilder: ((context, index) => CapsulasContenido(
            usuerLogin: usuario,
            usuario: datos.usuariosPrueba[index],
            index:
                random.nextInt(datos.usuariosPrueba[index].misCapsulas.length),
          )),
    ));
  }
}

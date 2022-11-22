import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/Capsulas.dart';
import 'package:soy_arquitecto/controller/EnsayoCritico.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/ClsAvatar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';
import 'package:desktop_window/desktop_window.dart';

import '../controller/Usuario.dart';
import '../controller/UsuarioSuscrito.dart';

class Edicion extends StatefulWidget {
  UsuarioSuscrito usuario;
  Edicion({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Edicion> createState() => _EdicionState(usuario: usuario);
}

class _EdicionState extends State<Edicion> {
  final controlleTitulo = TextEditingController();
  final controlleCuerpo = TextEditingController();
  UsuarioSuscrito usuario;
  _EdicionState({required this.usuario});
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
        prmTitulo: 'Edicion',
      ),
      drawer: const ClsDrawer(),
      body: body(),
    );
  }

  Widget body() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccesoRapido(),
          const VerticalDivider(),
          edicionContenido(),
          const VerticalDivider(),
          const Text("TODO: sugerencias")
        ],
      );
  Widget edicionContenido() => SizedBox(
        width: 600,
        child: Container(
            margin: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Expanded(
                child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const ClsAvatar(),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controlleTitulo,
                    onTap: () {},
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        labelText: "Titulo de la publicación"),
                  ),
                ),
                TextField(
                  controller: controlleCuerpo,
                  onTap: () {},
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    labelText: "Que deseas compartir",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Capsulas miEnsayo1 = EnsayoCritico(
                            controlleTitulo.text, controlleCuerpo.text);
                        miEnsayo1.publicar(usuario);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text("Publicar"),
                  ),
                ),
              ],
            ))),
      );
}

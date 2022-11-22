import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/Capsulas.dart';
import 'package:soy_arquitecto/controller/EnsayoCritico.dart';
import 'package:soy_arquitecto/controller/Etiqueta.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/ClsAvatar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';
import 'package:desktop_window/desktop_window.dart';

import '../controller/Usuario.dart';
import '../controller/UsuarioSuscrito.dart';
import 'Inicio.dart';

class Edicion extends StatefulWidget {
  UsuarioSuscrito usuario;
  Edicion({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Edicion> createState() => _EdicionState(usuario: usuario);
}

class _EdicionState extends State<Edicion> {
  final controlleTitulo = TextEditingController();
  final controlleCuerpo = TextEditingController();
  final controlleEtiqueta = TextEditingController();
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
          AccesoRapido(
            usuario: usuario,
          ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Inicio(
                                        usuario: usuario,
                                      )));
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const ClsAvatar(),
                  ],
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: controlleTitulo,
                    onTap: () {},
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        labelText: "Titulo de la publicación"),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: TextField(
                    controller: controlleCuerpo,
                    onTap: () {},
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 15,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: "Que deseas compartir",
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: controlleEtiqueta,
                    onTap: () {},
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 10,
                    decoration:
                        const InputDecoration(labelText: "Agregar Etiquetas #"),
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

                        Etiqueta miEtiqueta = Etiqueta(controlleEtiqueta.text);
                        miEnsayo1.agregarEtiqueta(miEtiqueta);
                        controlleTitulo.text = "";
                        controlleCuerpo.text = "";
                        controlleEtiqueta.text = "";
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

import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/capsulas.dart';
import 'package:soy_arquitecto/controller/ensayo_critico.dart';
import 'package:soy_arquitecto/controller/etiqueta.dart';
import 'package:soy_arquitecto/model/datos.dart';
import 'package:soy_arquitecto/view/widget/acceso_rapido.dart';
import 'package:soy_arquitecto/view/widget/cls_appbar.dart';
import 'package:soy_arquitecto/view/widget/cls_avatar.dart';
import 'package:soy_arquitecto/view/widget/cls_drawer.dart';
import '../controller/usuario_suscrito.dart';
import 'Inicio.dart';
import 'Perfil.dart';

class Edicion extends StatefulWidget {
  final UsuarioSuscrito usuario;
  final Datos usuarios;
  const Edicion({Key? key, required this.usuario, required this.usuarios})
      : super(key: key);

  @override
  State<Edicion> createState() => _EdicionState();
}

class _EdicionState extends State<Edicion> {
  final controlleTitulo = TextEditingController();
  final controlleCuerpo = TextEditingController();
  final controlleEtiqueta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClsAppbar(
        prmTitulo: 'Agregar Publicación',
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
            usuario: widget.usuario,
            datos: widget.usuarios,
          ),
          const VerticalDivider(),
          edicionContenido(),
          const VerticalDivider(),
          const Text("TODO: sugerencias")
        ],
      );

  void showSnackBarAlerta(String text, String ans) {
    final snackBar = SnackBar(
      elevation: 10,
      content: Text(text),
      action: SnackBarAction(
        label: ans,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Perfil(
                        usuarios: widget.usuarios,
                        usuario: widget.usuario,
                      )));
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget edicionContenido() => SizedBox(
        width: 600,
        child: Container(
            margin: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
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
                                        usuarioLogin: widget.usuario,
                                        usuarios: widget.usuarios,
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
                        const InputDecoration(labelText: "Agregar Etiqueta #"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controlleTitulo.text != "" &&
                          controlleCuerpo.text != "" &&
                          controlleEtiqueta.text != "") {
                        setState(() {
                          Capsulas miEnsayo1 = EnsayoCritico(
                              controlleTitulo.text, controlleCuerpo.text);
                          miEnsayo1.publicar(widget.usuario);
                          Etiqueta miEtiqueta =
                              Etiqueta(controlleEtiqueta.text);
                          miEnsayo1.agregarEtiqueta(miEtiqueta);
                          controlleTitulo.text = "";
                          controlleCuerpo.text = "";
                          controlleEtiqueta.text = "";
                        });
                        showSnackBarAlerta("Publicación agregada", "ver");
                        return;
                      }
                      showSnackBarAlerta(
                          "Error! no se pudo agregar la publicación", "");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 38, 12, 82)),
                    ),
                    child: const Text("Publicar"),
                  ),
                ),
              ],
            )),
      );
}

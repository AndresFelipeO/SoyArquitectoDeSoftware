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
import 'inicio.dart';
import 'perfil.dart';
import 'package:html_editor_enhanced/html_editor.dart';

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
  final controlleEtiqueta = TextEditingController();
  final HtmlEditorController controllerHtml = HtmlEditorController();

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
      backgroundColor: Colors.deepPurpleAccent[200],
      elevation: 10,
      content: Text(text),
      action: SnackBarAction(
        label: ans,
        textColor: Colors.white,
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
                  child: HtmlEditor(
                    htmlToolbarOptions: const HtmlToolbarOptions(
                      toolbarType: ToolbarType.nativeGrid,
                    ),
                    controller: controllerHtml, //required
                    htmlEditorOptions: const HtmlEditorOptions(
                      hint: "Agregar contenido",
                      shouldEnsureVisible: true,

                      //initalText: "text content initial, if any",
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
                          controlleEtiqueta.text != "") {
                        setState(() async {
                          String? cuerpo = await controllerHtml.getText();
                          Capsulas miEnsayo1 =
                              EnsayoCritico(controlleTitulo.text, cuerpo);
                          miEnsayo1.publicar(widget.usuario);
                          Etiqueta miEtiqueta =
                              Etiqueta(controlleEtiqueta.text);
                          miEnsayo1.agregarEtiqueta(miEtiqueta);
                          controlleTitulo.text = "";
                          controlleEtiqueta.text = "";
                          controllerHtml.setText("");
                          showSnackBarAlerta("Publicación agregada", "ver");
                        });

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

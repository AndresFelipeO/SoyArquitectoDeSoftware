import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/usuario_suscrito.dart';
import 'package:soy_arquitecto/view/widget/acceso_rapido.dart';
import 'package:soy_arquitecto/view/widget/capsulas_contenido.dart';
import 'package:soy_arquitecto/view/widget/cls_appbar.dart';
import 'package:soy_arquitecto/view/widget/cls_drawer.dart';
import '../controller/comentario.dart';
import '../model/datos.dart';

class IntComentario extends StatefulWidget {
  final UsuarioSuscrito userCapsula;
  final UsuarioSuscrito userLogin;
  final Datos datos;
  final int index;
  const IntComentario(
      {super.key,
      required this.userCapsula,
      required this.userLogin,
      required this.index,
      required this.datos});
  @override
  State<IntComentario> createState() => _IntComentarioState();
}

class _IntComentarioState extends State<IntComentario> {
  final controlleComentario = TextEditingController();

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
          usuario: widget.userLogin,
          datos: widget.datos,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [cuerpo(0)],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget
                  .userCapsula.misCapsulas[widget.index].misComentarios.length,
              itemBuilder: (context, i) {
                // if (i == 0) return cuerpo(i);
                return comentarioCompartidos(i);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget cuerpo(int i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CapsulasContenido(
              usuarios: widget.datos,
              usuario: widget.userCapsula,
              usuerLogin: widget.userLogin,
              index: widget.index),
          comentarioCap(),
          const Text("Comentarios",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const Divider(),
        ],
      );

  Widget comentarioCompartidos(int i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Card(
                  child: SizedBox(
                width: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userCapsula.misCapsulas[widget.index]
                          .misComentarios[i].nombreUsuario,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SelectableText(
                      widget.userCapsula.misCapsulas[widget.index]
                          .misComentarios[i].contenido,
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      );

  Widget comentarioCap() => Row(
        children: [
          CircleAvatar(
            foregroundImage: const NetworkImage(
                "https://1.bp.blogspot.com/-08Hd-uA_ODY/WdkJC8aOiII/AAAAAAAAD8o/ioV5zTHh2O4-MVLiDcdiD8WLlnXihWU8QCLcBGAs/s1600/distros%2Bmas%2Bbonitas%2Bde%2Blinux.png"),
            backgroundColor: Colors.deepPurple[200],
            maxRadius: 25,
            child: const Text(
              "A",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              height: 65,
              width: 450,
              child: TextField(
                controller: controlleComentario,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(fontSize: 15, color: Colors.black),
                decoration: const InputDecoration(
                    labelText: "Agregar un comentario",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (controlleComentario.text != "") {
                  widget.userCapsula.misCapsulas[widget.index]
                      .agregarComentario(Comentario(
                          widget.userLogin.nombre, controlleComentario.text));
                  controlleComentario.text = "";
                }
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 38, 12, 82)),
            ),
            child: const Text("Publicar"),
          ),
        ],
      );
}

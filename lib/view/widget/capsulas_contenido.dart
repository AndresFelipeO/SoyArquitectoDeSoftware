import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/usuario_suscrito.dart';
import 'package:soy_arquitecto/view/int_comentario.dart';

import '../../model/datos.dart';

class CapsulasContenido extends StatefulWidget {
  final UsuarioSuscrito usuario;
  final UsuarioSuscrito usuerLogin;
  final int index;
  final Datos usuarios;
  const CapsulasContenido(
      {Key? key,
      required this.usuario,
      required this.usuerLogin,
      required this.index,
      required this.usuarios})
      : super(key: key);

  @override
  State<CapsulasContenido> createState() => _CapsulasContenidoState();
}

class _CapsulasContenidoState extends State<CapsulasContenido> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              foregroundImage: const NetworkImage(
                  "https://1.bp.blogspot.com/-08Hd-uA_ODY/WdkJC8aOiII/AAAAAAAAD8o/ioV5zTHh2O4-MVLiDcdiD8WLlnXihWU8QCLcBGAs/s1600/distros%2Bmas%2Bbonitas%2Bde%2Blinux.png"),
              backgroundColor: Colors.deepPurple[200],
              maxRadius: 30,
              child: const Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              widget.usuario.nombre,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(widget.usuario.misCapsulas[widget.index]
                        .misEtiquetas.isNotEmpty
                    ? widget.usuario.misCapsulas[widget.index].misEtiquetas[0]
                        .nombre
                    : ""))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget.usuario.misCapsulas[widget.index].titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SelectableText(widget.usuario.misCapsulas[widget.index].cuerpo),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IntComentario(
                                userCapsula: widget.usuario,
                                userLogin: widget.usuerLogin,
                                index: widget.index,
                                datos: widget.usuarios,
                              )));
                },
                icon: const Icon(Icons.message_rounded)),
            Text(widget.usuario.misCapsulas[widget.index].misComentarios.length
                .toString())
          ],
        ),
        const Divider()
      ],
    );
  }
}

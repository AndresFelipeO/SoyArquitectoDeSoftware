import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/Usuario.dart';
import 'package:soy_arquitecto/controller/UsuarioSuscrito.dart';

class CapsulasContenido extends StatefulWidget {
  UsuarioSuscrito usuario;
  int index;
  CapsulasContenido({Key? key, required this.usuario, required this.index})
      : super(key: key);

  @override
  State<CapsulasContenido> createState() =>
      _CapsulasContenidoState(usuario: usuario, index: index);
}

class _CapsulasContenidoState extends State<CapsulasContenido> {
  UsuarioSuscrito usuario;
  int index;
  _CapsulasContenidoState({required this.usuario, required this.index});
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
              usuario.nombre,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(usuario.misCapsulas[index].misEtiquetas.length != 0
                    ? usuario.misCapsulas[index].misEtiquetas[0].nombre
                    : ""))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(usuario.misCapsulas[index].titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SelectableText(usuario.misCapsulas[index].cuerpo),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.message_rounded)),
            const Text("40")
          ],
        ),
        Divider()
      ],
    );
  }
}

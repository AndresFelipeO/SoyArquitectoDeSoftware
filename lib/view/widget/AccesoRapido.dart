import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soy_arquitecto/view/Edicion.dart';
import 'package:soy_arquitecto/view/Inicio.dart';
import 'package:soy_arquitecto/view/Perfil.dart';

import '../../controller/UsuarioSuscrito.dart';

class AccesoRapido extends StatelessWidget {
  UsuarioSuscrito usuario;
  AccesoRapido({Key? key, required this.usuario}) : super(key: key);

  /// @brief Contiene la interfaz grafica del acceso rapido
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Row(children: const [
            Icon(
              Icons.home,
              size: 40,
            ),
            Text(
              "Inicio",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Inicio(
                          usuario: usuario,
                        )));
          },
        ),
        InkWell(
          child: Row(children: const [
            Icon(
              Icons.people_outline_outlined,
              size: 40,
            ),
            Text(
              "Perfil",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Perfil(
                          usuario: usuario,
                        )));
          },
        ),
        Text(" "),
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: const Text("Agregar Publicación"),
        ),
      ],
    );
  }
}

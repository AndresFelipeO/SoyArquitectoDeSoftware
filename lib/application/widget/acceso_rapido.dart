import 'package:flutter/material.dart';
import 'package:soy_arquitecto/infrastructure/datos.dart';
import 'package:soy_arquitecto/application/edicion.dart';
import 'package:soy_arquitecto/application/inicio.dart';
import 'package:soy_arquitecto/application/perfil.dart';
import '../../domain/usuario_suscrito.dart';

class AccesoRapido extends StatelessWidget {
  final UsuarioSuscrito usuario;
  final Datos datos;
  const AccesoRapido({Key? key, required this.usuario, required this.datos})
      : super(key: key);

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
              color: Color.fromARGB(255, 38, 12, 82),
            ),
            Text(
              "Inicio",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 38, 12, 82)),
            )
          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Inicio(
                          usuarioLogin: usuario,
                          usuarios: datos,
                        )));
          },
        ),
        InkWell(
          child: Row(children: const [
            Icon(
              Icons.people_outline_outlined,
              size: 40,
              color: Color.fromARGB(255, 38, 12, 82),
            ),
            Text(
              "Perfil",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 38, 12, 82)),
            )
          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Perfil(
                          usuarios: datos,
                          usuario: usuario,
                        )));
          },
        ),
        const Text(" "),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Edicion(
                          usuario: usuario,
                          usuarios: datos,
                        )));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 38, 12, 82)),
          ),
          child: const Text("Agregar Publicación"),
        ),
      ],
    );
  }
}

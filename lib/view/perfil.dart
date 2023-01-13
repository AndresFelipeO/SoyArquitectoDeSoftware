import 'package:flutter/material.dart';
import 'package:soy_arquitecto/view/widget/acceso_rapido.dart';
import 'package:soy_arquitecto/view/widget/capsulas_contenido.dart';
import 'package:soy_arquitecto/view/widget/cls_appbar.dart';
import 'package:soy_arquitecto/view/widget/cls_drawer.dart';

import '../controller/usuario_suscrito.dart';
import '../model/datos.dart';

class Perfil extends StatefulWidget {
  final UsuarioSuscrito usuario;
  final Datos usuarios;
  const Perfil({Key? key, required this.usuario, required this.usuarios})
      : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClsAppbar(
        prmTitulo: 'Perfil',
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
          usuario: widget.usuario,
          datos: widget.usuarios,
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
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: widget.usuario.misCapsulas.length,
              itemBuilder: (context, index) => CapsulasContenido(
                usuarios: widget.usuarios,
                usuerLogin: widget.usuario,
                usuario: widget.usuario,
                index: index,
              ),
            ))
          ],
        ));
  }
}

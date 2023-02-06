import 'package:flutter/material.dart';
import 'package:soy_arquitecto/domain/usuario_suscrito.dart';
import 'package:soy_arquitecto/infrastructure/datos.dart';
import 'package:soy_arquitecto/application/inicio.dart';
import 'package:soy_arquitecto/infrastructure/usuario_aleatorios.dart';

void main(List<String> args) {
  Datos userHot = UsuariosAleatorios();
  userHot.obtenerDatos();
  UsuarioSuscrito user1 = UsuarioSuscrito("Santiiii");
  runApp(MaterialApp(
    title: "Soy Arquitecto",
    home: Inicio(
      usuarioLogin: user1,
      usuarios: userHot,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

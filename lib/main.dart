import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/usuario_suscrito.dart';
import 'package:soy_arquitecto/model/datos.dart';
import 'package:soy_arquitecto/view/Inicio.dart';

void main(List<String> args) {
  Datos userHot = Datos();
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

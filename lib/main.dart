import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/UsuarioSuscrito.dart';
import 'package:soy_arquitecto/view/Inicio.dart';

void main(List<String> args) {
  UsuarioSuscrito user1 = UsuarioSuscrito("Santiiii");
  runApp(MaterialApp(
    title: "Soy Arquitecto",
    home: Inicio(usuario: user1),
    debugShowCheckedModeBanner: false,
  ));
}
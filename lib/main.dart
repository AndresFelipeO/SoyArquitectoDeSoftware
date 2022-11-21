import 'package:flutter/material.dart';
import 'package:soy_arquitecto/controller/Usuario.dart';
import 'package:soy_arquitecto/controller/UsuarioSuscrito.dart';
import 'package:soy_arquitecto/view/Inicio.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    title: "Soy Arquitecto",
    home: Inicio(),
    debugShowCheckedModeBanner: false,
  ));
}

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:soy_arquitecto/controller/Comentario.dart';
import 'package:soy_arquitecto/controller/EnsayoCritico.dart';

import '../controller/UsuarioSuscrito.dart';

class Datos {
  List<UsuarioSuscrito> usuariosPrueba = [
    UsuarioSuscrito("Daniela"),
    UsuarioSuscrito("Carito"),
    UsuarioSuscrito("Santi"),
  ];
  Datos() {
    quemarDatos();
  }

  quemarDatos() {
    for (int i = 0; i < usuariosPrueba.length; i++) {
      EnsayoCritico ensayo = EnsayoCritico(
          lorem(paragraphs: 1, words: 2), lorem(paragraphs: 4, words: 80));
      ensayo.publicar(usuariosPrueba[i]);
      Comentario miCometario =
          Comentario(usuariosPrueba[1].nombre, lorem(paragraphs: 1, words: 2));
      ensayo.agregarComentario(miCometario);
    }
  }
}

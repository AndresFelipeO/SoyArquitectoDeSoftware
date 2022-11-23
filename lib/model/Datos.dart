import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:soy_arquitecto/controller/comentario.dart';
import 'package:soy_arquitecto/controller/ensayo_critico.dart';
import '../controller/usuario_suscrito.dart';

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
          Comentario(usuariosPrueba[1].nombre, lorem(paragraphs: 2, words: 50));
      ensayo.agregarComentario(miCometario);
    }
  }
}

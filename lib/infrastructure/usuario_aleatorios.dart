import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:soy_arquitecto/domain/comentario.dart';
import 'package:soy_arquitecto/domain/ensayo_critico.dart';
import 'package:soy_arquitecto/infrastructure/datos.dart';
import '../domain/usuario_suscrito.dart';

class UsuariosAleatorios implements Datos {
  @override
  List<UsuarioSuscrito> usuariosSuscritos = [
    UsuarioSuscrito("Daniela"),
    UsuarioSuscrito("Carito"),
    UsuarioSuscrito("Santi"),
  ];

  @override
  obtenerDatos() {
    for (int i = 0; i < usuariosSuscritos.length; i++) {
      EnsayoCritico ensayo = EnsayoCritico(
          lorem(paragraphs: 1, words: 2), lorem(paragraphs: 4, words: 80));
      ensayo.publicar(usuariosSuscritos[i]);
      Comentario miCometario = Comentario(
          usuariosSuscritos[1].nombre, lorem(paragraphs: 2, words: 50));
      ensayo.agregarComentario(miCometario);
    }
  }
}

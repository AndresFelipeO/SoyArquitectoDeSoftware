import 'Usuario.dart';
import 'UsuarioSuscrito.dart';
import 'Comentario.dart';
import 'Etiqueta.dart';

abstract class Capsulas {
  String titulo;
  List<Comentario> misComentarios = [];
  late List<Etiqueta> misEtiquetas = [];

  ///@brief Constructor
  Capsulas(this.titulo);
  //CRUD
  void publicar(UsuarioSuscrito user);
  void eliminar();
  void modificar();
  void editarCapsula();
  void agregarEtiqueta(Etiqueta prmEtiqueta);
  void agregarComentario(Comentario prmComentario);
}

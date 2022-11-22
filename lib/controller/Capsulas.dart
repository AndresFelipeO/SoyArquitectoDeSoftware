import 'Usuario.dart';
import 'UsuarioSuscrito.dart';
import 'Comentario.dart';
import 'Etiqueta.dart';

abstract class Capsulas {
  String titulo;
  String cuerpo;
  List<Comentario> misComentarios = [];
  List<Etiqueta> misEtiquetas = [];

  ///@brief Constructor
  Capsulas(this.titulo, this.cuerpo);
  //CRUD
  void publicar(UsuarioSuscrito user);
  void eliminar();
  void modificar();
  void editarCapsula();
  void agregarEtiqueta(Etiqueta prmEtiqueta);
  void agregarComentario(Comentario prmComentario);
}

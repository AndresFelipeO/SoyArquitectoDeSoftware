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

  ///@brief Publicar la capsula de conocimiento
  void publicar(UsuarioSuscrito user);

  ///@brief eliminar la capsula de conocimiento
  void eliminar();

  ///@brief modificar la capsula de conocimiento
  void modificar();

  ///@brief modificar la capsula de conocimiento
  void editarCapsula();

  ///@brief agregar la etiquea a capsula de conocimiento
  void agregarEtiqueta(Etiqueta prmEtiqueta);

  ///@brief agregar comentario a la capsula de conocimiento
  void agregarComentario(Comentario prmComentario);
}

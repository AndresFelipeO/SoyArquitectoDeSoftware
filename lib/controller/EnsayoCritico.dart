import 'Capsulas.dart';
import 'UsuarioSuscrito.dart';
import 'Comentario.dart';
import 'Etiqueta.dart';

class EnsayoCritico extends Capsulas {
  ///@brief Contructor parametrizado
  ///@param titulo, titulo del ensayo critico
  ///@param parrafo, parrafo del ensayo critico

  EnsayoCritico(super.titulo, super.parrafo);

  @override
  void publicar(UsuarioSuscrito user) {
    user.agregarCapsula(this);
  }

  @override
  void eliminar() {}

  @override
  void modificar() {}

  ///@brief Editar la capsula de conocimiento
  ///@param
  ///@param
  @override
  void editarCapsula() {
    // ignore: todo
    //TODO
  }

  @override
  void agregarEtiqueta(Etiqueta prmEtiqueta) {
    misEtiquetas.add(prmEtiqueta);
  }

  @override
  void agregarComentario(Comentario prmComentario) {
    misComentarios.add(prmComentario);
  }
}

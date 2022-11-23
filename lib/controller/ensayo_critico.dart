import 'package:soy_arquitecto/controller/comentario.dart';
import 'package:soy_arquitecto/controller/etiqueta.dart';
import 'capsulas.dart';
import 'usuario_suscrito.dart';

class EnsayoCritico extends Capsulas {
  ///@brief Contructor parametrizado
  ///@param titulo, titulo del ensayo critico
  ///@param parrafo, parrafo del ensayo critico

  EnsayoCritico(super.titulo, super.parrafo);

  ///@brief Publicar la capsula de conocimiento
  ///@param  user,  usuario suscrito
  @override
  void publicar(UsuarioSuscrito user) {
    user.agregarCapsula(this);
  }

  ///@brief eliminar la capsula de conocimiento
  @override
  void eliminar() {}

  ///@brief modificar la capsula de conocimiento
  @override
  void modificar() {}

  ///@brief Editar la capsula de conocimiento
  @override
  void editarCapsula() {
    // ignore: todo
    //TODO
  }

  ///@brief Agregar Etiqueta a la capsula de conocimiento
  ///@param prmEtiqueta, objeto etiqueta
  @override
  void agregarEtiqueta(Etiqueta prmEtiqueta) {
    misEtiquetas.add(prmEtiqueta);
  }

  ///@brief Agregar Comentario a la capsula de conocimiento
  ///@param  prmComentario, objeto comentario
  @override
  void agregarComentario(Comentario prmComentario) {
    misComentarios.add(prmComentario);
  }
}

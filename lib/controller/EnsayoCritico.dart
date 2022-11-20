import 'Capsulas.dart';
import 'UsuarioSuscrito.dart';

class EnsayoCritico extends Capsulas {
  String parrafo;

  ///@brief Contructor parametrizado
  ///@param titulo, titulo del ensayo critico
  ///@param parrafo, parrafo del ensayo critico

  EnsayoCritico(super.titulo, this.parrafo);

  @override
  void publicar(UsuarioSuscrito user) {
    user.agregarCapsula(this);
  }

  @override
  void eliminar() {}
  @override
  void modificar() {}
}

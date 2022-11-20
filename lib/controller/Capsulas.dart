import 'Usuario.dart';
import 'UsuarioSuscrito.dart';

abstract class Capsulas {
  String titulo;

  ///@brief Constructor
  Capsulas(this.titulo);
  //CRUD
  void publicar(UsuarioSuscrito user);
  void eliminar();
  void modificar();
}

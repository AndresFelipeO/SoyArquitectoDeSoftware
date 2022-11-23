import 'package:soy_arquitecto/controller/capsulas.dart';

import 'usuario.dart';

class UsuarioSuscrito extends Usuario {
  List<Capsulas> misCapsulas = [];
  UsuarioSuscrito(super.nombre);

  ///@brief agregarCapsula agrega una capsula
  ///@param prmCapsulas, objeto de tipo capsula
  void agregarCapsula(Capsulas prmCapsulas) {
    misCapsulas.add(prmCapsulas);
  }
}

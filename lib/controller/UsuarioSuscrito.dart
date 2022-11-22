import 'package:soy_arquitecto/controller/Capsulas.dart';
import 'package:soy_arquitecto/controller/EnsayoCritico.dart';

import 'Usuario.dart';

class UsuarioSuscrito extends Usuario {
  List<Capsulas> misCapsulas = [];
  UsuarioSuscrito(super.nombre);

  ///@brief agregarCapsula agrega una capsula
  ///@param prmCapsulas, objeto de tipo capsula
  void agregarCapsula(Capsulas prmCapsulas) {
    misCapsulas.add(prmCapsulas);
  }
}

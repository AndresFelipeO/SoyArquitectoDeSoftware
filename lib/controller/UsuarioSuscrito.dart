import 'package:soy_arquitecto/controller/Capsulas.dart';
import 'package:soy_arquitecto/controller/EnsayoCritico.dart';

import 'Usuario.dart';

class UsuarioSuscrito extends Usuario {
  late List<Capsulas> misCapsulas;

  void agregarCapsula(Capsulas prmCapsulas) {
    misCapsulas.add(prmCapsulas);
  }
  /*List<Capsulas> getCapsulas(){
    return this.misCapsulas;
  }*/
}

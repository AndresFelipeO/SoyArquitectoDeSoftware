import 'package:soy_arquitecto/domain/usuario_suscrito.dart';

abstract class Datos {
  late List<UsuarioSuscrito> usuariosSuscritos;
  obtenerDatos();
}

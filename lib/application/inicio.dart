import 'dart:math';
import 'package:flutter/material.dart';
import 'package:soy_arquitecto/infrastructure/datos.dart';
import 'package:soy_arquitecto/application/edicion.dart';
import 'package:soy_arquitecto/application/widget/capsulas_contenido.dart';
import 'package:soy_arquitecto/application/widget/cls_appbar.dart';
import 'package:soy_arquitecto/application/widget/acceso_rapido.dart';
import 'package:soy_arquitecto/application/widget/cls_avatar.dart';
import 'package:soy_arquitecto/application/widget/cls_drawer.dart';
import '../domain/usuario_suscrito.dart';

class Inicio extends StatefulWidget {
  final UsuarioSuscrito usuarioLogin;
  final Datos usuarios;
  const Inicio({Key? key, required this.usuarioLogin, required this.usuarios})
      : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //cambia el color del IconButton
  bool colorFavorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClsAppbar(
        prmTitulo: "Inicio",
      ),
      drawer: const ClsDrawer(),
      body: body(),
    );
  }

  /// @brief lugar donde se va a vizualizar el acceso rapido, contenido y sugerencias de la aplicacion
  Widget body() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccesoRapido(
          usuario: widget.usuarioLogin,
          datos: widget.usuarios,
        ),
        const VerticalDivider(),
        contenido(),
        const VerticalDivider(),
        const Text("TODO: sugerencias")
      ],
    );
  }

  /// @brief Muestra el contenido de la aplicacion
  /// @note mustra las capsulas de conocimiento y permite agregar una publicacion rapida
  Widget contenido() {
    return SizedBox(
      width: 600,
      child: contenidoPublicaciones(),
    );
  }

  /// @brief Contiene la interfaz grafica de una publicacion rapida
  Widget publicacionRapida() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          child: Row(
            children: [
              const ClsAvatar(),
              Container(
                  margin: const EdgeInsets.only(top: 0, left: 30),
                  height: 100,
                  width: 490,
                  child: InkWell(
                    child: TextField(
                      enabled: false,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edicion(
                                      usuario: widget.usuarioLogin,
                                      usuarios: widget.usuarios,
                                    )));
                      },
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 10,
                      decoration: const InputDecoration(
                          labelText: "Agregar una publicación"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edicion(
                                    usuario: widget.usuarioLogin,
                                    usuarios: widget.usuarios,
                                  )));
                    },
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 35),
          // height: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edicion(
                                usuario: widget.usuarioLogin,
                                usuarios: widget.usuarios,
                              )));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 38, 12, 82)),
                ),
                child: const Text("Publicar"),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }

  /// @brief Contiene la interfaz grafica de las capsulas de conocimiento
  Widget contenidoPublicaciones() {
    Random random = Random();
    return ListView.builder(
      itemCount: widget.usuarios.usuariosSuscritos.length,
      itemBuilder: ((context, index) {
        if (index == 0) return cuerpo(index, random);
        return CapsulasContenido(
          usuarios: widget.usuarios,
          usuerLogin: widget.usuarioLogin,
          usuario: widget.usuarios.usuariosSuscritos[index],
          index: random.nextInt(
              widget.usuarios.usuariosSuscritos[index].misCapsulas.length),
        );
      }),
    );
  }

  /// @brief Coloca las plicaciones rapidas de primero y solo las muestra una vez
  Widget cuerpo(int index, Random random) => Column(
        children: [
          publicacionRapida(),
          CapsulasContenido(
            usuarios: widget.usuarios,
            usuerLogin: widget.usuarioLogin,
            usuario: widget.usuarios.usuariosSuscritos[index],
            index: random.nextInt(
                widget.usuarios.usuariosSuscritos[index].misCapsulas.length),
          )
        ],
      );
}

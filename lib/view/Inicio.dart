import 'package:flutter/material.dart';
import 'package:soy_arquitecto/view/Edicion.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
import 'package:soy_arquitecto/view/widget/AccesoRapido.dart';
import 'package:soy_arquitecto/view/widget/ClsAvatar.dart';
import 'package:soy_arquitecto/view/widget/ClsDrawer.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //cambia el color del IconButton
  bool colorFavorito = false;

  @override
  void initState() {
    super.initState();
    testWindowSize();
  }

  /// @brief metodo asincrono donde se predefine el tamaño minimo de la ventana de la aplicacion
  testWindowSize() async {
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

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
        AccesoRapido(),
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
        child: Column(
          children: [publicacionRapida(), capsulasContenido()],
        ));
  }

  /// @brief Contiene la interfaz grafica de una publicacion rapida
  Widget publicacionRapida() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          child: Row(
            children: [
              ClsAvatar(),
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
                                builder: (context) => const Edicion()));
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
                              builder: (context) => const Edicion()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Edicion()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
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
  Widget capsulasContenido() {
    return Expanded(
        child: ListView(
      children: [
        Row(
          children: [
            CircleAvatar(
              foregroundImage: const NetworkImage(
                  "https://1.bp.blogspot.com/-08Hd-uA_ODY/WdkJC8aOiII/AAAAAAAAD8o/ioV5zTHh2O4-MVLiDcdiD8WLlnXihWU8QCLcBGAs/s1600/distros%2Bmas%2Bbonitas%2Bde%2Blinux.png"),
              backgroundColor: Colors.deepPurple[200],
              maxRadius: 30,
              child: const Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text(
              "  Linus Tolvar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: () {}, child: const Text("#SistemasOperativos"))
          ],
        ),
        SelectableText(lorem(paragraphs: 2, words: 60)),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    colorFavorito = !colorFavorito;
                  });
                },
                icon: Icon(Icons.favorite_rounded,
                    color: !colorFavorito ? Colors.red : Colors.black)),
            const Text("122"),
            IconButton(onPressed: () {}, icon: Icon(Icons.message_rounded)),
            const Text("40")
          ],
        ),
        Divider()
      ],
    ));
  }
}

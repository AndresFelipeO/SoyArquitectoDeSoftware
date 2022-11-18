import 'package:flutter/material.dart';
import 'package:soy_arquitecto/view/widget/ClsAppbar.dart';
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
      appBar: ClsAppBar(),
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
        accesoRapido(),
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
              CircleAvatar(
                backgroundColor: Colors.deepPurple[200],
                maxRadius: 30,
                child: const Text(
                  "A",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, left: 30),
                height: 100,
                width: 490,
                child: const TextField(
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  decoration:
                      InputDecoration(labelText: "Agregar una publicación"),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 90)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.image_rounded,
                  ),
                  iconSize: 35,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.video_camera_back_rounded),
                    iconSize: 35),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_applications_sharp),
                    iconSize: 35),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Publicar"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            )
          ],
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

  /// @brief Contiene la interfaz grafica del acceso rapido
  Widget accesoRapido() {
    return Column(
      children: [
        InkWell(
          child: Row(children: const [
            Icon(
              Icons.home,
              size: 40,
            ),
            Text(
              "Inicio",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ]),
          onTap: () {},
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccesoRapido extends StatelessWidget {
  const AccesoRapido({Key? key}) : super(key: key);

  /// @brief Contiene la interfaz grafica del acceso rapido
  @override
  Widget build(BuildContext context) {
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

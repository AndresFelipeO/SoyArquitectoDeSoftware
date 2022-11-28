import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClsAppbar extends AppBar {
  String prmTitulo;
  ClsAppbar({Key? key, required this.prmTitulo}) : super(key: key);

  @override
  State<ClsAppbar> createState() => _ClsAppbarState();
}

class _ClsAppbarState extends State<ClsAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      flexibleSpace: Container(
          decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 102, 25, 78),
              Color.fromARGB(255, 49, 110, 179),
              Color.fromARGB(255, 48, 28, 119),
            ]),
      )),
      title: Text(widget.prmTitulo),
      actions: const [
        //crea y acomoda el buscador del appbar
        Center(
          widthFactor: 1.1,
          child: SizedBox(
            height: 40,
            width: 300,
            child: TextField(
              style: TextStyle(fontSize: 15, color: Colors.black),
              decoration: InputDecoration(
                  labelText: "TODO:Buscador",
                  contentPadding:
                      EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 10),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon:
                      IconButton(onPressed: null, icon: Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none)),
            ),
          ),
        )
      ],
    );
  }
}

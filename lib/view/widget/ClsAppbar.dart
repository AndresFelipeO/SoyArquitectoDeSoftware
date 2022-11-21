import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClsAppbar extends AppBar {
  String prmTitulo;
  ClsAppbar({Key? key, required this.prmTitulo}) : super(key: key);

  @override
  State<ClsAppbar> createState() => _ClsAppbarState(prmTitulo: prmTitulo);
}

class _ClsAppbarState extends State<ClsAppbar> {
  String prmTitulo;
  _ClsAppbarState({required this.prmTitulo});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      flexibleSpace: Center(
          child: Text(
        prmTitulo,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
      centerTitle: false,
      backgroundColor: Colors.black,
      title: const Icon(
        Icons.computer_rounded,
      ),
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

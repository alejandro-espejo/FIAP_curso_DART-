// Importar a biblioteca do flutter
import 'package:app_hello4/TelaInicial.dart';
import 'package:flutter/material.dart';


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Retornou o widget
    //return Container();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: TelaInicial()
    );
  }


}

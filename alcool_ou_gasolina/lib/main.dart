import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final alcool = TextEditingController();
  final gasolina = TextEditingController();

   
  String resultado = "";
  double res = 0.0;
  
  void _calcular() {
    double a = double.parse(alcool.text);
    double g = double.parse(gasolina.text);
    res = a / g;

    if (res <= 0.7) {
      resultado = 'Escolha o Álcool';
    } else if(res > 0.7) {
      resultado = 'Escolha a Gasolina';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15,),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  Images.alcool_ou_gasolina,
                  width: 120,
                  height: 120,
                ),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration (
                    labelText: 'Digite o Preço do Álcool:',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: alcool,
            
                ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                  labelText: 'Digite o Preço da Gasolina:',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                controller: gasolina,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20,),
                  child: Container(
                    height: 50,
                    width: size,
                    child: ElevatedButton(
                      onPressed: _calcular,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple.shade800,
                      ),
                      child: Text('Verificar', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text (
                    '$resultado',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.teal, fontSize:22, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
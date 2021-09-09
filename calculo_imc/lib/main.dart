import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String resultado = '';
  double imc = 0.0;

  void _calcular() {
    double p = double.parse(peso.text);
    double a = double.parse(altura.text);

    imc = p / (a * a);

    if(imc < 18.5) {
      resultado = 'Abaixo do peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      resultado = 'Peso Normal';
    } else if (imc >= 25 && imc <= 29.9) {
      resultado = 'Sobrepeso';
    } else if (imc >= 30 && imc <=34.9) {
      resultado = 'Obesidade Grau I';
    } else if (imc >= 35 && imc <= 39.9) {
      resultado = 'Obesidade Grau II';
    } else if (imc >= 40) {
      resultado = 'Obesidade Grau III ou Mórbida';
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar (
        title: Text('Calculo IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  Images.imc,
                  width: 100,
                  height: 100,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                  labelText: 'Peso:',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
                controller: peso,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration (
                  labelText: 'Altura:',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
                controller: altura,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Container(
                  height: 40,
                  width: size,
                  child: ElevatedButton(
                    onPressed: _calcular,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
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
        )
      ),
    );
  }
}

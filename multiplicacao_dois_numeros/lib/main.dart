import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
  final numero1 = TextEditingController();
  final numero2 = TextEditingController();

  String resultado = "";
  
  void _calcular() {
    double n1 = double.parse(numero1.text);
    double n2 = double.parse(numero2.text);
    resultado = 'Resultado: ${n1 * n2}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplicando dois números'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15,),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                  labelText: 'Digite o 1º numero:',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                controller: numero1,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                  labelText: 'Digite o 2º numero:',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                controller: numero2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Container(
                  height: 40,
                  width: size,
                  child: ElevatedButton(
                    onPressed: _calcular,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade800,
                    ),
                    child: Text('Calcular', style: TextStyle(color: Colors.white, fontSize: 20)),
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
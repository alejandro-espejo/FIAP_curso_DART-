import 'package:flutter/material.dart';
import 'dart:math';
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

  var n = '';
  void _aleatorio() {
    n = Random().nextInt(10).toString();
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo de nº aleatório'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                    Images.interrogacao,
                    width: 100,
                    height: 100,
                  )
              ),
              Text('Pense em um nº de 0 a 10', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20)),
              Text('$n', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Container(
                  height: 40,
                  width: size,
                  child: ElevatedButton(
                    onPressed: _aleatorio,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: Text('Descobrir', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
            
          ),
        ),
      ),
    );
  }

}
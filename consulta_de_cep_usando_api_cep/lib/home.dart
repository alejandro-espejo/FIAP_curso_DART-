import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String infoEndereco = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 8,
                validator: (value) {
                  String pattern = r'([0-9]{8})';
                  RegExp regExp = RegExp(pattern);
                  if(value == null || value.isEmpty) {
                    return 'O campo não pode estar vazio';
                  } else if(!regExp.hasMatch(value)) {
                    return 'Digite um valor valido';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Digite o CEP:",
                  labelStyle: TextStyle(color: Colors.red),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 25,
                ),
                controller: cepController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      _recuperarCep();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                  child: const Text(
                    "Obter Endereço", 
                  ),
                ),
              ),
              Text(infoEndereco),
            ],
          ),
        ),
      ),
    );
  }

  _recuperarCep() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      infoEndereco = ' Logradouro: $logradouro \n Bairro: $bairro \n Cidade: $localidade \n Estado: $uf';
    });
  }
}
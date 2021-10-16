import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gitController = TextEditingController();
  String? infoUsuarioGit = '';
  final _formKey = GlobalKey<FormState>();
  String? imagemUsuarioGit = 'https://avatars.githubusercontent.com/u/57818418?v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil dos Devs'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Image.network(
                imagemUsuarioGit ?? 'https://avatars.githubusercontent.com/u/57818418?v=4',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                        margin: const EdgeInsets.only( top: 10),
                        width: 270,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O campo não pode estar vazio';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration (
                            labelText: "Digite o usuario do GIT:",
                            labelStyle: TextStyle(color: Colors.blue.shade800),
                          ),
                          controller: gitController,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.only(left: 10, top: 6,),
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.check_box,
                          ),
                          iconSize: 50,
                          color: Colors.green,
                          splashColor: Colors.white,
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              _recuperarUsuarioGit();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(infoUsuarioGit ?? "")
              ),
            ],
          ),
        ),
      ),
    );
  }

  _recuperarUsuarioGit() async {
    String url = 'https://api.github.com/users/${gitController.text}';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    
    String? id = retorno["id"].toString();
    String? login = retorno["login"];
    String? publicRepos = retorno["public_repos"].toString();
    String? createdAt = retorno["created_at"];
    String? followers = retorno["followers"].toString();
    String? following = retorno["following"].toString();
    String? urlImagem = retorno["avatar_url"];
    
    if(login == null) {
      infoUsuarioGit = 'Usuário Não Encontrado';
    } else {
      infoUsuarioGit = ' Id: $id \n Login: $login \n Repositórios: $publicRepos \n Criado em: $createdAt \n Seguidores: $followers \n Seguindo: $following';
    }
    
    imagemUsuarioGit = urlImagem;
    setState(() {});
  }
}
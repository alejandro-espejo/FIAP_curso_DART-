import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas_api/model/tarefa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  List<Tarefa> _tarefas = <Tarefa>[];

  _exibirTelaCadastro({Tarefa? tarefa}) {
    String textoSalvarAtualizar = '';
    if (tarefa == null) {
      //salvando
      _tituloController.text = '';
      _descricaoController.text = '';
      textoSalvarAtualizar = 'Salvar';
    } else {
      //atualizar
      _tituloController.text = tarefa.title;
      _descricaoController.text = tarefa.description;
      textoSalvarAtualizar = 'Atualizar';
    }

    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('$textoSalvarAtualizar tarefa'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Título', 
                    hintText: 'Digite título...'
                  ),
                ),
                TextField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição', 
                    hintText: 'Digite descrição...'
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
              TextButton(
                onPressed: () {
                  //salvar
                  _salvarAtualizarTarefa(tarefaSelecionada: tarefa);
          
                  Navigator.pop(context);
                },
                child: Text(textoSalvarAtualizar)
              )
            ],
          ),
        );
      }
    );
  }

  _recuperarTarefas() async {
    http.Response response =
        await http.get(Uri.parse('https://tarefa-backend.herokuapp.com/tasks'));

    var dadosJson = json.decode(response.body);

    List<Tarefa> tarefas = <Tarefa>[];

    for (var tarefa in dadosJson) {
      Tarefa t = Tarefa(id: tarefa["id"], title: tarefa["title"], description: tarefa["description"],);
      tarefas.add(t);
    }
    setState(() {
      _tarefas = tarefas;
    });
  }

  _salvarAtualizarTarefa({Tarefa? tarefaSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if (tarefaSelecionada == null) {
      // Salva no banco
      Tarefa tarefa = Tarefa(title: titulo, description: descricao);
      await _inserirTarefa(tarefa);
    } else {
      // Atualiza no banco
      Tarefa atualizaTarefa = Tarefa(
        id: tarefaSelecionada.id,
        title: titulo, 
        description: descricao
      );
     await _atualizarTarefa(atualizaTarefa);
    }

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarTarefas();
  }

  _inserirTarefa(Tarefa tarefa) async {
    http.Response response = await http.post(
        Uri.parse('https://tarefa-backend.herokuapp.com/tasks'),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: json.encode(tarefa.toMap()));
    return response.statusCode;
  }

  _atualizarTarefa(Tarefa tarefa) async {
    String url = 'https://tarefa-backend.herokuapp.com/tasks/${tarefa.id}';

    var corpo = json.encode(tarefa.toMap());

    //http.Response response = await http.put(Uri.parse(url),
    await http.put(
      Uri.parse(url),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo
    );

    await _recuperarTarefas();
  }

  _removerTarefa(int id) async {
    String url = 'https://tarefa-backend.herokuapp.com/tasks/$id';

    //http.Response response = await http.delete(Uri.parse(url));
    await http.delete(Uri.parse(url));

    await _recuperarTarefas();
  }

  @override
  void initState() {
    super.initState();
    _recuperarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas tarefas'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = _tarefas[index];

                    return Card(
                      child: ListTile(
                        title: Text(tarefa.title),
                        subtitle: Text(tarefa.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(tarefa: tarefa);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerTarefa(tarefa.id!);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                )
              )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}

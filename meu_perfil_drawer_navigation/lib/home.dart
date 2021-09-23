import 'package:flutter/material.dart';
import 'package:meu_perfil_drawer_navigation/experiencia.dart';
import 'package:meu_perfil_drawer_navigation/formacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _title = 'Pessoal';
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _body(),
        drawer: Drawer(
          child: ListView(
            children: [
              //const FlutterLogo(size: 100),
              _foto('perfil.png'),
              const Center(child: Text('Alejandro Yujra')),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Pessoal'),
                subtitle: const Text('Sobre mim'),
                //trailing: const Icon(Icons.person),
                onTap: () {
                  setState(() {
                    _title = 'Pessoal';
                    _currentPage = 1;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.manage_accounts),
                title: const Text('Formação'),
                //subtitle: const Text(''),
                //trailing: const Icon(Icons.manage_accounts),
                onTap: () {
                  setState(() {
                    _title = 'Formação';
                    _currentPage = 2;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Experiência'),
                //subtitle: const Text(''),
                //trailing: const Icon(Icons.work),
                onTap: () {
                  setState(() {
                    _title = 'Experiência';
                    _currentPage = 3;
                  });
                },
              ),
            ],
          ),
        ),
      );
  }

  _titulo() {
    return AppBar(
      title: Text(_title),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    if (_currentPage == 1) {
      return const Center(child: Text('Tela Pessoal'));
    } else if (_currentPage == 2) {
      return const Formacao();
    } else {
      return const Experiencia();
    }
  }

  _foto(String nomeFoto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
        ),
        child: Image.asset(
        'assets/images/$nomeFoto',
      ),
    );
  }
}

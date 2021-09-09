import 'dart:io';

main() {
  List names = [];
  List ages = [];
  List sex = [];

  for (var i = 0; i < 100; i++) {
    print("Digite o nome da pessoa: ");
    names.add(stdin.readLineSync());

    print("Digite a idade: ");
    ages.add(stdin.readLineSync());

    print("Digite o sexo ('M'/'F'): ");
    var s = stdin.readLineSync();
    if(s == "Masculino") {
        sex.add("M");
    } else if(s == "Feminino") {
      sex.add("F");
    } else {
      sex.add(s);
    }
  }

  for (var i = 0; i < 100; i++) {
    if(sex[i] == "F") {
      print("Nome: " + names[i] + ", Idade: " + ages[i] + ", Sexo: " + sex[i]);
    }
  }
}
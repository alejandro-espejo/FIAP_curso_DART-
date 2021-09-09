import 'dart:io';

main() {
  List names = [];
  List ages = [];

  for (var i = 0; i < 100; i++) {
    print("Digite o nome da pessoa: ");
    names.add(stdin.readLineSync());

    print("Digite a idade: ");
    ages.add(stdin.readLineSync());
  }

  for (var i = 0; i < 100; i++) {
    print("Nome: " + names[i] + ", Idade: " + ages[i]);
  }
}
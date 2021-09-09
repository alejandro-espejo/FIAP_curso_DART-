import 'dart:math';

main() {

}

class Cliente {
  late String nome;
  late String cpf;
  late String dataNascimento;
}

class Conta {
  late int numeroConta;
  late String nomeTitular;
  late int saldo;
  late Cliente cliente;
}

class ContaCorrente extends ContaPoupanca with Conta{
  void Transferencia() {
    print("Função para Transferência");
  }
}

class ContaPoupanca extends Conta{
  void saque() {
    print("Função para saque de dinheiro");
  }
  
  void deposito() {
    print("Função para depositar");
  }
}
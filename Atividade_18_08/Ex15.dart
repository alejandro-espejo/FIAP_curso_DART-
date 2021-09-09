import 'dart:math';

void main() {
  List sequencia = [2];
  var numero = new Random();
  int impar = 3;
  int n = 1;
  
  for (var i = 1; n <= 100; i++) {
    
    n = numero.nextInt(110);
    
    sequencia.add(sequencia[i-1] + impar);
    impar += 2;
  }
  print("Você digitou um valor acima de 100, núm digitado: $n");
  print(sequencia);
}
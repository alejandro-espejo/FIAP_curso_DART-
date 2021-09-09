import 'dart:math';

void main() {
  List sequencia = [];
  var numero = new Random();
 
  var constante = 3;
  
  for (var i = 0; i < 20; i++) {
    sequencia.add(numero.nextInt(15));  
  }
  
  print("Lista: ${sequencia}");
  
  for (var i = 0; i < 20; i++) {
    sequencia[i] = sequencia[i] * constante;
  }
  
  print("Lista multiplicada por $constante: ${sequencia}");
}
import 'dart:math';

void main() {
  List sequencia = [];
  List sequenciaInversa = [];
  var numero = new Random();
  
  for (var i = 0; i < 10; i++) {
    sequencia.add(numero.nextInt(100));  
  }
  
  // Forma inversa
  for (var i = 9; i >= 0; i--) {
    sequenciaInversa.add(sequencia[i]);
  }
  
  print("Lista: ${sequencia}");
  print("Lista invertida: ${sequenciaInversa}");
}
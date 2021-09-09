void main() {
  
  double peso = 76.2;
  double altura = 1.80;
  double calculo = peso / (altura * altura);
  
  String cal = calculo.toStringAsFixed(2);
  
  print("IMC: $cal");
 
  if(calculo >= 18.5 && calculo <= 24.9) {
    print("Peso Ideal");
  } else {
    print("Não esta no peso Ideal");
  }
}
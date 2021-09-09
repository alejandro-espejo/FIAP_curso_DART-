void main() {
  
  double lado1 = 10;
  double lado2 = 10;
  double lado3 = 12;
  
  //String cal = calculo.toStringAsFixed(2);
  
  if ( lado1  < ( lado2 + lado3 ) &&  lado2 < ( lado1 + lado3 ) &&  lado3 < ( lado1 + lado2 ) ) {
    
    print("É um Triângulo");
    if(lado1 != lado2 && lado1 != lado3 && lado2 != lado3) {
      print("Triângulo Escaleno");
    } else if(lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
      print("Triângulo Isósceles");
    } else {
      print("Triângulo Equilátero");
    }
  } else {
    print("Não é um Triângulo");
  }
}
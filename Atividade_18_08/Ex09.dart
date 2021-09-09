void main() {
  
  double peso = 50.2;
  String sexo = "Feminino";
  double altura = 1.61;
  
  double media = peso / (altura * altura);
  
  String m = media.toStringAsFixed(2);
  
  print("Sexo: $sexo");
  print("Resultado: $m");
  
  switch(sexo) {
    case "Feminino":
      if(media < 19) {
        print("Abaixo do peso");
      } else if (media >= 19 && media < 24) {
        print("Peso ideal");
      } else if(media >= 24) {
        print("Acima do peso");
      }
      break;
      
    case "Masculino":
      if(media < 20) {
        print("Abaixo do peso");
      } else if (media >= 20 && media < 25) {
        print("Peso ideal");
      } else if(media >= 25) {
        print("Acima do peso");
      }
      break;
  }
  
}
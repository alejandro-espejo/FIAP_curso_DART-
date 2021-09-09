void main() {
  
  double v0 = 5.2;
  double a = 4;
  int t = 20;
  
  double v = v0 + a * t;
  String resultado = v.toStringAsFixed(2);
  print("Resultado: $resultado");
  
  if(v <= 40) {
    print("Vaículo muito lento");
  } else if(40 < v && v <= 60) {
    print("Velocidade permitida");
  } else if(60 < v && v <= 80) {
    print("Velocidade de cruzeiro");
  } else if(80 < v && v <= 120) {
    print("Veículo rápido");
  } else if(v > 120) {
    print("Veículo muito rápido");
  }
}
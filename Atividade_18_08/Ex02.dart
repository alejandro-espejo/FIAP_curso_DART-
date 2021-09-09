void main() {
  
  List notas = [5, 8, 7, 10];
  double media = 0.0;
  
  for(int i = 0; i < notas.length; i++) {
    media += notas[i];
  }
  
  media = media / 4;
  
  print("Média: $media");
}

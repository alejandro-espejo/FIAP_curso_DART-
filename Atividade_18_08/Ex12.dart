void main() {
  
  int numero = 8;
  
  int intervaloA = 11;
  
  int intervaloB = 25;
  
  
  for(int i = intervaloB; i >= intervaloA; i--) {
    print("$numero X $i = ${numero * i}");
  }
}
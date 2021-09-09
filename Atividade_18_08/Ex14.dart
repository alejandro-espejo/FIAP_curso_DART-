void main() {
  List bergamaschi = [1,1,1];
  
  for(int i = 3; i < 20; i++) {
    bergamaschi.add(bergamaschi[i-1] + bergamaschi[i-2] + bergamaschi[i-3]);
  }
  
  for (int valores in bergamaschi) {
    print(valores);
  }
}
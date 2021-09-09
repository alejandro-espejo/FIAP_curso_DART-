void main() {
  List fibonacci = [1,1];
  
  for(int i = 2; i < 30; i++) {
    fibonacci.add(fibonacci[i-1] + fibonacci[i-2]);
  }
  
  for (int valores in fibonacci) {
    print(valores);
  }
}
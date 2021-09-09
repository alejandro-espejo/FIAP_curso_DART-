void main() {
  
  List produtos = ['Arroz', 'Feijão', 'Macarrão', 'Manteiga', 'Refrigerante']; 
  List valores = [24.00, 7.70, 4.40, 22.50, 6.50];
  
  double totalPagar = 0.0;
  double dinheiro = 100.00;
  
  for (int i = 0; i < valores.length; i++) {
    totalPagar += valores[i];
  }
  
  for (int i = 0; i < produtos.length; i++) {
    print("Produto: ${produtos[i]}, Preço: ${valores[i]}");
  }
  
  double troco = dinheiro - totalPagar;
  String tr = troco.toStringAsFixed(2);
  
  print("Total a Pagar $totalPagar, Troco: $tr");
}
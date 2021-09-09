import 'dart:math';

main() {
  List numbers = [];
  var n = new Random();

  for(var i = 0; i < 10; i++) {
    numbers.add(n.nextInt(50));
  }
  var lowerValue = numbers[0];

  for(var i = 0; i < 10; i++) {
    if(lowerValue > numbers[i]) {
      lowerValue = numbers[i];
    }
  }

  print(numbers);
  print("Menor valor: $lowerValue");
}
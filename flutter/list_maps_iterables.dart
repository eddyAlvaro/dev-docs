//Un iterable es una coleccion de elementos a la que se puede acceder de uno en uno de forma secuencial
//Los iterables no tienen indices, por ello no se puede hacer una busqueda aleatoria de elementos
//Los sets tienen valores unicos, por ello si un iterable con valores duplicados se convierte en set, se eliminan los duplicados
void main() {
  final numbers = [1, 2, 3, 2, 4, 5, 5, 5, 5, 6, 7, 8, 9, 9, 9, 10];

  print('Numbers:  $numbers');
  print('Length: ${numbers.length}');
  print('Index: ${numbers[0]}');
  print('firts: ${numbers.first}');
  print('last: ${numbers.last}');

  print('Reversed: ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;

  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}');
  print('Set: ${reversedNumbers.toSet()}');

  final numberGreaterThan5 = numbers.where((num) {
    return num > 5;
  });

  print('>5 iterable: ${numberGreaterThan5}');
  print('>5 Set : ${numberGreaterThan5.toSet()}');
}

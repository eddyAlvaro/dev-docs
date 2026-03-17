void main() {
  final result = addTwoNumbers(1,2);
  final resultOptional = addTwoNumbersOptional(1,2);
  print('${greetEveryOne()} $result');
  print('${greetEveryOne()} $resultOptional');
}

String greetEveryOne() => 'Hello everyone!';

int addTwoNumbers(int a,int b) => a + b;

int addTwoNumbersOptional(int a,[int b = 0]) => a + b;
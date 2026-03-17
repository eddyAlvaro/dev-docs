void main(){
  streamNumbers().listen((value) {
    print('Valores de stream $value');
  });
}


Stream<int> streamNumbers () async*{

  final listOfNumbers = [1,3,4,5,6,2,3];

  
  for(int number in listOfNumbers){
    await Future.delayed(Duration(seconds: 2));
    yield number;
  }
}
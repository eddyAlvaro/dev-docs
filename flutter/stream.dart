void main(){

  emitNumbers().listen((data){
    print('Emitiendo: $data');
  });
}

Stream<int> emitNumbers (){
  return Stream.periodic( Duration(seconds: 2), (value) {
    // print('desde periodic $value');
    return value;
  }).take(5);
}
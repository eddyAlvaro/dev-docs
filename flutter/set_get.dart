//El guion bajo al inicio de una variable le indica que es una variable privada
//Los assert nos permiten hacer validaciones
void main(){

  final mySquare = Square(side: 10);
  print(mySquare.area);
  mySquare.side = 5;
  print(mySquare.area);
}

class Square {
  double _side;

  Square({required double side})
    : _side = side;

  double get area {
    return _side * _side;
  }

  set side (double value){
    if( value < 0) throw Exception('Value must be positive');
    _side = value;
  }
}
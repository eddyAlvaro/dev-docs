//Los mapas son pares de valores, una key y un value separados por :
//Por lo general en los maps hay varios pares de valores y el value no siempre es del mismo tipo, en estos casos los datos se infieren con un Object
//Cuando declaramos mapas podemos especificar el tipado Map<String, dynamic>
//La key dentro de un map no necesariamente tiene que ser un string, tambien pueden ser números
void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 10,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': <int, String>{1: 'ditto/front.png', 2: 'ditto/back.png'},
  };
  print(pokemon);
  //Para imprimir un valor dentro de un map usamos la key dentro de los corchetes
  print('Name ${pokemon['name']}');

  print('Front ${pokemon['sprites'][1]}');
  print('Back ${pokemon['sprites'][2]}');
}

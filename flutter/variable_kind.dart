//3 comillas 2bles permiten tener textos
//Si no se coloca un tipado en la variable, esta infiere su tipo dependiendo al valor que tenga
//Las listas podemos especificar el tipo de dato que tendran
//Las listas permiten definir el tipo an inicio de la variable y al principio de la inicialización junto al <KIND>[]
//El Dynamic es un tipo de dato especial, puede ser cualquier dato
//Por defecto dynamic es nullable
//Una declaración con dynamic permite redefinir su valor varias veces
//EL dynamic no muestra errores cuando se realiza una operación incorrecta como sumar un caracter null +1
void main() {
  final String pokemon = 'Ditto';
  final int hp = 10;
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/normal.png', 'ditto/shiny.png'];
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = [1, 2, 3, 45];

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
""");
}

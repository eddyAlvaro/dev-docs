
//required para que el parametro sea obligatorio

//override para indicar que se va a sobre escribir un metodo nativo de la clase
void main(){
  final Hero wolverine = Hero('Logan', 'Regeneración');
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name;
  String power;

  Hero(this.name, this.power);

  @override
  String toString() {
    return 'Hero(name: $name, power: $power)';
  }
}
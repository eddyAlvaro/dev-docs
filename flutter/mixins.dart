
//Los mixins van despues de un with
abstract class Animal {}

abstract class Mamifero {}
abstract class Ave {}
abstract class Pez {}

mixin Volador {
  void volar() => print("Estoy volando");
}
mixin Nadador {
  void nadar() => print("Estoy nadando");
}
mixin Caminante {
  void caminar() => print("Estoy caminando");
}

class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminante {}
class Gato extends Mamifero with Caminante {}

class Paloma extends Ave  with Volador{}
class Pato extends Ave  with Volador, Caminante, Nadador{}

class Tiburon extends Pez with Nadador{}
class PezVolador extends Pez with Nadador, Volador{}


void main() {
  final flipper = Delfin();
  flipper.nadar();
  
  final batman = Murcielago();
  batman.caminar();
  batman.volar();

  final namor = Pato();
  namor.caminar();
  namor.nadar();
  namor.volar();
}
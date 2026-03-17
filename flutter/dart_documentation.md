# Documentación Básica de Dart

Esta guía es una síntesis basada en los ejemplos del proyecto para explicar conceptos básicos y avanzados del lenguaje Dart de una forma clara y con ejemplos prácticos.

---

## 1. Conceptos Básicos y Declaración de Variables
> Ref: `hello_world.dart`, `variable_kind.dart`

Todo archivo en Dart debe tener una función principal `main()`, que actúa como punto de entrada de la aplicación. Las instrucciones se terminan con `;`.

**Tipos de Declaración:**
- `var`: Asigna una variable genérica cuyo tipo se infiere.
- `final`: Declara una variable donde el valor fijado en tiempo de ejecución no cambiará.
- `const`: Similar a `final`, pero se fija en tiempo de compilación.
- `late`: Permite declarar una variable sin inicializarla inmediatamente.
- `dynamic`: Un tipo dinámico que permite almacenar cualquier tipo de dato, con la posibilidad de reasignaciones de tipos diferentes.

**Ejemplo Práctico:**
```dart
void main() {
  String myName = "Eddy";
  final int hp = 10;
  final bool isAlive = true;
  dynamic errorMessage = 'Hola';

  errorMessage = true; // 'dynamic' nos deja reasignar un booleano
  
  // Interpolación de variables en un texto usando $ (simple) o ${} (expresión)
  // Textos de múltiples líneas usando tripe comilla
  print(""" 
    Nombre: $myName
    Vida: $hp
    Vivo: $isAlive
    Info: $errorMessage
  """);
}
```

---

## 2. Colecciones: Listas, Sets, Iterables y Mapas
> Ref: `list_maps_iterables.dart`, `maps.dart`

En Dart las colecciones permiten trabajar con múltiples valores, cada una con características específicas.

### Listas, Sets e Iterables
- **Listas**: Se comportan como arreglos, ordenados mediante índices que empiezan en `0`.
- **Iterables**: Son colecciones que se leen en orden sin usar índices aleatorios.
- **Sets**: Son colecciones que no permiten elementos duplicados.

```dart
void main() {
  final numbers = [1, 2, 3, 2, 4, 5, 5, 5];

  print('Índice 0: ${numbers[0]}'); 
  print('Último elemento: ${numbers.last}');
  
  final reversedNumbers = numbers.reversed; // Retorna un Iterable()
  
  print('Iterable -> $reversedNumbers');
  print('Lista -> ${reversedNumbers.toList()}');
  print('Set (sin duplicados) -> ${reversedNumbers.toSet()}');

  // Filtrando iterables
  final numberGreaterThan2 = numbers.where((num) => num > 2);
  print(numberGreaterThan2);
}
```

### Mapas
Estructuras en pares (clave, valor) similares a un JSON o Diccionario.

```dart
void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 10,
    'sprites': <int, String>{1: 'front.png', 2: 'back.png'},
  };

  print('Nombre: ${pokemon['name']}');
  print('Primer sprite: ${pokemon['sprites'][1]}'); // Accediendo a valores anidados
}
```

---

## 3. Funciones
> Ref: `functions.dart`

Las funciones pueden retornar valores, tener parámetros opcionales u obligatorios, y usar la sintaxis _fat arrow_ (`=>`) para retornos en línea.

```dart
void main() {
  print(greetEveryOne());
  print(addTwoNumbers(5, 5));
  print(addTwoNumbersOptional(5)); // Manda 5 y el valor a b por defecto(0)
}

// Función con sintaxis lambda 
String greetEveryOne() => '¡Hola a todos!';

// Función tradicional mandando parámetros
int addTwoNumbers(int a, int b) => a + b;

// Parámetros opcionales (encerrados en corchetes)
int addTwoNumbersOptional(int a, [int b = 0]) => a + b;
```

---

## 4. Clases y Programación Orientada a Objetos
> Ref: `classes.dart`, `name_constructors.dart`, `set_get.dart`, `abstract_class.dart`, `mixins.dart`

### Clases, Constructores y Data privada
Se utilizan las palabras reservadas como `this` para inicializar y se pueden declarar métodos especiales (como *Named constructors*). Dart admite getters y setters para variables encapsuladas privadas formadas con un prefijo de guion bajo `_`.

```dart
class Square {
  double _side;

  // El assert valida condiciones al tiempo de depuración
  Square({required double side}) : _side = side;

  // Getter
  double get area => _side * _side;

  // Setter
  set side(double value) {
    if (value < 0) throw Exception('El valor no puede ser negativo');
    _side = value;
  }
}

class Hero {
  String name;
  String power;
  bool isAlive;

  // Constructor explícito
  Hero(this.name, this.power, this.isAlive);

  // Constructor por nombre (Named Constructor)
  Hero.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? 'Undefined',
      power = json['power'] ?? 'Undefined',
      isAlive = json['isAlive'] ?? true; 
}
```

### Clases Abstractas y Métodos de Herencia (`extends`, `implements` y `mixins`)
- `extends`: Permite aplicar herencia total de otra clase.
- `implements`: Obliga a la clase redefinir explícitamente aquellos métodos y propiedades, útil para contratos en interfaces.
- `mixins` (`with`): Permite incluir comportamiento o código genérico en múltiples jerarquías de clase.

```dart
abstract class Animal {}
mixin Volador { void volar() => print("Volando..."); }
mixin Caminante { void caminar() => print("Caminando..."); }

class Paloma extends Animal with Volador, Caminante {}

void main() {
  final paloma = Paloma();
  paloma.volar(); // Uso heredado de mixin
}
```

---

## 5. Programación Asíncrona (Futures y Streams)
> Ref: `futures.dart`, `async_await.dart`, `try_catch_on_finally.dart`, `stream.dart`, `stream_await.dart`

Dart utiliza recursos de asincronía para operaciones duraderas sin bloquear el hilo de ejecución principal de la UI o aplicación en general.

### Futures, Async y Await
Un `Future` representa el resultado en diferido de una llamada asíncrona. Se manejan típicamente con `.then()` / `.catchError()` o su sintaxis más limpia con `async` / `await` junto a `try / catch`. Dentro de `catch`, la palabra clave `on` permite capturar un error muy exacto:

```dart
void main() async {
  print('Inicio de solicitud...');
  try { 
    final response = await httpRequest();
    print(response);
  } on Exception catch (err) {
    print('Entró en excepción específica: $err');
  } catch (err) {
    print('Ocurrió un error inesperado: $err');
  } finally {
    print('Bloque ejecutado independientemente de si hay error o no');
  }
  print('Fin');
}

Future<String> httpRequest() async {
  await Future.delayed(Duration(seconds: 2));
  throw Exception('Falló al conectar');
}
```

### Streams
Un `Stream` son flujos de datos asíncronos en los que podemos suscribirnos (`.listen()`):
Nos sirven ya sea observando tiempos (`Stream.periodic`) o usando generadores asíncronos (`async*`) devolviendo los valores por medio de `yield`.

```dart
void main() {
  streamNumbers().listen((data) {
    print('Stream emitiendo el número -> $data');
  });
}

// async* indica que la función devolverá un Stream a lo largo del tiempo 
Stream<int> streamNumbers() async* {
  final values = [1, 2, 3];
  for (int number in values) {
    await Future.delayed(Duration(seconds: 1));
    yield number; // Añade el número al flujo principal
  }
}
```

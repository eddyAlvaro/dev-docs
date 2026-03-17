# Mejores Prácticas y Recomendaciones en Dart

Para escribir un código en Dart que sea limpio, mantenible y eficiente, se recomienda seguir las convenciones oficiales y buenas prácticas establecidas por la comunidad. Aquí tienes una lista de las sugerencias más importantes:

---

## 1. Convenciones de Nomenclatura (Naming Conventions)

- **Clases, Enums, Typedefs y Extensiones:** Usa `PascalCase` (UpperCamelCase).
  ```dart
  class UserProfile {}
  enum UserRole { admin, guest }
  ```
- **Variables, Constantes, Funciones y Parámetros:** Usa `camelCase` (lowerCamelCase).
  ```dart
  final int maxItemCount = 10;
  void fetchUserProfile() {}
  ```
- **Archivos y Directorios:** Usa `snake_case`. En vez de `UserProfile.dart`, utiliza `user_profile.dart`.

## 2. Declaración de Variables: `final` vs `const` vs `var`

- **Prefiere `final` sobre `var`**: Si el valor de una variable no va a reasignarse en el futuro, declárala como `final`. Esto previene reasignaciones accidentales y comunica la intención clara en el código.
- **Usa `const` donde sea posible**: Para valores y colecciones que no van a cambiar en absoluto y se conocen en tiempo de compilación. Usar `const` mejora el rendimiento y previene el consumo innecesario de memoria.

```dart
// Recomendado
const double pi = 3.14159;
final currentTime = DateTime.now(); // No puede ser const porque el tiempo se calcula en tiempo de ejecución.

// Evitar si el valor no cambiará:
var userAge = 25; 
```

## 3. Manejo de Cadenas de Texto (Strings)

- **Interpolación de cadenas**: Usa la interpolación (`$variable` o `${expresión}`) en lugar de concatenar cadenas con `+`. Es más legible y eficiente.

```dart
final name = "Eddy";
final age = 22;

// Recomendado
print('Hola, mi nombre es $name y tengo $age años.');

// Evitar
print('Hola, mi nombre es ' + name + ' y tengo ' + age.toString() + ' años.');
```

## 4. Estilos de Funciones

- **Evita omitir tipos de retorno**: Siempre especifica el tipo de retorno de las funciones, incluso si es `void`. Esto ayuda en la auto-documentación y previene comportamientos dinámicos no deseados.
- **Usa *arrow functions* (`=>`) para funciones simples**: Si tu función consiste en una sola expresión, la sintaxis de flecha ayuda a tener código más limpio.

```dart
// Recomendado
bool isValidAge(int age) => age >= 18;

// Permisible pero con más código
bool isValidAgeVerbose(int age) {
  return age >= 18;
}
```

## 5. Colecciones

- **Usa colecciones literales**: En Dart, es preferible utilizar la sintaxis literal `[]` para listas, `{}` para Sets y Mapas en vez de instanciar constructores como `List()`, `Set()` o `Map()`.

```dart
// Recomendado
final names = <String>['Logan', 'Peter'];
final uniqueIds = <int>{1, 2, 3};
final user = <String, dynamic>{'name': 'Logan'};

// Evitar
final namesList = List<String>.empty(growable: true);
```

- **Operadores de Colecciones**: Utiliza operadores como el *spread* (`...`) y el *collection if* para construir colecciones condicionalmente.

```dart
final hasAdminRights = true;
final roles = [
  'guest',
  'user',
  if (hasAdminRights) 'admin', // Collection if
];

final otherRoles = ['moderator', ...roles]; // Spread operator
```

## 6. Asincronismo: `async`/`await` vs `then()`

- **Prefiere `async/await`**: Aunque Dart permite usar encadenamientos con `.then()` para manejar `Future`, el uso de `async/await` en un bloque `try-catch` hace que el código asíncrono parezca síncrono, mejorando notablemente su lectura y gestión de errores.

```dart
// Recomendado
Future<void> fetchAndPrint() async {
  try {
    final data = await fetchNetworkData();
    print(data);
  } catch (e) {
    print('Error: $e');
  }
}

// Evitar el código "spaghetti" (callback hell)
void fetchAndPrintOld() {
  fetchNetworkData().then((data) {
    print(data);
  }).catchError((e) {
    print('Error: $e');
  });
}
```

## 7. Manejo de Errores e Independencia

- **Captura excepciones específicas**: No captures cualquier iteración de errores libremente con un `catch` vacío sin dar seguimiento a posibles excepciones esperadas. Intenta utilizar `on [ExceptionType] catch (e)` para excepciones identificables.

```dart
try {
  // operacion...
} on FormatException catch (e) {
  print('Error de formato: $e');
} catch (e) {
  print('Eror desconocido: $e');
}
```

## 8. Evitar `dynamic`

- **No abuses de `dynamic`**: El tipo `dynamic` burla el análisis de tipado en tiempo de compilación. Usa los genéricos y el tipado fuerte en todo lugar sea posible para evitar que los fallos ocurran solo cuando la app está activa (*runtime checks*).

Si recibes datos de los cuales no conoces la forma exacta (como respuestas en JSON), considera definir clases (Modelos) con constructores `fromJson()` (como vimos en tu proyecto con `Hero.fromJson`) para convertir la estructura genérica en un tipo estrictamente estructurado en cuanto sea posible.

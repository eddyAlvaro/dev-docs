//TOdo archivo de dart debe empezar con una función main
//Si no se especifica un tipo a la función, por defecto las funciones son de tipo Dynamic
//Cada linea de dart debe finalizar con un ;
//Una variable generica se declara con var
//Al declarar una variable con final, este evita que se pueda cambiar el valor de la variable
//late nos permite declarar una variable sin inicializarla
//La declaración del tipo va antes del nombre de la función o variable
//Al declarar una variable con const, este evita que se pueda cambiar el valor de la variable, este se ejecuta en tiempo de construcción de la aplicación
//Con $ podemos interpolar en cadenas de texto
//Para ejecutar operaciones o metodos dentro de una interpolación, debemos usar $ y encerrar el contenido dinamico con ()
void main() {
  //var myName = "Eddy";
  //final myName = "Eddy";
  //const myName = "Eddy";
  String myName = "Eddy";
  print("Hola $myName");
}

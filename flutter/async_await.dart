void main() async{
  print('Inicio de programa');
  try{ 
    final response = await httpRequest();
    print(response);
  }catch(error){
    print('Error al hacer la petición: $error');
  }
  print('Fin de programa');

}

Future<String> httpRequest () async {
  await Future.delayed(Duration(seconds: 2));
  throw 'Error al hacer la petición';
  // return 'Esta es una petición HTTP';
}
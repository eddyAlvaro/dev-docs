void main() async{
  print('Inicio de programa');
  try{ 
    final response = await httpRequest();
    print(response);
  } on Exception catch (error){
    print('Entró en una excepción $error');
  }
  catch(error){
    print('Opps!: $error');
  } finally {
    print('saliendo del try catch');
  }
  print('Fin de programa');

}

Future<String> httpRequest () async {
  await Future.delayed(Duration(seconds: 2));
  
  throw Exception('Ocurrió una excepción');
  // throw 'Error al hacer la petición';
  // return 'Esta es una petición HTTP';
}
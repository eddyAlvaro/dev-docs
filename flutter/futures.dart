void main(){

 print('Antes del http');

 httpGet('URL').then( (value) => print(value)).catchError((error){
  print('Error: $error');
 });

 print('Despues del http');  
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 2), () {
    throw ('Error al hacer la peticion');
    // return 'Este es un metodo HTTP';
  }); 
}
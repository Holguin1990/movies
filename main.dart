import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';


/*desde aqui se empieza a construir toda la aplicación, el primer widget que se inicia
es el provider y tiene logica por que yo necesito tener toda la información antes de que
cargue toda la misma
*/
void main() => runApp(const Appstate());

 class Appstate extends StatelessWidget {
  const Appstate({super.key});

  
    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false),
          /*  
          lazy(debe estar en false) es una propiedad del changenitifier que me permite inicializar la instancia
          del provider en este caso la de la clase moviesprovider que es la clase que va a
          contener toda la información que yo necesito mostrar para que mi aplicación inicie
          correctamente.
          */ 
        ], 
        child: const MyApp(),
      );
    }
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomeScreen(),
        'details': ( _ ) => DetailScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
      
    );
  }
}
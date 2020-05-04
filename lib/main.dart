import 'package:app_peliculas/src/pages/detalle_page.dart';
import 'package:app_peliculas/src/pages/inicio_page.dart';

import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio-page',
      routes: {
        'inicio-page' : (BuildContext context) => InicioPage(),
        'detalle-page' : (BuildContext context) => DetallePage()
      }
    );
  }
}
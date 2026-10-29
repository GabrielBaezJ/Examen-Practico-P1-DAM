import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/pantallas/asistencia_pantalla.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';
import 'view_model/asistencia_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AsistenciaViewmodel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de Asistencia',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Color(0xFF3949AB)),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioPantalla(),
        '/principal': (context) => AsistenciaPantalla(),
        '/resultados': (context) => ResultadoPantalla(),
      },
    );
  }
}

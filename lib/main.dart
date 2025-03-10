import 'package:flutter/material.dart';
import 'screens/login_register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      // TODO: Realmente el home es donde se encuentra la camara y la barra de navegación
      // pero para hacer pruebas y organizar las ventanas está puesta la ventana de bienvenida
      home: const LoginRegister(),
    );
  }
}

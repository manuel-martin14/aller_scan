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
      // TODO: Implementar algún tipo de bandera para que se muestre solo
      // cuando el usuario no haya iniciado sesión o no se haya registrado
      home: const LoginRegister(),
    );
  }
}

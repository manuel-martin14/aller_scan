import 'package:flutter/material.dart';

import 'package:aller_scan/screens/change_password.dart';
import 'package:aller_scan/screens/home.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    // Clave global para el formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para validar que el usuario a introducido datos en los campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordInvisible = true;

  // Método para validar
  void _submitForm() {
    // Si es nulo (?) le asignamos por defecto el valor false con el operando ??
    // en caso de no ser nulo o false, se cumplirá la condición
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Consultar base de datos. En caso de existir el usuario accede

      // Esto elimina todas las rutas anteriores de la pila de navegación de manera que una vez en el home
      // el usuario no puede retroceder a las ventanas anteriores de manera que se evita que una vez iniciado sesión,
      // vuelva a la ventana de inicio de sesión.
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
        "AllerScan",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35)
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: 
                    Text("Inicio de sesión",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25)
                    ),
                ),
                SizedBox(height: 100),
                Center(
                  child: 
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "email@dominio.com",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 204, 202, 202)
                      ),
                      validator: (value) {
                        return validateEmail(value);
                      }
                    )
                ),
                SizedBox(height: 20),
                Center(
                  child: 
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "contraseña",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 204, 202, 202),
                        suffixIcon: IconButton(
                        icon: Icon(
                            _passwordInvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              // Cambiar el estado
                              _passwordInvisible = !_passwordInvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordInvisible,
                      maxLength: 25,
                      validator: (value) {
                        return validatePassword(value);
                      },
                    )
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ha olvidado su contraseña?"),
                    Text("No se preocupe, para restaurarla haga"
                    ),
                    GestureDetector(
                      onTap: () {
                        // Mostrar ventana para restaurar contraseña
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangePassword()),
                        );
                      },
                      child: Text(
                        "click aquí",
                        style: TextStyle(color: const Color.fromARGB(255, 33, 54, 243), decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(onPressed: () {
                    _submitForm();
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 110,
                      vertical: 12)
                  ),
                  child: Text("Continuar")),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  String? validatePassword(String? value) {
                          if (value == null || value.isEmpty) {
      return "Introduzca una contraseña";
    }
    if (value.length < 6 || !RegExp(r'^(?=.*[!@#\$%\^])').hasMatch(value)) {
      return "Mínimo 6 caracteres y al menos uno especial \nentre estos !@#\$%^";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Introduzca un correo";
    }
    // Expresión regular simple para validar el correo
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
      return "Introduzca un correo válido";
    }
    return null;
  }
}
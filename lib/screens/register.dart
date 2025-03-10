import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Clave global para el formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para validar que el usuario a introducido datos en los campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordInvisible = true;
  bool _ceckBoxValue = true;

  // Método para validar
  void _submitForm() {
    // Si es nulo (?) le asignamos por defecto el valor false con el operando ??
    // en caso de no ser nulo o false, se cumplirá la condición
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Insertar usuario en la base de datos y mostrar lista de alergenos
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
                    Text("Registro",
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
                        if (value == null || value.isEmpty) {
                          return "Introduzca un correo";
                        }
                        // Expresión regular simple para validar el correo
                        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                          return "Introduzca un correo válido";
                        }
                        return null;
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
                            // Cambiar el estado de visualización de la contraseña
                            setState(() {
                              _passwordInvisible = !_passwordInvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordInvisible,
                      maxLength: 25,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Introduzca una contraseña";
                        }
                        if (value.length < 6 || !RegExp(r'^(?=.*[!@#\$%\^])').hasMatch(value)) {
                          return "Mínimo 6 caracteres y al menos uno especial \nentre estos !@#\$%^";
                        }
                        return null;
                      },
                    )
                ),
                //SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: _ceckBoxValue, onChanged: (bool? value) {
                      setState(() {
                        _ceckBoxValue = value ?? false;
                      });
                    }),
                    Text("Recibir correos de la aplicación")
                  ]
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
}
import 'package:aller_scan/service/user_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Servicios
  final UserService _userService = UserService();

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
                        return _userService.validateEmail(value);
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
                        return _userService.validatePassword(value);
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
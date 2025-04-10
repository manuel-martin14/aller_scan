import 'package:aller_scan/service/user_service.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget{
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  // Servicios
  final UserService _userService = UserService();

  // Clave global para el formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para validar que el usuario a introducido datos en los campos
  final TextEditingController _firstPasswordController = TextEditingController();
  final TextEditingController _secondPasswordController = TextEditingController();

  bool _passwordInvisible = true;

  // Método para validar
  void _submitForm() {
    // Si es nulo (?) le asignamos por defecto el valor false con el operando ??
    // en caso de no ser nulo o false, se cumplirá la condición
    if (_formKey.currentState?.validate() ?? false) {
      // Notifica al usuario que la contraseña ha sido actualiza y lo retorna a la ventana anterior
      // por lo que da igual desde donde se cambie la contraseña que siempre volverá a donde corresponde
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Contraseña cambiada exitosamente")),
      );
       Navigator.pop(context);
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
                    Text("Cambiar contraseña",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25)
                    ),
                ),
                SizedBox(height: 100),
                Center(
                  child: 
                    TextFormField(
                      controller: _firstPasswordController,
                      decoration: InputDecoration(
                        hintText: "contraseña nueva",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 204, 202, 202),
                      ),
                      obscureText: _passwordInvisible,
                      maxLength: 25,
                      validator: (value) {
                        return _userService.validatePassword(value,
                            firstPasswordController: _firstPasswordController.text,
                            secondPasswordController: _secondPasswordController.text
                        );
                      },
                    )
                ),
                SizedBox(height: 20),
                Center(
                  child: 
                    TextFormField(
                      controller: _secondPasswordController,
                      decoration: InputDecoration(
                        hintText: "repita la contraseña",
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
                        return _userService.validatePassword(value,
                            firstPasswordController: _firstPasswordController.text,
                            secondPasswordController: _secondPasswordController.text
                        );
                      },
                    )
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
                  child: Text("Confirmar")),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:aller_scan/screens/login.dart';
import 'package:aller_scan/screens/register.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: 
                  Text("¿Estás listo para empezar?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25)
                  ),
              ),
              SizedBox(height: 100),
              Center(
                child: 
                  Text("Cree una cuenta en un instante",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
                  ),
              ),
              SizedBox(height: 20),
              Center(
                child: 
                  ElevatedButton(onPressed: () {
                    // Permite moverse entre ventanas
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 110, 
                      vertical: 12)
                    ),
                  child: Text("Registrarse")),
              ),
              SizedBox(height: 20),
              Center(
                child: 
                  Text("o",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
                  ),
              ),
              SizedBox(height: 20),
              Center(
                child: 
                  ElevatedButton(onPressed: () {
                    // Permite moverse entre ventanas
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 110, 
                      vertical: 12)
                    ),
                  child: Text("Inicie sesión")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
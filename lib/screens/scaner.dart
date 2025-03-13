import 'package:flutter/material.dart';

// Ventana donde el usuaio puede escanear los productos
class Scanner extends StatelessWidget {
  const Scanner({super.key});
  
  // Lo más seguro que toque hacer la clase Statefull ya que
  // la camara será en tiempo real

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Escanear producto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                )
              ),
              SizedBox(height: 100),
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                // Aquí realmente debe aparecer la camara para poder escanear el
                // producto, pero como guía está un icono
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}
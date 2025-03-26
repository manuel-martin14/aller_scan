class UserService {
  String? validatePassword(String? value, {String? firstPasswordController, String? secondPasswordController}) {
    if (value == null || value.isEmpty) {
      return "Introduzca una contraseña";
    }
    if (value.length < 6 || !RegExp(r'^(?=.*[!@#\$%\^])').hasMatch(value)) {
      return "Mínimo 6 caracteres y al menos uno especial \nentre estos !@#\$%^";
    }
    if (firstPasswordController != secondPasswordController) {
      return "Las contraseñas no coinciden";
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
// PAQUETES PARA GENERAR TOKENS
import 'package:uuid/uuid.dart';

// PAQUETES PARA GUARDAR INFORMACIÓN EN JSON
import 'dart:convert';
import 'dart:io';

class Examples {
  String generateUniqueToken() {
    var uuid = Uuid();
    // Generar un UUID (Token) único
    String token = uuid.v4();
    return token;
  }

  void main() {
    String userToken = generateUniqueToken();
    print("Token único generado: $userToken");
  }

  void saveUserPreferences(bool isDarkMode, String language, bool notificationsEnabled, String userName) async {
    final file = File('path/to/local/storage/preferences.json');

    Map<String, dynamic> preferences = {
      'isDarkMode': isDarkMode,
      'language': language,
      'notificationsEnabled': notificationsEnabled,
      'lastLogin': DateTime.now().toIso8601String(), // Fecha en formato ISO 8601
      'userName': userName,
      'appVersion': '1.0.0', // Puedes obtener esta versión programáticamente si lo deseas
    };

    String jsonString = jsonEncode(preferences);
    await file.writeAsString(jsonString);

    print('Preferencias del usuario guardadas');
  }

}
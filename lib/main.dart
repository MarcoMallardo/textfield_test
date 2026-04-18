import 'package:flutter/material.dart';

/// Función que valida si una cadena de texto representa un correo electrónico válido.
/// Utiliza una expresión regular para verificar el formato estándar de un email.
///
/// La expresión regular utilizada es: r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
///
/// Explicación de la regex:
/// - ^ : Inicio de la cadena.
/// - [a-zA-Z0-9._%+-]+ : Una o más letras, números o caracteres especiales permitidos antes del @.
/// - @ : El símbolo @ obligatorio.
/// - [a-zA-Z0-9.-]+ : Una o más letras, números, puntos o guiones para el dominio.
/// - \. : Un punto literal.
/// - [a-zA-Z]{2,} : Al menos dos letras para la extensión del dominio (ej. com, org).
/// - $ : Fin de la cadena.
///
/// Esta regex es básica y no cubre todos los casos extremos de RFC 5322, pero es suficiente para validación común.
/// Para validaciones más estrictas, considera usar bibliotecas especializadas.
bool mailIsValid(String mail) {
  // Definimos la expresión regular para validar el email
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Verificamos si el email coincide con la regex
  return emailRegex.hasMatch(mail);
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String titleText = 'Bienvenido';
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(titleText, style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: TextField(
                controller: emailInput,
                decoration: InputDecoration(
                  hintText: 'Ingrese su correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.alternate_email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: TextField(
                controller: passwordInput,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  String email = emailInput.text;
                  String pass = passwordInput.text;
                  if (email.isNotEmpty && pass.isNotEmpty) {
                    if (mailIsValid(email)) {
                      titleText = 'Correo válido';
                    } else {
                      titleText = 'Correo inválido';
                    }
                  } else {
                    titleText = 'Ingrese su mail y contraseña';
                  }
                  setState(() {});
                }, 
                child: Text('Confirmar')
              ),
            ),
          ],
        ),
      ),
    );
  }
}

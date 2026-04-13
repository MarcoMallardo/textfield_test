import 'package:flutter/material.dart';

bool mailIsValid(String mail) {
  bool tieneUnArroba = (RegExp(RegExp.escape('@')).allMatches(mail).length == 1);
  return tieneUnArroba /*falta lo demas!! */;
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
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleText, style: TextStyle(fontSize: 24),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'Ingrese su correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Confirmar'),
            )
          ]
        )
      ),
    );
  }
}
